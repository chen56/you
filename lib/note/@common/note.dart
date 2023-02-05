import 'dart:collection';

import 'package:flutter/widgets.dart';

class Pag with ChangeNotifier {
  final String title;
  final List<Pag> children;
  final Map<String, Pag> childrenMap = {};
  Pag? _parent;
  late final Map<String, Object> attributes;

  Skeleton _skeleton = EmptySkeleton();

  Pag(
    this.title, {
    Skeleton? skeleton,
    this.children = const [],
  }) {
    _skeleton = skeleton ?? _skeleton;
    for (var child in children) {
      child._parent = this;
      childrenMap[child.title] = child;
    }
    attributes = _NoteAttributes(this);
  }

  /// 页面骨架
  /// 树形父子Page的页面骨架有继承性，即自己没有配置骨架，就用父Page的骨架
  Skeleton get skeleton {
    if (isRoot) return _skeleton;
    return _skeleton is EmptySkeleton ? _skeleton : _parent!.skeleton;
  }

  bool get isLeaf => children.isEmpty;

  void sample(Widget sample) {}

  void markdown(String s) {
    // print(s);
  }

  int get level => isRoot ? 0 : _parent!.level + 1;

  bool get isRoot => _parent == null;

  List<Pag> toList({bool includeThis = true}) {
    var flatChildren = children.expand((element) => element.toList()).toList();
    return includeThis ? [this, ...flatChildren] : flatChildren;
  }

  Pag child(String path) {
    Pag? result = this;
    // expect("/".split("/"), ["",""]);
    // expect("/a".split("/"), ["","a"]);
    // expect("/a/".split("/"), ["","a",""]);
    for (var split in path.split("/").map((e) => e.trim()).where((e) => e != "")) {
      result = result?.childrenMap[split];
      if (result == null) break;
    }
    assert(result != null, "child($path) not found");
    return result!;
  }
}

abstract class Skeleton {
  Widget embed(Widget child);
}

class EmptySkeleton extends Skeleton {
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
