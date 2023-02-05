import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:learn_flutter/navigator.dart';

void Function(Note note, BuildContext context) _Empty = (_, __) {};

class NoteMeta {
  final String title;
  final void Function(Note note, BuildContext context) builder;

  NoteMeta({
    required this.title,
    required this.builder,
  });

  NoteMeta._empty()
      : title = "",
        builder = _Empty;
}

/// 用kids代替单词children,原因是children太长了
class Note with ChangeNotifier   {
  final String name;
  final List<Note> kids;
  final Map<String, Note> kidsMap = {};
  Note? _parent;
  late final Map<String, Object> attributes;

  late final Skeleton _skeleton;
  late final NoteMeta meta;

  Note(
    this.name, {
    NoteMeta? meta,
    Skeleton? skeleton,
    this.kids = const [],
  }) {
    _skeleton = skeleton ?? _EmptySkeleton();
    this.meta = meta ?? NoteMeta._empty();
    attributes = _NoteAttributes(this);

    for (var child in kids) {
      child._parent = this;
      kidsMap[child.name] = child;
    }
  }

  // final Screen<R>? Function(Uri uri) parse;

  /// 页面骨架
  /// 树形父子Page的页面骨架有继承性，即自己没有配置骨架，就用父Page的骨架
  Skeleton get skeleton {
    if (isRoot) return _skeleton;
    return _skeleton is _EmptySkeleton ? _skeleton : _parent!.skeleton;
  }

  void set skeleton(Skeleton value) {
    _skeleton = value;
  }

  bool get isLeaf => kids.isEmpty;

  void sample(Widget sample) {}

  void markdown(String s) {
    // print(s);
  }

  int get level => isRoot ? 0 : _parent!.level + 1;

  bool get isRoot => _parent == null;

  String get path {
    if (isRoot) return "/";
    var parentPath = _parent!.path;
    return parentPath == "/" ? "/$name" : "$parentPath/$name";
  }

  List<Note> toList({bool includeThis = true}) {
    var flatChildren = kids.expand((element) => element.toList()).toList();
    return includeThis ? [this, ...flatChildren] : flatChildren;
  }

  Note kid(String path) {
    Note? result = this;
    // expect("/".split("/"), ["",""]);
    // expect("/a".split("/"), ["","a"]);
    // expect("/a/".split("/"), ["","a",""]);
    for (var split
        in path.split("/").map((e) => e.trim()).where((e) => e != "")) {
      result = result?.kidsMap[split];
      if (result == null) break;
    }
    assert(result != null, "child($path) not found");
    return result!;
  }

}

abstract class Skeleton {
  const Skeleton();

  Widget embed(Widget child);
}

class _EmptySkeleton extends Skeleton {
  const _EmptySkeleton();

  @override
  Widget embed(Widget child) {
    return child;
  }
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
