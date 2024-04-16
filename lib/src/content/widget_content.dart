import 'package:flutter/material.dart';
import 'package:note/note.dart';
import 'package:note/src/note_core.dart';


class WidgetContentExtension extends NoteContentExt {
  WidgetContentExtension();

  @override
  NoteContentWidgetMixin? create(Object? data, NoteContentArg arg) {
    if (data is Widget) {
      return WidgetContentWidget(content: WidgetContent(data));
    } else if (data is WidgetContent) {
      return WidgetContentWidget(content: data);
    }
    return null;
  }
}

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
