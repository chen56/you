import 'package:flutter/material.dart';
import 'package:learn_flutter/navigator_v2.dart';
import 'package:learn_flutter/note/layout.dart';

import 'utils.dart';

/// <T>: [Navigator.push] 的返回类型
class Meta<T> {
  final String title;
  final void Function(Pen<void> note, BuildContext context) builder;
  late final LayoutBuilder layout;

  Meta({
    required this.title,
    required this.builder,
    LayoutBuilder? layout,
  }) {
    this.layout = layout ?? <T>(N<T> note) => NoteLayout<T>(note);
  }

  List<Widget> build(BuildContext context, N<T> p) {
    //Pen一次性用品，用完丢弃，防止Flutter框架多次刷新造成的状态问题
    Pen<void> pen = Pen(page: p);
    builder(pen, context);
    return pen.widgets;
  }
}

class Pen<T> {
  final List<Widget> _widgets = List.empty(growable: true);
  final N<T> page;

  List<Widget> get widgets => List.unmodifiable(_widgets);

  Pen({required this.page});

  void sample(Widget sample) {
    _widgets.add(Text("sample: $sample")); //临时实现
  }

  void markdown(String s) {
    _widgets.add(Text("markdown: $s")); //临时实现
  }
}

typedef LayoutBuilder = Layout<T> Function<T>(N<T> page);

Layout<T> _emptyFrameBuilder<T>(note) => _EmptyLayout<T>(note);

/// 用kids代替单词children,原因是children太长了
class N<T> implements Rule<T> {
  final String name;
  final List<N> kids;
  final Map<String, N> kidsMap = {};
  N? _parent;
  final Map<String, Object> attributes = ListenableMap();
  late final Meta<T>? meta;

  N(
    this.name, {
    this.meta,
    LayoutBuilder? frame,
    this.kids = const [],
  }) {
    for (var child in kids) {
      child._parent = this;
      kidsMap[child.name] = child;
    }
  }

  bool get hasPage => meta != null;

  List<Widget> build(BuildContext context) {
    if (meta == null) return List.empty();
    return meta!.build(context, this);
  }

  // final Screen<R>? Function(Uri uri) parse;

  /// 页面骨架
  /// 树形父子Page的页面骨架有继承性，即自己没有配置骨架，就用父Page的骨架
  LayoutBuilder get layout {
    if (isRoot) return meta == null ? _emptyFrameBuilder : meta!.layout;
    return meta?.layout != null ? meta!.layout : _parent!.layout;
  }

  bool get isLeaf => kids.isEmpty;

  int get level => isRoot ? 0 : _parent!.level + 1;

  bool get isRoot => _parent == null;

  @override
  String get path {
    if (isRoot) return "/";
    var parentPath = _parent!.path;
    return parentPath == "/" ? "/$name" : "$parentPath/$name";
  }

  List<N> toList({bool includeThis = true}) {
    var flatChildren = kids.expand((element) => element.toList()).toList();
    return includeThis ? [this, ...flatChildren] : flatChildren;
  }

  N kid(String path) {
    N? result = this;
    // expect("/".split("/"), ["",""]);
    // expect("/a".split("/"), ["","a"]);
    // expect("/a/".split("/"), ["","a",""]);
    for (var split in path.split("/").map((e) => e.trim()).where((e) => e != "")) {
      result = result?.kidsMap[split];
      if (result == null) break;
    }
    assert(result != null, "page(${this.path}).kid($path) not found");
    return result!;
  }

  @override
  Screen<T> Function(String path) get parse => (uri) => layout<T>(this);

  String toStringShort() {
    return path;
  }

  @override
  String toString({bool? deep}) {
    if (deep == null || !deep) {
      return "Page($path ,kids:${kids.map((e) => e.toStringShort()).toList()})";
    } else {
      StringBuffer sb = StringBuffer();
      for (N n in toList()) {
        sb.write("$n\n");
      }
      return sb.toString();
    }
  }
}

/// Dart 3 class-modifiers:interface class
/// kua
mixin Layout<T> implements Screen<T> {}

class _EmptyLayout<T> extends StatelessWidget with Layout<T>, Screen<T> {
  final N<T> note;

  _EmptyLayout(this.note, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("当前是缺省Frame,您最少有个根Frame")),
      body: ListView(children: [
        ...note.build(context),
      ]),
    );
  }

  @override
  String get location => note.path;

  @override
  Rule<T> get rule => note;
}
