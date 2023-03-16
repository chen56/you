import 'package:flutter/widgets.dart';
import 'package:note/page_core.dart';

import '1.text_normal.dart';
import '2.text_rich.dart';

PageMeta page = PageMeta(
  shortTitle: "Text",
  builder: build,
);

build(Pen pen, BuildContext context) {
  pen.markdown(r'''
## 范例1 普通文本 

Text.new()

  ''');

  pen.sample(const NormalTextSample());

  pen.markdown(r'''
## 范例1 富文本 

Text.rich()

  ''');

  pen.sample(const RichTextSample());
}
