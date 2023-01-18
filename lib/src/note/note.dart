import 'dart:collection';

import 'package:flutter/widgets.dart';

class Note with ChangeNotifier{
  final String title;
  final List<Note> children;
  Note? _parent;
  late final Map<String,Object> attributes;
  Note(
    this.title, {
    this.children = const [],
  }) {
    for (var child in children) {
      child._parent = this;
    }
    attributes=_NoteAttributeMap(this);
  }

  bool get isLeaf => children.isEmpty;

  void sample(Widget sample) {}

  void markdown(String s) {
    // print(s);
  }

  int get level => isRoot ? 0 : _parent!.level + 1;

  bool get isRoot => _parent == null;

  List<Note> toList({bool includeThis = true}) {
    var flatChildren = children.expand((element) => element.toList()).toList();
    return includeThis ? [this, ...flatChildren] : flatChildren;
  }
}


class _NoteAttributeMap extends MapBase<String,Object> {
  final Map<String,Object> _attributes={};
  ChangeNotifier notifier;
  _NoteAttributeMap(this.notifier);

  @override
  Object? operator [](Object? key) {
    return _attributes[key];
  }

  @override
  void operator []=(String key, Object value) {
    _attributes[key]=value;
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
    var result=_attributes.remove(key);
    notifier.notifyListeners();
    return result;
  }
}