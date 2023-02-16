import 'package:flutter/widgets.dart';
import 'package:learn_flutter/page.dart';

Meta welcomePage = Meta(
  title: "welcome",
  builder: build,
);

build(Pen pen, BuildContext context) {
  pen.markdown(r'''
## 欢迎来到flutter世界 
  ''');
}
