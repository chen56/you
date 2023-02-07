import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:learn_flutter/navigator_v2.dart';
import 'package:learn_flutter/note/frame.dart';

/// <T> [Navigator.push] 的返回类型
class PageMeta<T> {
  final String title;
  final void Function(Pen<void> note, BuildContext context) builder;
  late final FrameBuilder frameBuilder;

  PageMeta({
    required this.title,
    required this.builder,
    FrameBuilder? frameBuilder,
  }) {
    this.frameBuilder = frameBuilder ?? <T>(N<T> note) => NoteFrame<T>(note);
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

typedef FrameBuilder = Frame<T> Function<T>(N<T> note);

Frame<T> _emptyFrameBuilder<T>(note) => EmptyFrame<T>(note);

/// 用kids代替单词children,原因是children太长了
class N<T> with ChangeNotifier implements Rule<T> {
  final String name;
  final List<N> kids;
  final Map<String, N> kidsMap = {};
  N? _parent;
  late final Map<String, Object> attributes;
  late final PageMeta<T>? meta;

  N(
    this.name, {
    this.meta,
    FrameBuilder? frame,
    this.kids = const [],
  }) {
    attributes = _NoteAttributes(this);

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
  FrameBuilder get frame {
    if (isRoot) return meta == null ? _emptyFrameBuilder : meta!.frameBuilder;
    return meta?.frameBuilder != null ? meta!.frameBuilder : _parent!.frame;
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
  Screen<T> Function(String path) get parse => (uri) => frame<T>(this);

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

abstract class Frame<T> implements Screen<T> {}

class EmptyFrame<T> extends StatelessWidget with Frame<T>, Screen<T> {
  final N<T> note;

  EmptyFrame(this.note, {super.key});

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

class _NoteAttributes extends MapBase<String, Object> {
  final Map<String, Object> _attributes = {};
  ChangeNotifier notifier;

  _NoteAttributes(this.notifier);

  @override
  Object? operator [](Object? key) {
    return _attributes[key];
  }

  @override
  void operator []=(String key, Object value) {
    _attributes[key] = value;
    notifier.notifyListeners();
  }

  @override
  void clear() {
    _attributes.clear();
    notifier.notifyListeners();
  }

  @override
  Iterable<String> get keys => _attributes.keys;

  @override
  Object? remove(Object? key) {
    var result = _attributes.remove(key);
    notifier.notifyListeners();
    return result;
  }
}
