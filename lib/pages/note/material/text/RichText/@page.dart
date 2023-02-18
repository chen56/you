import 'package:flutter/widgets.dart';
import 'package:learn_flutter/page.dart';

PageMeta widgetRichTextNote = PageMeta(
  shortTitle: "RichText",
  builder: build,
);

build(Pen pen ,BuildContext context) {
  pen. markdown(r'''
## 范例1 普通文本

RichText.new()

  ''');
}
