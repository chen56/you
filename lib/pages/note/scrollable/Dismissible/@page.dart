import 'package:flutter/widgets.dart';
import 'package:learn_flutter/page.dart';

PageMeta notFoundPage = PageMeta(
  title: " Dismissible滑动清除",
  builder: build,
);

build(Pen pen, BuildContext context) {
  pen.markdown(r'''
## 参考

<https://flutter.cn/docs/cookbook/gestures/dismissible> 


  ''');
}
