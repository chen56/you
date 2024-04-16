

import 'package:note/note.dart';
import 'package:flutter/material.dart';

class ObjectContentExt extends NoteContentExt {
  ObjectContentExt();

  @override
  NoteContentWidgetMixin? create(Object? data, NoteContentArg arg) {
    return ObjectContentWidget(content: ObjectContent(data));
  }
}

class ObjectContent extends NoteContent {
  final Object? object;

  ObjectContent(this.object);

  @override
  String toString() {
    return "ObjectNote('${object?.toString()}')";
  }
}

class ObjectContentWidget extends StatelessWidget with NoteContentWidgetMixin {
  final ObjectContent content;

  const ObjectContentWidget({super.key, required this.content});

  @override
  get isMarkdown => false;

  @override
  Widget build(BuildContext context) {
    return SelectableText("${content.object}");
  }
}