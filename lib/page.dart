import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:learn_flutter/navigator_v2.dart';

import 'utils.dart';
import 'package:markdown/markdown.dart' as md;

/// <T>: [NavigatorV2.push] 的返回类型
class PageMeta<T> {
  final String title;
  final void Function(Pen note, BuildContext context) builder;
  late final Layout<T>? layoutBuilder;

  PageMeta({
    required this.title,
    required this.builder,
    Layout? layout,
  }) : layoutBuilder = layout;
}

/// 用kids代替单词children,原因是children太长了
class Path<T> {
  final String name;
  final List<Path> _kids;
  final Map<String, Path> _kidsMap = {};
  Path? _parent;
  final Map<String, Object> attributes = ListenableMap();
  late final PageMeta<T>? _meta;

  Path(
    this.name, {
    PageMeta<T>? meta,
    List<Path<dynamic>> kids = const [],
  })  : _meta = meta,
        _kids = kids {
    for (var child in _kids) {
      child._parent = this;
      _kidsMap[child.name] = child;
    }
  }

  bool get hasPage => _meta != null;

  void build(Pen pen, BuildContext context) {
    if (_meta == null) return;
    _meta!.builder(pen, context);
  }

  /// 页面骨架
  /// 树形父子Page的页面骨架有继承性，即自己没有配置骨架，就用父Page的骨架
  Layout get layout {
    if (_meta != null && _meta!.layoutBuilder != null) {
      return _meta!.layoutBuilder!;
    }

    if (isRoot) {
      return <T>(Path<T> note) => _DefaultScreen<T>(
            current: note,
          );
    }
    return _parent!.layout;
  }

  bool get isLeaf => _kids.isEmpty;

  int get level => isRoot ? 0 : _parent!.level + 1;

  bool get isRoot => _parent == null;

  Path get root => isRoot ? this : _parent!.root;

  String get title => _meta == null ? name : _meta!.title;

  String get path {
    if (isRoot) return "/";
    var parentPath = _parent!.path;
    return parentPath == "/" ? "/$name" : "$parentPath/$name";
  }

  List<Path> toList({bool includeThis = true}) {
    var flatChildren = _kids.expand((element) => element.toList()).toList();
    return includeThis ? [this, ...flatChildren] : flatChildren;
  }

  List<Path> topList({bool topDown = true}) {
    if (isRoot) {
      return [this];
    }
    return [..._parent!.topList(), this];
  }

  Path? kid(String path) {
    Path? result = this;
    for (var split
        in path.split("/").map((e) => e.trim()).where((e) => e != "")) {
      result = result?._kidsMap[split];
      if (result == null) break;
    }
    return result;
  }

  Screen<T> createScreen(String location) => layout<T>(this);

  String toStringShort() {
    return path;
  }

  @override
  String toString({bool? deep}) {
    if (deep == null || !deep) {
      return "Page($path ,kids:${_kids.map((e) => e.toStringShort()).toList()})";
    } else {
      StringBuffer sb = StringBuffer();
      for (Path n in toList()) {
        sb.write("$n\n");
      }
      return sb.toString();
    }
  }
}

class Pen {
  final List<Widget> _content = List.empty(growable: true);
  final Outline outline = Outline();

  Pen();

  void sample(Widget sample) {
    _content.add(Text("sample: $sample")); //临时实现
  }

  List<Widget> get content => List.unmodifiable(_content);

  void markdown(String content) {
    var headerBuilder = _CenteredHeaderBuilder(outline);
    var markdownWidget = Markdown(
      data: content,
      selectable: true,
      // 得研究下controller层层嵌套要怎么用
      // controller: controller,
      shrinkWrap: true,

      builders: <String, MarkdownElementBuilder>{
        'h1': headerBuilder,
        'h2': headerBuilder,
        'h3': headerBuilder,
        'h4': headerBuilder,
        'h5': headerBuilder,
        'h6': headerBuilder,
        'h7': headerBuilder,
      },
    );
    _content.add(markdownWidget);
  }
}

class _CenteredHeaderBuilder extends MarkdownElementBuilder {
  final Outline outline;

  _CenteredHeaderBuilder(this.outline);

  OutlineNode? currentNode;

  @override
  Widget? visitText(md.Text text, TextStyle? preferredStyle) {
    // 我们假设每一个header 都按顺序调用visitElementBefore->visitText
    // 加个守卫语句，防止flutter-markdown没有按顺序调用导致无效head
    if (currentNode == null) {
      return null;
    }
    outline.add(currentNode!);
    return Row(
      children: <Widget>[
        // Flexible 可已使超出边界的文本换行
        Flexible(
          child: Text(
            key: currentNode!.key,
            text.text,
            style: preferredStyle,
          ),
        ),
      ],
    );
  }

  @override
  void visitElementBefore(md.Element element) {
    // tag value : h1 | h2 | h3 ....
    currentNode = OutlineNode(
      // globalKey用来滚动到此位置
      key: GlobalKey()!,
      heading: int.parse(element.tag.substring(1)),
      title: element.textContent,
    );
    // super.visitElementBefore(element);
  }
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

typedef Layout<T> = Screen<T> Function<T>(Path<T> page);

/// 在页面树上找不到任何Layout时套用这个缺省的
class _DefaultScreen<T> extends StatelessWidget with Screen<T> {
  final Path<T> current;

  _DefaultScreen({super.key, required this.current});

  @override
  Widget build(BuildContext context) {
    Pen pen = Pen();
    current.build(pen!, context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          const Text(
            "WARN：当前Path上未配置Layout，这是默认Layout的简单视图",
            style: TextStyle(
              color: Colors.red,
            ),
          ),
          ...pen._content,
        ]),
      ),
    );
  }

  @override
  String get location => current.path;
}
