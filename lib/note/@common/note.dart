import 'dart:collection';

import 'package:flutter/widgets.dart';

/// 用kids代替单词children,原因是children太长了
class Pag with ChangeNotifier {
  final String title;
  final List<Pag> kids;
  final Map<String, Pag> kidsMap = {};
  Pag? _parent;
  late final Map<String, Object> attributes;

  Skeleton _skeleton = const _EmptySkeleton();

  Pag(
    this.title, {
    Skeleton? skeleton,
    this.kids = const [],
  }) {
    _skeleton = skeleton ?? _skeleton;
    for (var child in kids) {
      child._parent = this;
      kidsMap[child.title] = child;
    }
    attributes = _NoteAttributes(this);
  }

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

  List<Pag> toList({bool includeThis = true}) {
    var flatChildren = kids.expand((element) => element.toList()).toList();
    return includeThis ? [this, ...flatChildren] : flatChildren;
  }

  Pag kid(String path) {
    Pag? result = this;
    // expect("/".split("/"), ["",""]);
    // expect("/a".split("/"), ["","a"]);
    // expect("/a/".split("/"), ["","a",""]);
    for (var split in path.split("/").map((e) => e.trim()).where((e) => e != "")) {
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
