import 'package:flutter/widgets.dart';
import 'package:note/page_core.dart';

PageMeta page = PageMeta(
  shortTitle: "Slider进度条",
  builder: build,
);

build(Pen pen, BuildContext context) {
  pen.markdown(r'''
# 进度条  

## 范例1 普通文本 

Text.new()

  ''');

  pen.markdown(r'''
## 范例1 富文本 

Text.rich()

  ''');
}
