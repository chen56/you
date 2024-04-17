import 'package:flutter/material.dart';
import 'package:note_dart/src/note_core.dart';


// FIXME 同样可以拆除
class WidgetContentWidget extends StatelessWidget with NoteContentWidgetMixin {
  final Widget content;

  const WidgetContentWidget({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return content;
  }
}