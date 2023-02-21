import 'package:flutter/widgets.dart';
import 'package:learn_flutter/page.dart';


PageMeta notePage = PageMeta(
  shortTitle: "可选择性",
  builder: build,
);

build(Pen pen, BuildContext context) {
  pen.markdown(r'''
## flutter Note

flutter 默认是无法中UI文本的，相应的也无法进行页面搜索。

  ''');
}
