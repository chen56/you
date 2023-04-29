import 'package:flutter/widgets.dart';
import 'package:note/page_core.dart';

NoteBuilder page = NoteBuilder(
  shortTitle: " Dismissible滑动清除",
  builder: build,
);

build(BuildContext context, Pen print) {
  print.markdown(r'''
## 参考

<https://flutter.cn/docs/cookbook/gestures/dismissible> 


  ''');
}
