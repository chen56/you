import 'package:flutter/widgets.dart';
import 'package:note/page_core.dart';

PageMeta page = PageMeta(
  shortTitle: " Dismissible滑动清除",
  builder: build,
);

build(Pen pen, BuildContext context) {
  pen.markdown(r'''
## 参考

<https://flutter.cn/docs/cookbook/gestures/dismissible> 


  ''');
}
