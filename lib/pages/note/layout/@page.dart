import 'package:flutter/widgets.dart';
import 'package:flutter_note/page.dart';

PageMeta page = PageMeta(
  shortTitle: "layout布局",
  builder: build,
);

build(Pen pen, BuildContext context) {
  pen.markdown(r'''

# 布局

## 弹性布局

- Flex <https://api.flutter-io.cn/flutter/widgets/Flex-class.html>
  - Row
  - Column

  ''');
}
