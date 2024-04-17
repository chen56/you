import 'package:flutter/material.dart';
import 'package:note_dart/note.dart';
import 'package:note_dart/src/note_core.dart';


 class WidgetContentWidget extends StatelessWidget with NoteContentWidgetMixin {
  final WidgetContent content;

  const WidgetContentWidget({super.key, required this.content});

  @override
  get isMarkdown => false;

  @override
  Widget build(BuildContext context) {
    return content.widget;
  }
}

class WidgetContent extends NoteContent {
  final Widget widget;

  WidgetContent(this.widget);

  @override
  String toString() {
    return "WidgetNote('${widget.runtimeType}')";
  }
}
