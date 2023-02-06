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

typedef FrameBuilder = Frame Function(Note note);

Frame _emptyFrameBuilder(note) => EmptyFrame(note);

/// 用kids代替单词children,原因是children太长了
class Note with ChangeNotifier implements Rule<void> {
  final String name;
  final List<Note> kids;
  final List<Widget> widgets = List.empty(growable: true);
  final Map<String, Note> kidsMap = {};
  Note? _parent;
  late final Map<String, Object> attributes;

  late final FrameBuilder _frameBuilder;
  late final NoteMeta meta;

  Note(
    this.name, {
    NoteMeta? meta,
    FrameBuilder? frame,
    this.kids = const [],
  }) {
    _frameBuilder = frame ?? _emptyFrameBuilder;
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
  FrameBuilder get skeleton {
    if (isRoot) return _frameBuilder;
    return _frameBuilder != _emptyFrameBuilder
        ? _frameBuilder
        : _parent!.skeleton;
  }

  get uri => Uri(path: path);

  bool get isLeaf => kids.isEmpty;

  void sample(Widget sample) {}

  void markdown(String s) {}

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
    assert(result != null, "page(${this.path}).kid($path) not found");
    return result!;
  }
  // /note/material/button/ElevatedButton
  // /note/meterial/button/ElevatedButton
  @override
  Screen Function(String path) get parse => (uri)=>_frameBuilder(this);

  String toStringShort() {
    return path;
  }
  @override
  String toString({bool? deep}) {
    if(deep==null||!deep){
      return "Page($path ,kids:${kids.map((e) => e.toStringShort()).toList()})";
    }else{
      StringBuffer sb =  StringBuffer();
      for(Note n in toList()){
        sb.write("$n\n");
      }
      return sb.toString();
    }
  }
}

abstract class Frame implements Screen {}

class EmptyFrame extends StatelessWidget with Frame, Screen {
  final Note note;

  EmptyFrame(this.note);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text("_emptyFrame(page:${note.uri})"),
      ...note.widgets,
    ]);
  }

  @override
  Uri get uri => note.uri;

  @override
  String get location => note.uri.toString();

  @override
  Rule get rule => note;
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
