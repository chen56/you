import 'package:note/navigator_v2.dart';
import 'package:flutter/material.dart';
import 'package:note/mate.dart';
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
    var p = fullPath.split("/").map((e) => e.trim()).where((e) => e.isNotEmpty).toList();
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
    assert(name != "" && name != "/", "path:$nameList, path[0]:'$name' must not be '' and '/' ");
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
    for (var split in path.split("/").map((e) => e.trim()).where((e) => e != "")) {
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

typedef CellBuilder = void Function(BuildContext context, NoteCell print);

class Pen {
  /// 这个方法作用是代码区块隔离，方便语法分析器
  /// 这个函数会在代码显示器中擦除
  // ignore: non_constant_identifier_names
  // void cell(CellBuilder builder);
  // final List<NoteCell> cells = List.empty(growable: true);
  // NoteCell _currentCell = NoteCell(index: 0);
  final List<NoteCell> cells = List.empty(growable: true);

  int _cellIndex = 0;
  final Editors editors;

  final Path path;
  // Pen({required this.editors});
  Pen.build(BuildContext context, this.path, {required this.editors}) {
    // 进入build() 函数后的第一个自然cell
    _nextCell();
    if (path._meta == null) return;

    path._meta!.builder(context, this);
    // 最后一次cell()调用后的自然cell
    _nextCell();
  }

  /// markdown 独占一个新cell
  void markdown(String content) {
    cell((context, print) {
      print(MarkdownNote(content));
    });
  }

  /// 新增一个cell，cell代表note中的一个代码块及其产生的内容
  /// Add a new cell, which is a code block and its generated content in the note
  ///
  /// 通过[builder]参数可以重建此cell
  /// cell can be rebuilt using the [builder] arg
  NoteCell cell(CellBuilder builder) {
    var cell = _nextCell(builder);
    _nextCell();
    return cell;
  }

  /// 新增一个自然cell
  /// add a nature cell
  ///
  /// 自然cell的意思是，在[Pen.cell]函数块之间的代码块
  /// The meaning of natural cell is the code block between [Pen. cell] function blocks
  NoteCell _nextCell([CellBuilder? builder]) {
    var next = NoteCell(
      index: _cellIndex++,
      pen: this,
      builder: builder ?? (_, __) {},
    );
    cells.add(next);
    return next;
  }
}

abstract class BaseNoteContent {}

class MarkdownNote extends BaseNoteContent {
  final String content;
  MarkdownNote(this.content);
  @override
  String toString() {
    return "MarkdownNote('${content}')";
  }
}

class ObjectNote extends BaseNoteContent {
  final Object? object;
  ObjectNote(this.object);
  @override
  String toString() {
    return "ObjectNote('${object?.toString()}')";
  }
}

class WidgetNote extends BaseNoteContent {
  final Widget widget;
  WidgetNote(this.widget);

  @override
  String toString() {
    return "WidgetNote('${widget.runtimeType}')";
  }
}

// {String title = "展开代码&编辑器", bool isShowCode = true, bool isShowParamEditor = true}
class SampleNote extends BaseNoteContent {
  final Mate mate;
  SampleNote(this.mate);
  @override
  String toString() {
    return "SampleNote('${mate.toString()}')";
  }
}

typedef SampleBuilder = Widget Function(ObjectParam param);

// markdown 的结构轮廓，主要用来显示TOC
class Outline {
  OutlineNode root = OutlineNode(key: GlobalKey(), heading: 0, title: "");
  OutlineNode? current;

  void add(OutlineNode newNode) {
    if (current == null) {
      current = root.add(newNode);
      return;
    }
    current = current!.add(newNode);
  }

  void reset() {
    root.clear();
    current = null;
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
            style: theme.textTheme.titleLarge?.copyWith(color: theme.colorScheme.error),
          ),
        ),
      ),
    );
  }

  @override
  String get location => current.path;
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

  String getMainCellCode(int index) {
    if (index >= body.length) {
      // not sync
      return "cell code not sync, please gen page.g.dart";
    }
    var c = body[index];
    return code.substring(c.offset, c.end);
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

  /// 是否为不包含任何有意义的语句的空块
  // bool get isEmpty => isExists || ;
  ///     final encodedCode = base64.encode(utf8.encode(source.code));
}

/// 一个cell代表note中的一个代码块及其产生的内容
/// A cell represents a code block in a note and its generated content
class NoteCell extends ChangeNotifier {
  final List<BaseNoteContent> _contents = List.empty(growable: true);
  // index use to find code
  final int index;
  final Pen pen;
  late final ObjectParam param = ObjectParam.root(editors: pen.editors);
  final CellBuilder _builder;
  NoteCell({
    required this.index,
    required this.pen,
    required CellBuilder builder,
  }) : _builder = builder;

  bool isEmpty() => _contents.isEmpty;

  List<BaseNoteContent> get contents => List.unmodifiable(_contents);

  void print(Object? object) {
    call(object);
  }

  void clear() {
    _contents.clear();
  }

  void call(Object? object) {
    if (object is BaseNoteContent) {
      _add(object);
      return;
    }
    if (object is Mate) {
      _add(SampleNote(object));
      return;
    }
    if (object is Widget) {
      _add(WidgetNote(object));
      return;
    }
    _add(ObjectNote(object));
  }

  void _add(BaseNoteContent content) {
    _contents.add(content);
    notifyListeners();
  }

  String get code {
    var source = pen.path.noteInfo?.source;
    if (source == null) {
      return _contents.isEmpty
          ? ""
          : "cell have content ,but code source is null, please gen page.g.dart";
    }
    return source.getMainCellCode(index);
  }

  /// 不包含pen相关调用的代码
  String get noPenCode {
    return "code source... todo \n code.... \n code...";
  }

  build(BuildContext context) {
    _contents.clear();
    _builder(context, this);
  }
}
