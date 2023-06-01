import 'dart:convert';

import 'package:analyzer/dart/analysis/features.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:code_builder/code_builder.dart' as code;
import 'package:code_builder/code_builder.dart';
import 'package:collection/collection.dart';

import 'package:dart_style/dart_style.dart';
import 'package:file/file.dart';
import 'package:glob/glob.dart';
import 'package:path/path.dart' as path;

import 'package:note/core.dart';
import 'package:analyzer/dart/analysis/utilities.dart' as analyzer_util;
import 'package:watcher/watcher.dart';
import 'package:yaml_edit/yaml_edit.dart';

String _LIB_ROOT = "lib";
String _NOTES_ROOT = "lib/notes/";
Glob _NOTE_GLOB = Glob("{**/note.dart,note.dart}");

class NotesGenerator {
  final DartFormatter _fmt;
  final FileSystem fs;
  final String packageBaseName;
  final String projectDir;
  late final String libDir;
  late final String noteRootDir;

  NotesGenerator({
    required this.packageBaseName,
    required this.fs,
    required String projectDir,
    DartFormatter? fmt,
  })  : projectDir = path.normalize(projectDir),
        _fmt = fmt ?? DartFormatter(pageWidth: 120) {
    libDir = path.join(this.projectDir, _LIB_ROOT);
    noteRootDir = path.join(this.projectDir, _NOTES_ROOT);
  }

  Stream<WatchEvent> watch() async* {
    var watcher = DirectoryWatcher(noteRootDir);
    await for (WatchEvent e in watcher.events) {
      if (!_NOTE_GLOB.matches(e.path)) {
        yield e;
        continue;
      }
      var file = fs.file(e.path);
      var pubspec = await _pubspec();
      NoteLib noteLib = NoteLib(file: file, noteGenerator: this);

      switch (e.type) {
        case ChangeType.ADD || ChangeType.MODIFY:
          await _gen_note_g_dart(fs.file(e.path));
          pubspec.noteAssetsAdd(noteLib.asset);
        case ChangeType.REMOVE:
          var noteAsset = path.relative(file.parent.path, from: projectDir);
          pubspec.noteAssetsRemove(noteAsset);
        default:
          throw Exception("unknown ChangeType ${e.type}");
      }

      await gen_notes_g_dart();
      await pubspec.save();
      yield e;
    }
  }

  // ignore: non_constant_identifier_names
  Future<({File file, List<NoteLib> notes})> gen_notes_g_dart() async {
    var notes = await _noteFiles
        .map((e) => NoteLib(file: e, noteGenerator: this))
        .toList();
    return (file: await _genNotesFromList(notes), notes: notes);
  }

  Future<void> genSpaceJson(List<_NoteAnalyzer> notes) async {
    // var spaceJsonFile = fs.file(path.join(projectDir, "note_space.json"));
    // NoteSpaceConf spaceConf =
    // NoteSpaceConf.fromJSon(jsonDecode(await spaceJsonFile.readAsString()));
  }

  // ignore: non_constant_identifier_names
  Future<List<_NoteAnalyzer>> gen_all_note_g_dart() async {
    var result = await _noteFiles
        .map((e) => _gen_note_g_dart(e))
        .asyncExpand((e) => e.asStream())
        .toList();

    var noteLibs =
        result.map((e) => NoteLib(file: e.file, noteGenerator: this));
    var pubspec = await _pubspec();
    pubspec.noteAssetsUpdate(noteLibs.map((e) => e.asset).toList());
    await pubspec.save();
    return result;
  }

  Stream<File> get _noteFiles {
    return _NOTE_GLOB
        .listFileSystem(fs, root: noteRootDir)
        .where((e) {
          return true;
        })
        .where((e) => e is File)
        .map((e) => e as File);
  }

  // ignore: non_constant_identifier_names
  Future<_NoteAnalyzer> _gen_note_g_dart(File file) async {
    var result = _NoteAnalyzer.parse(file: file, fmt: _fmt);
    // async write file
    File generated = await result._genFile(result._collectInfo());
    _log("gen note: ${generated}");
    return result;
  }

  Future<Pubspec> _pubspec() async {
    return Pubspec.parseFile(fs.file(path.join(projectDir, "pubspec.yaml")));
  }

  Future<File> _genNotesFromList(Iterable<NoteLib> noteLibs) async {
    var fields = noteLibs.map((noteLib) {
      return """
           final Note ${noteLib.name} = put2(
            "${noteLib.noteKey}",
            ${noteLib.name}_g.noteInfo(),
            () => ${noteLib.name}_
                .loadLibrary()
                .then((value) => ${noteLib.name}_.page));
             """;
    }).join("\n");
    Library libGen = Library((b) => b
      ..comments.addAll([
        "/// Generated by gen_maters.dart, please don't edit! ",
        "ignore_for_file: library_prefixes, non_constant_identifier_names"
      ])
      ..directives.addAll(noteLibs.map((lib) {
        return code.Directive.importDeferredAs(lib.package, "${lib.name}_");
      }))
      ..directives.addAll(noteLibs.map((lib) {
        return code.Directive.import(lib.packageOf("note.g.dart"),
            as: "${lib.name}_g");
      }))
      ..body.add(
        code.Code("""
      import 'package:note/note_page.dart';

      abstract class BaseNotes {
        static final Note<void> rootroot = Note.root();
        static Note<C> put2<C>(String path, NoteSourceData noteInfo, DeferredNoteConf deferredConf) {
          return rootroot.put(path,noteInfo,deferredConf);
        }
        $fields
      }
      """),
      ));

    String toCode =
        '${libGen.accept(DartEmitter(allocator: Allocator.none, orderDirectives: true, useNullSafetySyntax: true))}';
    await fs.file("lib/notes.g.dart").writeAsString(toCode);
    // 写2次文件，方便调试，如果格式化出错，还可以看下上面未格式化的版本看看哪错了
    return fs.file("lib/notes.g.dart").writeAsString(_fmt.format(toCode));
  }

  NoteLib noteOf(String notePath) {
    return NoteLib(file: fs.file(notePath), noteGenerator: this);
  }
}

// // Generated by note_dev_gen.dart, please don't edit!
// // ignore_for_file: library_prefixes, non_constant_identifier_names
//
// import 'package:note/note_page.dart';
// import 'package:flutter_note/1.welcome/page.dart' deferred as welcome_;
// import 'package:flutter_note/1.welcome/page.g.dart' as welcome_g;
// import 'package:flutter_note/note_app.dart';
//
// mixin PathsMixin {
//   final Note welcome = put2(
//       "/1.welcome",
//       (shortTitle: "welcome",),
//       welcome_g.noteInfo,
//           () => welcome_
//           .loadLibrary()
//           .then((value) => welcome_.page, onError: onError));
// }

class NoteLib {
  final String noteRootDir;
  final String libDir;
  final String packageBaseName;
  final File file;
  late final CompilationUnit unit;
  final String projectDir;
  NoteLib({
    required this.file,
    required NotesGenerator noteGenerator,
  })  : libDir = noteGenerator.libDir,
        packageBaseName = noteGenerator.packageBaseName,
        noteRootDir = noteGenerator.noteRootDir,
        projectDir = noteGenerator.projectDir;

  String get noteKey {
    String result = path.dirname(path.relative(file.path, from: noteRootDir));
    return result == "." ? "/" : path.join("/", result);
  }

  String get package =>
      "package:$packageBaseName/${path.relative(file.path, from: libDir)}";

  String get asset => "${path.relative(file.parent.path, from: projectDir)}/";

  /// note name平整化：
  /// lib/notes/1.a/b/page.dart  ---> a_b
  String get name {
    String dir = noteKey;
    if (dir == "/") {
      return "root";
    }
    var names = dir.split(path.separator).where((e) => e.isNotEmpty);
    return names
        .map((e) => e
            .replaceAll(RegExp("^\\d+\."), "") // 1.note-self -> note_note-self
            .replaceAll(".", "_")
            .replaceAll("-", "_")
            .replaceAll("&", "_")
            .replaceAll("*", "_")
            .replaceAll("*", "_")
            .replaceAll("@", "_"))
        .join("_");
  }

  String packageOf(String dartFileName) {
    String noteLibDir = path.dirname(path.relative(file.path, from: libDir));
    return "package:$packageBaseName/${noteLibDir}/$dartFileName";
  }
}

enum _CellType { header, body, tail }

typedef _CellInfo = ({
  String cellType,
  int offset,
  int end,
  List<Statement> cellStatements,
  List<
      ({
        String nodeType,
        AstNode node,
      })> specialNodes,
});

typedef _NoteInfo = ({
  String code,
  List<_CellInfo> cells,
});

class _NoteAnalyzer {
  final File file;
  final DartFormatter fmt;

  late final CompilationUnit unit;
  late final String content;

  _NoteAnalyzer.parse({
    required this.file,
    required this.fmt,
  }) {
    var parseResult = analyzer_util.parseFile(
        //analyzer need must absolute and normalize
        path: path.absolute(path.normalize(file.path)),
        featureSet: FeatureSet.latestLanguageVersion());
    unit = parseResult.unit;
    content = parseResult.content;
  }

  FunctionDeclaration? get _buildFunction {
    var whereBuild = unit.declarations
        .whereType<FunctionDeclaration>()
        .where((e) => "${e.name}" == "build");
    return whereBuild.isEmpty ? null : whereBuild.first;
  }

  _NoteInfo _collectInfo() {
    var findBuild = _buildFunction;
    if (findBuild == null) {
      _log(" ${file.path} [build] func not found, so it is not a note");
      return (
        code: content,
        cells: [
          (
            cellType: _CellType.header.name,
            offset: 0,
            end: unit.end,
            cellStatements: [],
            specialNodes: [],
          )
        ],
      );
    }

    var buildBody = findBuild.functionExpression.body;
    assert(buildBody is BlockFunctionBody,
        "build() func only support Block Function, but(${buildBody.runtimeType})");
    var buildBodyBlock = (buildBody as BlockFunctionBody).block;

    List<_CellInfo> body = [];
    List<Statement> cellStatements = [];
    int offset = buildBodyBlock.offset + 1;
    for (var st in buildBodyBlock.statements) {
      var statementType = _cellStatementType(st);

      // log("statement runtimeType:${st.runtimeType} - statementType:$statementType - offset:${st.offset} len:${st.length} end:${st.end}    file.len:${content.length} ,unit.len:${unit.length}  ");
      // log("---${content.toString().safeSubstring(st.offset, st.offset + 20)}---");

      if (statementType == _CellStatementType.normal) {
        cellStatements.add(st);
        continue;
      }
      if (statementType == _CellStatementType.line) {
        // Submit previously collected statements first
        // Cell boundary line without builder :  code above line statements
        // The line [cellStatementType.line] was ignored

        body.add((
          cellType: _CellType.body.name,
          offset: offset,
          end: st.offset,
          cellStatements: cellStatements,
          specialNodes: _collectRunInCellStatements(cellStatements),
        ));
        //reset collect
        cellStatements = [];

        // The starting point of the new cell is located below the line statement
        offset = st.end;
        continue;
      }

      throw Exception("not here! statementType:$statementType  statement:$st");
    }

    // Finally, add a collectCellStatements to cell, as the last cell
    body.add((
      cellType: _CellType.body.name,
      offset: offset,
      end: buildBodyBlock.rightBracket.offset,
      cellStatements: cellStatements,
      specialNodes: _collectRunInCellStatements(cellStatements),
    ));

    //  build(BuildContext context, Pen pen, MainCell print){
    // ↑_____________________________________________________↑_______________
    // findBuild.offset                                     buildBodyBlock.leftBracket.end
    //
    //  }  // build end
    //  ↑_____________________________________________________
    //  buildBodyBlock.rightBracket.offset
    //
    //  }  // build end
    //  _↑_____________________________________________________
    //  findBuild.end

    return (
      code: content,
      cells: [
        (
          cellType: _CellType.header.name,
          offset: 0,
          end: buildBodyBlock.leftBracket.end,
          cellStatements: [],
          specialNodes: [],
        ),
        ...body,
        (
          cellType: _CellType.tail.name,
          offset: buildBodyBlock.rightBracket.offset,
          end: unit.end,
          cellStatements: [],
          specialNodes: [],
        )
      ],
    );
  }

  /// _cellStatementType.line :
  /// ```dart
  ///    print.$____________________________________________________________________();
  /// ```
  _CellStatementType _cellStatementType(Statement statement) {
    if (statement is! ExpressionStatement) {
      return _CellStatementType.normal;
    }
    var expression = statement.expression;

    if (expression is! MethodInvocation) {
      return _CellStatementType.normal;
    }
    // print(
    //     "_cellStatementType expression.target?.staticType: ${expression.target}");
    // print.$____________________________________________________________________()
    if (expression.target?.toString() != "print") {
      return _CellStatementType.normal;
    }
    // print(
    //     "_cellStatementType expression.methodName.name: ${expression.methodName.name}");
    if (expression.methodName.name !=
        "\$____________________________________________________________________") {
      return _CellStatementType.normal;
    }

    return _CellStatementType.line;
  }

  /*
    // ignore: always_use_package_imports
    import 'page.dart';

    final noteInfo = (
      meta: page,
      cells: [
        ///
        (cellType: 'header', offset: 0, end: 255, statementCount: 0),
      ],
      code:
          ""
    );
  */
  Future<File> _genFile(_NoteInfo source) async {
    // _log("genPageInfo toFile $toFile");
    String noFormatCode = _genString(source);

    File writeTo = file.parent.childFile("note.g.dart");
    // write file
    // 写2次文件，方便调试，如果格式化出错，还可以看下上面未格式化的版本看看哪错了
    await writeTo.writeAsString(noFormatCode);
    return writeTo.writeAsString(fmt.format(noFormatCode));
  }

  /// gen source code , no format
  String _genString(_NoteInfo source) {
    final encodedCode = base64.encode(utf8.encode(source.code));

    var cells = source.cells.map((e) {
      var comment = e.cellStatements
          .map((e) => e.toString().replaceAll("\n", " ").safeSubstring(0, 30));

      var specialNodes = e.specialNodes.map((e) => """
            (
            nodeType: '${e.nodeType}',
            offset: ${e.node.offset},
            end: ${e.node.end},
            )
          """).join(",");
      return """
             /// $comment
             (
               cellType:'${e.cellType}',
               offset:${e.offset},
               end:${e.end},
               statementCount: ${e.cellStatements.length},
               specialNodes: <({
                                  String nodeType,
                                  int end,
                                  int offset,
                               })>[ $specialNodes ] ,
             )
             """;
    }).join(",");
    Library lib = Library((b) => b
      ..comments
          .addAll(["/// Generated by gen_maters.dart, please don't edit! "])
      ..body.add(
        code.Block((b) => b
          ..statements.addAll([
            Code('''
                noteInfo() => (
                  cells: [ $cells ],
                  encodedCode: "$encodedCode"
                );
                '''),
          ])),
      ));

    DartEmitter emitter = DartEmitter(
      allocator: Allocator.none,
      orderDirectives: true,
      useNullSafetySyntax: true,
    );
    return lib.accept(emitter).toString();
  }

  List<({String nodeType, AstNode node})> _collectRunInCellStatements(
      List<Statement> topLevelCellStatements) {
    List<({String nodeType, AstNode node})> collected =
        List.empty(growable: true);
    List<AstVisitor> collectors = [
      _FindRunInCell(collected),
      _FindMateSampleStatement(collected)
    ];
    for (var st in topLevelCellStatements) {
      for (AstVisitor collector in collectors) {
        st.visitChildren(collector);
      }
    }
    return collected;
  }
}

_log(Object? o) {
  // ignore: avoid_print
  print("${DateTime.now()} - $o");
}

enum _CellStatementType {
  /// cell split line statement
  line,

  /// normal statement , not a cell split statement
  normal,
}

Statement _findFirstParentStatement(AstNode node) {
  if (node is Statement) return node;
  return _findFirstParentStatement(node.parent!);
}

class _FindRunInCell extends GeneralizingAstVisitor {
  static const String nodeType = "Pen.runInCurrentCell";
  final List<
      ({
        String nodeType,
        AstNode node,
      })> collect;

  _FindRunInCell(this.collect);

  @override
  visitMethodInvocation(MethodInvocation node) {
    var targetType =
        node.target?.staticType?.getDisplayString(withNullability: false);
    if (targetType == "Pen" && node.methodName.name == "runInCurrentCell") {
      collect.add((nodeType: nodeType, node: _findFirstParentStatement(node)));
    }
    return super.visitMethodInvocation(node);
  }
}

class _FindMateSampleStatement extends GeneralizingAstVisitor {
  static const String nodeType = "MateSample.new.firstParentStatement";

  final List<({String nodeType, AstNode node})> collect;

  _FindMateSampleStatement(this.collect);

  @override
  visitInstanceCreationExpression(InstanceCreationExpression node) {
    // todo careful , this api is change from name to name2, not check
    if ("${node.constructorName.type.name2}" == "MateSample") {
      collect.add((nodeType: nodeType, node: _findFirstParentStatement(node)));
    }
    return super.visitInstanceCreationExpression(node);
  }
}

class Pubspec {
  static const _YAML_PATH_ASSETS = ["flutter", "assets"];
  late final YamlEditor _yamlEditor;
  late List<String> _assetsCache;

  File file;

  static Future<Pubspec> parseFile(File file) async {
    String content = await file.readAsString();
    return Pubspec._(file, content);
  }

  Pubspec._(this.file, String content) {
    _yamlEditor = YamlEditor(content);
    _assetsCache = assets;
  }

  List<String> get assets {
    return (_yamlEditor.parseAt(_YAML_PATH_ASSETS) as List)
        .map((e) => "$e")
        .toList();
  }

  void noteAssetsRemove(String noteAsset) {
    _yamlEditor.remove([..._YAML_PATH_ASSETS, assets.indexOf(noteAsset)]);
  }

  void noteAssetsAdd(String noteAsset) {
    _yamlEditor.appendToList([..._YAML_PATH_ASSETS], noteAsset);
  }

  /// 1. remove previously Generated
  /// 2. add new
  void noteAssetsUpdate(List<String> toUpdate) {
    var toAdd = List.from(toUpdate, growable: true);

    var oldAssets = assets;
    var removed = 0;
    for (int i = 0; i < oldAssets.length; i++) {
      var oldAsset = oldAssets[i];
      // manual config, leave it
      // lib/notes is our Generated
      if (!oldAsset.startsWith("lib/notes")) {
        continue;
      }
      // our Generated, no change , no need to repeat add
      if (toAdd.contains(oldAsset)) {
        toAdd.remove(oldAsset);
        continue;
      }

      // prefix lib/notes is previously Generated ,and now not exists
      _yamlEditor.remove([..._YAML_PATH_ASSETS, i - removed]);
      removed++;
    }
    for (var add in toAdd) {
      _yamlEditor.appendToList(_YAML_PATH_ASSETS, add);
    }
  }

  Future<File> save() async {
    const ListEquality<String> _listEquality = ListEquality();
    // no change , no need to save
    if (_listEquality.equals(_assetsCache, assets)) {
      print("_assetsCache no change , no need to save");
      return Future.value(file);
    }
    return file.writeAsString(_yamlEditor.toString());
  }

  String toString() {
    return _yamlEditor.toString();
  }
}
