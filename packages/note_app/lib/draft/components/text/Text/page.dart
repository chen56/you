import 'package:flutter/widgets.dart';
import 'package:note/page_core.dart';

PageMeta page = PageMeta(
  shortTitle: "Text",
  builder: build,
);

build(BuildContext context, Pen pen, MainCell print) {
  pen.markdown(r'''
## 范例1 普通文本 

Text.new()

  ''');

  // pen.sampleFile(const NormalTextSample());

  pen.markdown(r'''
## 范例1 富文本 

Text.rich()

  ''');

  // pen.sampleFile(const RichTextSample());
}
