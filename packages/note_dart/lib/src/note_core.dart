// ignore_for_file: non_constant_identifier_names

import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:note_dart/note_conf.dart';
import 'package:note_dart/src/content/object_content.dart';
import 'package:note_dart/src/content/markdown_content.dart';
import 'package:note_dart/src/conventions.dart';
import 'package:note_dart/src/utils_core.dart';
import 'package:flutter/services.dart' show rootBundle;

/// 本项目page开发模型，包括几部分：
/// - 本包：page开发模型的核心数据结构，并不参与具体UI样式表现
/// - [Layout]的具体实现，比如
/// 本package关注page模型的逻辑数据，并不参与展示页面的具体样式构造

typedef NotePageBuilder = void Function(BuildContext context, Pen pen);
typedef NoteRouteLazyInitiator = Future<NotePage> Function(NoteRoute note);
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
NoteSource _emptyPageSource = NoteSource(pageGenInfo: _emptyPageGenInfo);

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
    if (isRoot) return "";
    var parentPath = parent!.path;
    return parentPath == "" ? basename : "$parentPath/$basename";
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
    return NotePage(
        noteRoute: this,
        pageBuilder: builder,
        conf: conf == null ? null : NoteConf.decode(await rootBundle.loadString(confAssetPath)),
        content: await rootBundle.loadString(dartAssetPath));
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

  String _getCellCode(CodeEntity codeEntity) {
    if (codeEntity.end > content.length) {
      return "// ${codeEntity.offset}:(${codeEntity.end}) >= code.length(${content.length})  ";
    }
    return content.safeSubstring(codeEntity.offset, codeEntity.end);
  }
}

///
/// cell 是一段代码加上其运行后的一块界面区域，和jupyter/observablehq 中的cell概念类似，
/// 但由于我们并没有一个notebook编辑器，一个cell，一个cell的编辑运行代码，而是通过代码分析器从
/// dart代码中自动分割cell的，所以逻辑上有些许不同。
///
/// A cell is a block of code and an it's display area on page ui.
/// The concept of a cell in jupyter/Observablehq is similar,
/// but since we do not have a notebook editor, a cell is auto analyzed from Dart code,
///
/// - flutter_core 的cell在界面上是只读的
/// - cell是我们对dart文件的一种视角
///
/// 一个dart文件被识别为以下cells
/// ================================= cell[0] header code block
/// import 'package:some/package.dart';
///
/// class X{}
/// var x = "some var";
///
/// build(context,print){
/// ================================= cell[1] code block
///   do something
///   print.$_______________________;   // new cell directive
/// ================================= cell[2] code block
///   do something
/// ================================= cell[3] tail code block
/// } // end of build()
/// class Y{}
/// var y = "some var";
///
///

class Pen {
  /// 这个方法作用是代码区块隔离，方便语法分析器
  /// 这个函数会在代码显示器中擦除
  // void cell(CellBuilder builder);
  // final List<NoteCell> cells = List.empty(growable: true);
  // NoteCell _currentCell = NoteCell(index: 0);
  late final List<NoteCell> cells;
  late NoteCell currentCell;
  final Outline outline;
  final NoteRoute note;
  final NotePage notePage;
  final bool defaultCodeExpand;
  final NoteSystem noteSystem;

  // Pen({required this.editors});
  Pen.build(
    BuildContext context, {
    required this.notePage,
    required this.noteSystem,
    required this.defaultCodeExpand,
    required this.outline,
  }) : note = notePage.noteRoute {
    assert(note.source._pageGenInfo.cells.isNotEmpty, "page cells should not be empty");

    List<NoteCell> cells = List.empty(growable: true);
    for (int i = 0; i < note.source._pageGenInfo.cells.length; i++) {
      cells.add(NoteCell(
        noteSystem: noteSystem,
        pen: this,
        index: i,
        pageSource: note.source,
      ));
    }
    this.cells = List.unmodifiable(cells);
    // first cell is dart head code , All code before the build() function
    currentCell = cells.first;

    // Skip the header code block
    $____________________________________________________________________();

    notePage.pageBuilder(context, this);
  }

  /// 新增一个cell，cell代表note中的一个代码块及其产生的内容
  /// Add a new cell, which is a code block and its generated content in the note
  ///
  /// 通过[builder]参数可以重建此cell
  /// cell can be rebuilt using the [builder] arg
  @Deprecated("还是围绕markdown分割较好")
  void $____________________________________________________________________() {
    int nextCellIndex = currentCell.index + 1;
    // It is already the last cell
    // It is possible that the code generation has not been synchronized
    if (nextCellIndex >= cells.length) {
      return;
    }

    currentCell = cells[nextCellIndex];
  }

  void call(Object? object) {
    currentCell.print(object);
  }

  /// 注意：只能在NotePage的[build]函数的最外层调用，不能放在button回调或Timer回调中
  /// 通过闭包记住currentCell的引用，以便可以在之后的回调中也可以print内容到currentCell
  @experimental
  @Deprecated("已经有更好的方案，这个废弃")
  void runInCurrentCell(void Function(NoteCell print) callback) {
    callback(currentCell);
  }

  void markdown(String content) {
    call(MarkdownContent(outline: outline, content: content));
  }
}

/// 一个cell代表note中的一个代码块及其产生的内容
/// A cell represents a code block in a note and its generated content
class NoteCell extends ChangeNotifier {
  final List<Widget> _contents = List.empty(growable: true);

  // index use to find code
  final int index;
  final Pen pen;
  late final CellSource source;
  final Outline outline;
  final NoteSystem noteSystem;

  NoteCell({
    required this.noteSystem,
    required this.pen,
    required this.index,
    required NoteSource pageSource,
  }) : outline = pen.outline {
    var codeCell = pageSource._pageGenInfo.cells[index];
    source = CellSource(
      codeEntity: CodeEntity(offset: codeCell.offset, end: codeCell.end),
      cellType: CellType.parse(codeCell.cellType),
      cell: this,
      specialSources: codeCell.specialNodes
          .map((e) => SpecialSource(
        codeType: e.nodeType,
        codeEntity: CodeEntity(offset: e.offset, end: e.end),
        cell: this,
      ))
          .toList(),
    );
  }

  List<Widget> get contents => List.unmodifiable(_contents);

  get name {
    return "cell[$index]";
  }

  bool isContentEmpty() => contents.isEmpty;

  void print(Object? object) {
    call(object);
  }

  bool get isAllMarkdownContent {
    if (_contents.isEmpty) return false;
    return _contents.every((e) => e is MarkdownContent);
  }

  void call(Object? content) {
    Widget result = switch (content) {
      Widget widget => widget,
      _ => ObjectContent(content: content),
    };
    _add(result);
  }

  void _add(Widget content) {
    _contents.add(content);
    notifyListeners();
  }

  bool? _codeExpand;

  // show == expand
  bool get codeExpand {
    if (source.isCodeEmpty) return false;
    //markdown cell default hidden code
    if (_codeExpand == null) {
      return switch (source.cellType) {
        CellType.header => false,
        CellType.tail => false,
        CellType.body => pen.defaultCodeExpand && !isAllMarkdownContent,
      };
    }
    return _codeExpand ?? pen.defaultCodeExpand;
  }

  set codeExpand(bool newValue) {
    _codeExpand = newValue;
    notifyListeners();
  }

  @override
  String toString() {
    return "$name(hash:$hashCode,isMarkdownCell:$isAllMarkdownContent, isEmptyCode:$source.isCodeEmpty contents-${contents.length}:$contents)";
  }
}

// markdown 的结构轮廓，主要用来显示TOC
class Outline {
  bool _done = false;

  OutlineNode root = OutlineNode(key: GlobalKey(), heading: 0, title: "");
  OutlineNode? current;

  void add(OutlineNode newNode) {
    if (_done) return;
    if (current == null) {
      current = root.add(newNode);
      return;
    }
    current = current!.add(newNode);
  }

  /// bed design: 目前非常糟糕的设计，因为outline会在markdown 第一次Widget.build后才能装配好
  /// 第一次build时 界面上是看不到outline的，后面如果因为resize多次build，会造成outline持续重复增加内容
  /// 所以要结束掉它
  void collectDone() {
    _done = true;
  }
}

class OutlineNode {
  GlobalKey key;

  /// markdown 的原始标题级数：
  ///   root特殊为 0级
  ///   # 一级
  ///   ## 二级
  ///   等等...
  /// heading 和 level不一定想等，有时候markdown 的级数可能乱标，我们按idea,vscode的父子逻辑
  /// 来组织tree
  int heading;
  String title;

  OutlineNode? _parent;
  List<OutlineNode> kids = List.empty(growable: true);

  OutlineNode({required this.title, required this.heading, required this.key});

  OutlineNode add(OutlineNode newNode) {
    if (_parent == null || heading < newNode.heading) {
      newNode._parent = this;
      kids.add(newNode);
      return newNode;
    }
    return _parent!.add(newNode);
  }

  bool get isLeaf => kids.isEmpty;

  int get level => isRoot ? 0 : _parent!.level + 1;

  bool get isRoot => _parent == null;

  OutlineNode get root => isRoot ? this : _parent!.root;

  List<OutlineNode> toList({bool includeThis = true}) {
    var flatChildren = kids.expand((element) => element.toList()).toList();
    return includeThis ? [this, ...flatChildren] : flatChildren;
  }

  @override
  String toString() {
    return "heading:$heading title:$title kids:${kids.length}";
  }

  void clear() {
    kids.clear();
  }
}

class NoteSource {
  final NoteSourceData _pageGenInfo;

  NoteSource({required NoteSourceData pageGenInfo}) : _pageGenInfo = pageGenInfo;
}

/// CodeEntity is same as analyzer [SyntacticEntity]
class CodeEntity {
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
    return cell.pen.notePage._getCellCode(codeEntity);
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
    return cell.pen.notePage._getCellCode(codeEntity);
  }

  @override
  String toString() {
    return "SpecialSource(codeType:$codeType,codeEntity:$codeEntity,)";
  }
}

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
