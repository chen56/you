// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:note/navigator_v2.dart';
import 'package:flutter/material.dart';
import 'package:note/mate.dart';
import 'package:note/utils.dart';
import 'dart:convert';

typedef PageBuilder = void Function(BuildContext context, Pen pen);

/// 本项目page开发模型，包括几部分：
/// - 本包：page开发模型的核心数据结构，并不参与具体UI样式表现
/// - [Layout]的具体实现，比如
/// 本package关注page模型的逻辑数据，并不参与展示页面的具体样式构造

/// <T>: [NavigatorV2.push] 的返回类型
class PageMeta<T> {
  /// 短标题，，应提供为page内markdown一级标题的缩短版，用于导航树等（边栏宽度有限）
  final String shortTitle;
  final PageBuilder builder;
  late final Layout? layout;

  PageMeta({
    required this.shortTitle,
    required this.builder,
    this.layout,
  });

  @override
  String toString() {
    return "PageMeta($shortTitle)";
  }
}

class Path<T> {
  final String name;
  final List<Path> _children = List.empty(growable: true);
  final Map<String, Path> _childrenMap = {};
  final Path? parent;

  final Map<String, Object> attributes = {};
  PageMeta<T>? _meta;

  NoteInfo? _noteInfo;

  Path._child(
    this.name, {
    required Path this.parent,
  });

  Path.root()
      : name = "",
        parent = null;

  bool get hasPage => _meta != null;

  List<Path> get children => List.unmodifiable(_children);

  Path<C> put<C>(String fullPath, NoteInfo? noteInfo) {
    var p = fullPath
        .split("/")
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();
    var path = _ensurePath(p);
    assert(path._meta == null,
        " $path add child '$fullPath': duplicate put , ${path._meta} already exists ");

    path._meta = noteInfo?.meta;
    path._noteInfo = noteInfo;
    return path as Path<C>;
  }

  Path _ensurePath<C>(List<String> nameList) {
    if (nameList.isEmpty) {
      return this;
    }
    String name = nameList[0];
    assert(name != "" && name != "/",
        "path:$nameList, path[0]:'$name' must not be '' and '/' ");
    var next = _childrenMap.putIfAbsent(name, () {
      var child = Path._child(name, parent: this);
      _children.add(child);
      _childrenMap[name] = child;
      return child;
    });
    return next._ensurePath(nameList.sublist(1));
  }

  /// 页面骨架
  /// 树形父子Page的页面骨架有继承性，即自己没有配置骨架，就用父Page的骨架
  Layout get layout {
    if (_meta != null && _meta!.layout != null) {
      return _meta!.layout!;
    }

    if (isRoot) {
      return <T>(Path<T> note) => _DefaultScreen<T>(
            current: note,
          );
    }
    return parent!.layout;
  }

  bool get isLeaf => _children.isEmpty;

  int get level => isRoot ? 0 : parent!.level + 1;

  int levelTo(Path parent) => this.level - parent.level;

  List<Path> get parents => this.isRoot ? [this] : [this, ...parent!.parents];

  bool get isRoot => parent == null;

  Path get root => isRoot ? this : parent!.root;

  String get title => _meta == null ? nameFlat : _meta!.shortTitle;

  NoteInfo? get noteInfo => _noteInfo;

  String get path {
    if (isRoot) return "/";
    var parentPath = parent!.path;
    return parentPath == "/" ? "/$name" : "$parentPath/$name";
  }

  List<Path> toList({bool includeThis = true, bool Function(Path path)? test}) {
    test = test ?? (e) => true;
    if (!test(this)) {
      return [];
    }
    var flatChildren = _children.expand((child) {
      return child.toList(includeThis: true, test: test);
    }).toList();
    return includeThis ? [this, ...flatChildren] : flatChildren;
  }

  List<Path> topList({bool topDown = true}) {
    if (isRoot) {
      return [this];
    }
    return [...parent!.topList(), this];
  }

  Path? child(String path) {
    Path? result = this;
    for (var split
        in path.split("/").map((e) => e.trim()).where((e) => e != "")) {
      result = result?._childrenMap[split];
      if (result == null) break;
    }
    return result;
  }

  Screen createScreen(String location) => layout(this);

  /// 扁平化name，去掉排序用的数字前缀
  String get nameFlat {
    return name.replaceAll(RegExp("\\d+[.]"), "") // 1.note-self -> note-self
        ;
  }

  String toStringShort() {
    return path;
  }

  @override
  String toString({bool? deep}) {
    if (deep == null || !deep) {
      return "Page($path ,kids:${_children.map((e) => e.toStringShort()).toList()})";
    } else {
      StringBuffer sb = StringBuffer();
      for (Path n in toList()) {
        sb.write("$n\n");
      }
      return sb.toString();
    }
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
/// - flutter_note 的cell在界面上是只读的
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

extension X on void {
  xxx() {
    print("xxx vlid");
  }
}

class Pen {
  /// 这个方法作用是代码区块隔离，方便语法分析器
  /// 这个函数会在代码显示器中擦除
  // void cell(CellBuilder builder);
  // final List<NoteCell> cells = List.empty(growable: true);
  // NoteCell _currentCell = NoteCell(index: 0);
  final List<NoteCell> cells = List.empty(growable: true);
  late NoteCell currentCell;
  final Editors editors;

  final Path path;
  final bool defaultCodeExpand;
  // Pen({required this.editors});
  Pen.build(
    BuildContext context,
    this.path, {
    required this.editors,
    required this.defaultCodeExpand,
  }) {
    var blocks = path.noteInfo!.source.blocks;
    int index = 0;
    for (var block in blocks) {
      cells.add(NoteCell(
        cellType: CellType.body,
        pen: this,
        index: index++,
        codeBlock: block,
      ));
    }

    // first cell is dart head code , All code before the build() function
    currentCell = blocks.isEmpty ? NoteCell.empty(this) : cells.first;

    // Skip the header code block
    $____________________________________________________________________();

    path._meta!.builder(context, this);
  }

  /// 新增一个cell，cell代表note中的一个代码块及其产生的内容
  /// Add a new cell, which is a code block and its generated content in the note
  ///
  /// 通过[builder]参数可以重建此cell
  /// cell can be rebuilt using the [builder] arg
  void $____________________________________________________________________() {
    int nextCellIndex = currentCell.index + 1;
    // It is already the last cell
    // It is possible that the code generation has not been synchronized
    if (nextCellIndex >= cells.length) {
      return;
    }

    currentCell = cells[nextCellIndex];
  }

  /// markdown 独占一个新cell
  void markdown(String content) {
    currentCell.print(MarkdownContent(content));
  }

  void call(Object? object) {
    currentCell.print(object);
  }

  /// 注意：只能在NotePage的[build]函数的最外层调用，不能放在button回调或Timer回调中
  /// 通过闭包记住currentCell的引用，以便可以在之后的回调中也可以print内容到currentCell
  void runInCurrentCell(void Function(NoteCell print) callback) {
    callback(currentCell);
  }
}

/// note content is not widget , it is data.
class NoteContent {}

class MarkdownContent extends NoteContent {
  final String content;

  MarkdownContent(this.content);

  @override
  String toString() {
    return "MarkdownContent('${content.replaceAll("\n", "\\n").safeSubstring(0, 50)}')";
  }
}

class ObjectContent extends NoteContent {
  final Object? object;

  ObjectContent(this.object);

  @override
  String toString() {
    return "ObjectNote('${object?.toString()}')";
  }
}

class WidgetContent extends NoteContent {
  final Widget widget;

  WidgetContent(this.widget);

  @override
  String toString() {
    return "WidgetNote('${widget.runtimeType}')";
  }
}

// {String title = "展开代码&编辑器", bool isShowCode = true, bool isShowParamEditor = true}
class MateSampleContent extends NoteContent {
  final Mate mate;
  final bool isShowCode;
  final bool isShowParamEditor;

  MateSampleContent(
    this.mate, {
    this.isShowCode = true,
    this.isShowParamEditor = true,
  });

  @override
  String toString() {
    return "MateSampleContent('${mate.toString()}')";
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

typedef Layout = Screen Function(Path page);

/// 在页面树上找不到任何Layout时套用这个缺省的
class _DefaultScreen<T> extends StatelessWidget with Screen<T> {
  final Path<T> current;

  _DefaultScreen({super.key, required this.current});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text("_DefaultScreen")),
      body: SingleChildScrollView(
        child: Center(
          child: Text(
            "WARN：当前Path上未配置任何Layout: ${current.path}",
            style: theme.textTheme.titleLarge
                ?.copyWith(color: theme.colorScheme.error),
          ),
        ),
      ),
    );
  }

  @override
  String get location => current.path;
}

class NotePage {
  final Path path;
  final NoteSource source;
  final PageMeta meta;

  NotePage({
    required this.path,
    required NoteInfo info,
  })  : source = info.source,
        meta = info.meta;
}

class NoteInfo {
  final NoteSource source;
  final PageMeta meta;

  NoteInfo({
    required this.source,
    required this.meta,
  });
}

class NoteSource {
  final CodeBlock header;
  final List<CodeBlock> body;
  final CodeBlock tail;
  final String code;

  NoteSource({
    required String code,
    required this.header,
    this.body = const [],
    required this.tail,
  }) : code = utf8.decode(base64.decode(code)) {
    header.source = this;
    tail.source = this;
    for (var e in body) {
      e.source = this;
    }
  }

  List<CodeBlock> get blocks {
    return [header, ...body, tail];
  }

  /// todo change to blocks[index]
  static CodeBlock getBodyCellBlock(Path path, int cellIndex) {
    if (path.noteInfo == null) return CodeBlock.Empty;
    if (cellIndex >= path.noteInfo!.source.blocks.length) {
      return CodeBlock.Empty;
    }
    return path.noteInfo!.source.blocks[cellIndex];
  }

  String getCode(CodeBlock codeBlock) {
    return code.substring(codeBlock.offset, codeBlock.end);
  }
}

class CodeBlock {
  late final NoteSource source;
  final int offset;
  final int end;
  final int statementCount;

  CodeBlock({
    required this.offset,
    required this.end,
    this.statementCount = 0,
  });

  /// 是否为不存在的代码块
  bool get isExists => offset == end;
  static CodeBlock Empty = CodeBlock(offset: 0, end: 0);

  /// 是否为不包含任何有意义的语句的空块
// bool get isEmpty => isExists || ;
  ///     final encodedCode = base64.encode(utf8.encode(source.code));
  ///
  @override
  String toString() {
    return "CodeBlock($offset:$end)";
  }
}

enum CellType { header, body, tail }

/// 一个cell代表note中的一个代码块及其产生的内容
/// A cell represents a code block in a note and its generated content
class NoteCell extends ChangeNotifier {
  final List<NoteContent> _contents = List.empty(growable: true);

  // index use to find code
  final CodeBlock codeBlock;
  final int index;
  final Pen pen;
  bool? _expand;
  final CellType cellType;

  NoteCell({
    required this.codeBlock,
    required this.pen,
    required this.index,
    required this.cellType,
  });
  NoteCell.empty(Pen pen)
      : this(
          codeBlock: CodeBlock.Empty,
          pen: pen,
          index: 0,
          cellType: CellType.body,
        );

  List<NoteContent> get contents => List.unmodifiable(_contents);

  // String get name {
  //   if (cellType == CellType.header) {
  //     return "cell[header]";
  //   }
  //   if (cellType == CellType.tail) {
  //     return "cell[tail]";
  //   }
  //   return "cell[$index]";
  // }
  get name {
    return "cell[$index]";
    // return switch (cellType) {
    //   CellType.header => "cell[header]",
    //   CellType.tail => "cell[tail]",
    //   CellType.body => "cell[$index]",
    //   _ => "error:not here",
    // };
  }

  get singleCharName {
    return "$index";
    // return switch (cellType) {
    //   CellType.header => "H",
    //   CellType.tail => "T",
    //   CellType.body => "$index",
    //   _ => "error:not here",
    // };
  }

  bool isEmpty() => contents.isEmpty;

  void print(Object? object) {
    call(object);
  }

  void clear() {
    _contents.clear();
  }

  void markdown(String content) {
    call(MarkdownContent(content));
  }

  bool get isMarkdownCell {
    if (_contents.isEmpty) return false;
    return _contents.every((e) => e is MarkdownContent);
  }

  void call(Object? object) {
    if (object is NoteContent) {
      _add(object);
      return;
    }
    if (object is Mate) {
      _add(MateSampleContent(object));
      return;
    }
    if (object is Widget) {
      _add(WidgetContent(object));
      return;
    }
    _add(ObjectContent(object));
  }

  void _add(NoteContent content) {
    _contents.add(content);
    notifyListeners();
  }

  /// 不包含pen相关调用的代码
  String get noPenCode {
    return "code source... todo \n code.... \n code...";
  }

  String get code {
    if (_contents.isNotEmpty && CodeBlock.Empty == codeBlock) {
      return "cell have content ,but code source is null, please gen page.g.dart";
    }
    return path.noteInfo == null
        ? ""
        : path.noteInfo!.source.getCode(codeBlock);
  }

  Path get path => pen.path;

  // show == expand
  bool get expand {
    if (isCodeEmpty) return false;
    //markdown cell default hidden code
    if (_expand == null) {
      return switch (cellType) {
        CellType.header => false,
        CellType.tail => false,
        CellType.body => pen.defaultCodeExpand && !isMarkdownCell,
        _ => false,
      };
    }
    return _expand ?? pen.defaultCodeExpand;
  }

  bool get isShowCode {
    return !isCodeEmpty;
  }

  set expand(bool newValue) {
    _expand = newValue;
    notifyListeners();
  }

  bool get isCodeEmpty {
    return code.contains(RegExp(r'^\s*$'));
  }

  bool get isCodeNotEmpty {
    return !isCodeEmpty;
  }

  List<NoteContent> build(BuildContext context) {
    return List.unmodifiable(_contents);
  }

  @override
  String toString() {
    return "$name(hash:$hashCode, expend:$expand,isMarkdownCell:$isMarkdownCell, isEmptyCode:$isCodeEmpty contents-${contents.length}:$contents)";
  }
}
