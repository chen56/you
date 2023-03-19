import 'package:flutter/material.dart';
import 'package:note/mate.dart';
import 'package:note/navigator_v2.dart';

/// 本项目的就死活page开发模型，包括几部分：
/// - 本包：page开发模型的核心数据结构，并不参与具体UI样式表现
/// - [Layout]的具体实现，比如[Page]
/// 本package关注page模型的逻辑数据，并不参与展示页面的具体样式构造
///
///

/// <T>: [NavigatorV2.push] 的返回类型
class PageMeta<T> {
  /// 短标题，，应提供为page内markdown一级标题的缩短版，用于导航树等（边栏宽度有限）
  final String shortTitle;
  final void Function(Pen note, BuildContext context) builder;
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

/// 用kids代替单词children,原因是children太长了
class Path<T> {
  final String name;
  final List<Path> _children = List.empty(growable: true);
  final Map<String, Path> _childrenMap = {};
  final Path? parent;

  final Map<String, Object> attributes = {};
  PageMeta<T>? _meta;

  Path._child(
    this.name, {
    required Path this.parent,
  });

  Path.root()
      : name = "",
        parent = null;

  bool get hasPage => _meta != null;

  List<Path> get children => List.unmodifiable(_children);

  Path<C> put<C>(String fullPath, PageMeta<C>? meta) {
    var p = fullPath.split("/").map((e) => e.trim()).where((e) => e.isNotEmpty).toList();
    var path = _ensurePath(p);
    assert(path._meta == null,
        " $path add kid '$fullPath': duplicate put , ${path._meta} already exists ");
    path._meta = meta;
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

  void build(Pen pen, BuildContext context) {
    if (_meta == null) return;
    _meta!.builder(pen, context);
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

  Path? kid(String path) {
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

enum ContentType { markdown, sample, widget }

class Content {
  final ContentType type;
  final Object value;

  Content._({required this.type, required this.value});
}

abstract class Pen {
  void sample(Widget sample);

  void markdown(String content);

  void widgetMate<T>(WidgetMate<T> widgetMate);

  void widgetSnippet(Widget Function(ObjectParam node) builder);
}

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

  get currentContext => null;

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
