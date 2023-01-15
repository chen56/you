import 'package:flutter/widgets.dart';

class Note {
  String title;
  List<Note> children;
  Note? parent;

  Note(
    this.title, {
    this.children = const [],
  }) {
    children.forEach((element) {
      print("this:$this.title");
      element.parent = this;
    });
  }

  bool get isLeaf => children.isEmpty;

  void sample(Widget sample) {}

  void markdown(String s) {
    // print(s);
  }

  int get level => isRoot ? 0 : parent!.level + 1;

  bool get isRoot => parent == null;

  List<Note> toList({bool includeThis = true}) {
    var flatChildren = children.expand((element) => element.toList()).toList();
    return includeThis ? [this, ...flatChildren] : flatChildren;
  }
}
