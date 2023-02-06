import 'package:flutter/widgets.dart';
import 'package:learn_flutter/note/note.dart';

NoteMeta widgetRichTextNote = NoteMeta(
  title: "RichText",
  builder: build,
);

build(NotePen note ,BuildContext context) {
  note.markdown(r'''
## 范例1 普通文本

RichText.new()

  ''');
}
