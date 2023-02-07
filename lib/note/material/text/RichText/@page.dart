import 'package:flutter/widgets.dart';
import 'package:learn_flutter/note.dart';

PageMeta widgetRichTextNote = PageMeta(
  title: "RichText",
  builder: build,
);

build(Pen note ,BuildContext context) {
  note.markdown(r'''
## 范例1 普通文本

RichText.new()

  ''');
}
