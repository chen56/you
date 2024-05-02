import 'package:flutter/widgets.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:you_note_dart/src/note/contents/markdown_content.dart';

final Contents contents=Contents._();
class Contents{
  Contents._();
  Widget contentToWidget(content) {
    return switch (content) {
      MD _ => MarkdownBody(data: content.text),
      Widget _ => content,
      _ => Text("$content"),
    };
  }
}