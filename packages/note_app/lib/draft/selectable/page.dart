import 'package:flutter/widgets.dart';
import 'package:note/page_core.dart';

PageMeta page = PageMeta(
  shortTitle: "可选择性",
  builder: build,
);

build(BuildContext context, Pen print) {
  print.markdown(r'''
## flutter Note

flutter 默认是无法中UI文本的，相应的也无法进行页面搜索。

  ''');
}
