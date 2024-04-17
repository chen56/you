import 'package:flutter/material.dart';
import 'package:note_dart/src/note_core.dart';

class ObjectContentWidget extends StatelessWidget with NoteContentWidgetMixin {
  final Object? content;

  const ObjectContentWidget({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Text("$content");
  }
}
