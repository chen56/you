import 'package:flutter/widgets.dart';
import 'package:note/page_core.dart';

PageMeta page = PageMeta(
  shortTitle: "RichText",
  builder: build,
);

build(Pen pen, BuildContext context) {
  pen.markdown(r'''
## 范例1 普通文本

RichText.new()

  ''');
}
