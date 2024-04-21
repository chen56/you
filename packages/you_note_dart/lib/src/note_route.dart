import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:you_note_dart/note_conf.dart';
import 'package:you_note_dart/src/conventions.dart';
import 'package:you_note_dart/src/note_core.dart';
import 'package:you_note_dart/src/utils_core.dart';


NoteSourceData _emptyPageGenInfo = (
  cells: [
    (
      cellType: CellType.header.name,
      offset: 0,
      end: 0,
      specialNodes: [],
    )
  ],
);

typedef NoteSourceData = ({
List<
    ({
    String cellType,
    int end,
    int offset,
    List<
        ({
        String nodeType,
        int end,
        int offset,
        })> specialNodes,
    })> cells,
// NoteConfPart meta
});

typedef NotePageBuilder = void Function(BuildContext context, CellPrint pen);

NoteSource _emptyPageSource = NoteSource(pageGenInfo: _emptyPageGenInfo);

typedef NoteRouteLazyInitiator = Future<NotePage> Function(NoteRoute note);

class NoteRoute {
  /// A file system term,  that refers to the last part of a path
  /// example: a/b/c , c is basename
  final String basename;
  final Map<String, NoteRoute> _children = {};
  final NoteRoute? parent;
  bool expand = false;

  NoteSource _source = _emptyPageSource;

  @internal
  NoteRouteLazyInitiator? noteRouteLazyInitiator;

  NoteConf? conf;

  NoteRoute._child({required this.basename, required NoteRoute this.parent});

  NoteRoute.root()
      : basename = "",
        parent = null;

  NoteRoute put(String fullPath, NoteSourceData data, NoteRouteLazyInitiator noteRouteLazyInitiator) {
    var p = fullPath.split("/").map((e) => e.trim()).where((e) => e.isNotEmpty).toList();
    var path = _ensurePath(p);

    path._source = NoteSource(pageGenInfo: data);
    path.noteRouteLazyInitiator = noteRouteLazyInitiator;
    return path;
  }

  void configTree({int extendLevel = 0}) {
    if (extendLevel <= 0) return;

    expand = extendLevel > 0;
    for (var e in children) {
      e.configTree(extendLevel: extendLevel - 1);
    }
  }

  List<NoteRoute> get children => List.from(_children.values);

  NoteSource get source => _source;

  NoteRoute _ensurePath(List<String> nameList) {
    if (nameList.isEmpty) {
      return this;
    }
    String name = nameList[0];
    assert(name != "" && name != "/", "path:$nameList, path[0]:'$name' must not be '' and '/' ");
    var next = _children.putIfAbsent(name, () {
      var child = NoteRoute._child(basename: name, parent: this);
      _children[name] = child;
      return child;
    });
    return next._ensurePath(nameList.sublist(1));
  }

  bool get isLeaf => _children.isEmpty;

  int get level => isRoot ? 0 : parent!.level + 1;

  int levelTo(NoteRoute parent) => level - parent.level;

  List<NoteRoute> get ancestors => isRoot ? [] : [parent!, ...parent!.ancestors];

  List<NoteRoute> get meAndAncestors => [this, ...ancestors];

  bool get isRoot => parent == null;

  NoteRoute get root => isRoot ? this : parent!.root;

  /// Note names, which can be set to human-readable names in note.json,
  /// are displayed on the navigation tree
  String get displayName => conf != null ? conf!.displayName : basename;

  String get path {
    if (isRoot) return "/";
    var parentPath = parent!.path;
    return parentPath == "/" ? "/$basename" : "$parentPath/$basename";
  }

  List<NoteRoute> toList({
    bool includeThis = true,
    bool Function(NoteRoute path)? test,
    Comparator<NoteRoute>? sortBy,
  }) {
    test = test ?? (e) => true;
    if (!test(this)) {
      return [];
    }
    List<NoteRoute> children = List.from(_children.values);
    if (sortBy != null) {
      children.sort(sortBy);
    }

    var flatChildren = children.expand((child) {
      return child.toList(includeThis: true, test: test, sortBy: sortBy);
    }).toList();
    return includeThis ? [this, ...flatChildren] : flatChildren;
  }

  List<NoteRoute> topList({bool topDown = true}) {
    if (isRoot) {
      return [this];
    }
    return [...parent!.topList(), this];
  }

  // todo bug
  NoteRoute? child(String path) {
    NoteRoute? result = this;
    for (var split in path.split("/").map((e) => e.trim()).where((e) => e != "")) {
      result = result?._children[split];
      if (result == null) break;
    }
    return result;
  }

  /// 扁平化name，去掉排序用的数字前缀
  String get nameFlat {
    return basename.replaceAll(RegExp("\\d+[.]"), "") // 1.z.about -> z.about
        ;
  }

  String toStringShort() {
    return path;
  }

  @override
  String toString({bool? deep}) {
    if (deep == null || !deep) {
      return "Page($path ,kids:${_children.values.map((e) => e.toStringShort()).toList()})";
    } else {
      StringBuffer sb = StringBuffer();
      for (NoteRoute n in toList()) {
        sb.write("$n\n");
      }
      return sb.toString();
    }
  }

  bool contains(String location) {
    var c = child(location);
    return c != null;
  }

  void visit(bool Function(NoteRoute note) visitor) {
    if (!visitor(this)) {
      return;
    }
    for (var child in _children.values) {
      child.visit(visitor);
    }
  }

  String get dartAssetPath => conventions.noteDartAssetPath(path);

  String get confAssetPath => conventions.noteConfAssetPath(path);

  Future<NotePage> lazyInit({required NotePageBuilder builder}) async {
    return NotePage(noteRoute: this, pageBuilder: builder, conf: conf == null ? null : NoteConf.decode(await rootBundle.loadString(confAssetPath)), content: await rootBundle.loadString(dartAssetPath));
  }
}

// TODO 这个类设计的比较突兀，
class NotePage {
  final NoteRoute noteRoute;
  final NotePageBuilder pageBuilder;
  final NoteConf? conf;
  final String content; // source code content
  NotePage({
    required this.noteRoute,
    required this.pageBuilder,
    required this.conf,
    required this.content,
  });

  @internal
  String getCellCode(CodeEntity codeEntity) {
    if (codeEntity.end > content.length) {
      return "// ${codeEntity.offset}:(${codeEntity.end}) >= code.length(${content.length})  ";
    }
    return content.safeSubstring(codeEntity.offset, codeEntity.end);
  }
}

class NoteSystem {
  final NoteRoute root;

  NoteSystem({
    required this.root,
  });

  static Future<NoteSystem> load({
    required NoteRoute root,
  }) async {
    SpaceConf spaceConf = SpaceConf.decodeJson(await rootBundle.loadString('notes.g.json'));
    root.visit((e) {
      e.conf = spaceConf.notes[e.path];
      return true;
    });
    return NoteSystem(
      root: root,
    );
  }
}

@internal
class NoteSource {
  final NoteSourceData pageGenInfo;

  NoteSource({required NoteSourceData pageGenInfo}) : pageGenInfo = pageGenInfo;
}

@internal
class CodeEntity {
  /// CodeEntity is same as analyzer [SyntacticEntity] class CodeEntity {
  final int offset;
  final int end;

  CodeEntity({required this.offset, required this.end});

  int get length => end - offset;

  @override
  String toString() {
    return "CodeEntity(offset:$offset, end:$end, length:$length )";
  }
}

class CellSource {
  final CellType cellType;
  final CodeEntity codeEntity;
  final List<SpecialSource> specialSources;
  final NoteCell cell;

  CellSource({
    required this.cellType,
    required this.codeEntity,
    required this.specialSources,
    required this.cell,
  });

  String get code {
    return cell.pen.notePage.getCellCode(codeEntity);
  }

  bool get isCodeEmpty {
    return code.contains(RegExp(r'^\s*$'));
  }

  bool get isCodeNotEmpty {
    return !isCodeEmpty;
  }

  @override
  String toString() {
    return "CellSource(index:${cell.index}, block:$codeEntity )";
  }
}

@internal
class SpecialSource {
  /// todo codeType to enum, common use by this and note_dev_gen.dart
  String codeType;
  final CodeEntity codeEntity;
  final NoteCell cell;
  final NoteSource pageSource;

  SpecialSource({
    required this.codeType,
    required this.codeEntity,
    required this.cell,
  }) : pageSource = cell.pen.note.source;

  String get code {
    return cell.pen.notePage.getCellCode(codeEntity);
  }

  @override
  String toString() {
    return "SpecialSource(codeType:$codeType,codeEntity:$codeEntity,)";
  }
}

@internal
enum CellType {
  header,
  body,
  tail;

  static CellType parse(String name) {
    for (CellType t in CellType.values) {
      if (t.name == name) return t;
    }
    throw Exception("CellType.name:$name not exist");
  }
}
