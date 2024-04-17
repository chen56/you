

import 'package:flutter/material.dart';
import 'package:note_dart/src/note_core.dart';

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
  Widget build(BuildContext context) {
    return Text("${content.object}");
  }
}