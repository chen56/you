import 'dart:convert';

import 'package:analyzer/dart/analysis/features.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:code_builder/code_builder.dart' as code;
import 'package:code_builder/code_builder.dart';

import 'package:dart_style/dart_style.dart';
import 'package:file/file.dart';
import 'package:glob/glob.dart';
import 'package:note_tools/env.dart';
import 'package:path/path.dart' as path;

import 'package:note/utils_core.dart';
import 'package:analyzer/dart/analysis/utilities.dart' as analyzer_util;
import 'package:watcher/watcher.dart';

class NoteGenerator {
  final DartFormatter _fmt;
  final FileSystem _fs;
  late final String projectHome;
  late final String noteHome;

  NoteGenerator({
    required Env env,
    DartFormatter? fmt,
  })  : _fs = env.fs,
        _fmt = fmt ?? DartFormatter(pageWidth: 120) {
    projectHome = env.getFlutterProjectDir();
    noteHome = path.join(projectHome, 'lib');

    // var watcher = DirectoryWatcher(projectDir);
    // watcher.events
    //     .where((WatchEvent e) => _noteGlob.matches(e.path))
    //     .listen((WatchEvent e) async {
    //   _log("NoteGenerator.watch - event ${e.type} ${e.path}");
    //   await _genNoteInfo(e.path);
    // });
    //
    // _noteGlob
    //     .listFileSystem(_fs, root: projectDir)
    //     .map((FileSystemEntity e) async {
    //       _log("NoteGenerator.start - gen  ${e.path}");
    //       return await _genNoteInfo(e.path);
    //     })
    //     .asyncExpand((e) => e.asStream())
    //     .toList()
    //     // after all noteLibs gen ok , then watch change
    //     .then((value) {
    //       _log("NoteGenerator.start - gen ok notes:${value.length}");
    //       return DirectoryWatcher(projectDir);
    //     })
    //     .asStream()
    //     .asyncExpand((DirectoryWatcher watcher) => watcher.events)
    //     .where((WatchEvent e) => _noteGlob.matches(e.path))
    //     .listen((WatchEvent e) async {
    //       _log("NoteGenerator.start - event ${e.type} ${e.path}");
    //       await _genNoteInfo(e.path);
    //       List<NoteLib> noteLibs = await _noteGlob
    //           .listFileSystem(_fs, root: projectDir)
    //           .map((e) {
    //             _log("NoteGenerator.start 2- genDeferredPages  ${e.path}");
    //             return e;
    //           })
    //           .map((e) => NoteLib(
    //               noteHome: noteHome,
    //               notePath: e.path,
    //               writeFS: _fs,
    //               fmt: _fmt))
    //           .toList();
    //       _log(
    //           "NoteGenerator.start - genDeferredPages start:${noteLibs.length}");
    //       await genNotesFromList(noteLibs, fmt: _fmt, writeFS: _fs);
    //       _log("NoteGenerator.start - genDeferredPages end");
    //     });
  }

  Stream<WatchEvent> watch() async* {
    var watcher = DirectoryWatcher(projectHome);
    Glob noteGlob = Glob("lib/**/note.dart");
    await for (WatchEvent e in watcher.events) {
      if (noteGlob.matches(e.path)) {
        await _gen_note_g_dart(e.path);
      }
      yield e;
    }
  }

  // ignore: non_constant_identifier_names
  Future<({File file, List<NoteLib> notes})> gen_note_app_g_dart() async {
    var notes = await Glob("**/note.dart")
        .listFileSystem(_fs, root: noteHome)
        .map((e) => NoteLib(
              noteHome: noteHome,
              notePath: e.path,
              writeFS: _fs,
              fmt: _fmt,
            ))
        .toList();
    return (file: await _genNotesFromList(notes), notes: notes);
  }

  // ignore: non_constant_identifier_names
  Future<List<NoteLib>> gen_note_g_dart() async {
    return Glob("**/note.dart")
        .listFileSystem(_fs, root: noteHome)
        .map((e) => _gen_note_g_dart(e.path))
        .asyncExpand((e) => e.asStream())
        .toList();
  }

  // ignore: non_constant_identifier_names
  Future<NoteLib> _gen_note_g_dart(String noteFile) async {
    NoteLib noteLib = NoteLib(
        noteHome: noteHome, notePath: noteFile, writeFS: _fs, fmt: _fmt);
    // async write file
    await noteLib._genFromInfo(noteLib._collectInfo());
    return noteLib;
  }

  Future<File> _genNotesFromList(List<NoteLib> noteLibs) async {
    var fields = noteLibs.map((noteLib) {
      String flatPagePath = flatLibPath(noteLib.noteRelativePath);

      var fieldName = flatPagePath;
      String path = noteLib.noteRelativePath.replaceAll("/note.dart", "");
      path = path == "" ? "/" : path;
      // ignore: non_constant_identifier_names
      return """
           final Note $fieldName = put2(
            "$path",
            ${flatPagePath}_g.noteInfo(),
            () => ${flatPagePath}_
                .loadLibrary()
                .then((value) => ${flatPagePath}_.page));
             """;
    }).join("\n");
    Library libGen = Library((b) => b
      ..comments.addAll([
        "/// Generated by gen_maters.dart, please don't edit! ",
        "ignore_for_file: library_prefixes, non_constant_identifier_names"
      ])
      ..directives.addAll(noteLibs.map((lib) {
        String flatPagePath = flatLibPath(lib.noteRelativePath);
        return code.Directive.importDeferredAs(
            "package:note_app/${lib.noteRelativePath}", "${flatPagePath}_");
      }))
      ..directives.addAll(noteLibs.map((lib) {
        String flatPagePath = flatLibPath(lib.noteRelativePath);
        return code.Directive.import(
            path.join(path.dirname(lib.noteRelativePath), "note.g.dart"),
            as: "${flatPagePath}_g");
      }))
      ..body.add(
        code.Code("""
      import 'package:note/note.dart';
      
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
    await _fs.file("lib/note_app.deferred.g.dart").writeAsString(toCode);
    // 写2次文件，方便调试，如果格式化出错，还可以看下上面未格式化的版本看看哪错了
    return _fs
        .file("lib/note_app.deferred.g.dart")
        .writeAsString(_fmt.format(toCode));
  }
}

// // Generated by note_dev_gen.dart, please don't edit!
// // ignore_for_file: library_prefixes, non_constant_identifier_names
//
// import 'package:note/note_core.dart';
// import 'package:note_app/1.welcome/page.dart' deferred as welcome_;
// import 'package:note_app/1.welcome/page.g.dart' as welcome_g;
// import 'package:note_app/note_app.dart';
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
  final String notePath;
  final String noteHome;

  late final String content;

  final FileSystem writeFS;
  final DartFormatter fmt;
  late final CompilationUnit unit;
  NoteLib({
    required this.noteHome,
    required this.notePath,
    required this.writeFS,
    required this.fmt,
  }) {
    var parseResult = analyzer_util.parseFile(
        path: notePath, featureSet: FeatureSet.latestLanguageVersion());
    unit = parseResult.unit;
    content = parseResult.content;
  }

  String get noteRelativePath => path.relative(notePath, from: noteHome);

  FunctionDeclaration? get _buildFunction {
    var whereBuild = unit.declarations
        .whereType<FunctionDeclaration>()
        .where((e) => "${e.name}" == "build");
    return whereBuild.isEmpty ? null : whereBuild.first;
  }

  _NoteInfo _collectInfo() {
    _log('collectInfo $notePath');

    if (notePath.contains("stand_alone/button/note.dart")) {
      // _log("debug use $notePath");
    }
    var findBuild = _buildFunction;
    if (findBuild == null) {
      _log(" $notePath [build] func not found, so it is not a note");
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
          specialNodes: collectRunInCellStatements(cellStatements),
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
      specialNodes: collectRunInCellStatements(cellStatements),
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
  Future<File> _genFromInfo(_NoteInfo source) async {
    var toFile = path.join(path.dirname(notePath), "note.g.dart");
    // _log("genPageInfo toFile $toFile");
    String noFormatCode = _genInfoSource(source);

    // ensure dir
    writeFS.directory(path.dirname(toFile)).createSync(recursive: true);

    // write file
    // 写2次文件，方便调试，如果格式化出错，还可以看下上面未格式化的版本看看哪错了
    await writeFS.file(toFile).writeAsString(noFormatCode);

    return writeFS.file(toFile).writeAsString(fmt.format(noFormatCode));
  }

  /// gen source code , no format
  String _genInfoSource(_NoteInfo source) {
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

  List<({String nodeType, AstNode node})> collectRunInCellStatements(
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

/// 包名平整化：
/// package:note/pages/note/1.welcome/1.note-self/page.dart
/// --->
/// note$welcome$note_self
///
/// 规则：
/// - 去掉package:note前缀
/// - 去掉用来排序的数字前缀"1."
/// - '/'换成'$'
/// - 其他特殊字符换成'_'
String flatLibPath(String packageName) {
  String result = packageName.replaceAll("package:note_app", "");
  result = path.dirname(result);

  if (result == "/") {
    return "root";
  }
  return result
      // .replaceAll(RegExp("/page.dart\$"), "") // 后缀
      // .replaceAll(RegExp("/page.g.dart\$"), "") // 后缀
// ignore: unnecessary_string_escapes
      .replaceAll(
          RegExp("/\\d+\."), "/") // /note/1.note-self -> /note_note-self
      // .replaceAll(RegExp("^\\d+\."), "") // /1.note-self -> note-self
      .replaceAll(RegExp("^/"), "") // 去第一个杠
      .replaceAll("/", "_")
      .replaceAll(".", "_")
      .replaceAll("-", "_")
      .replaceAll("&", "_")
      .replaceAll("*", "_")
      .replaceAll("*", "_")
      .replaceAll("@", "_");
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
