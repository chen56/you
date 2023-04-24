import 'package:flutter/widgets.dart';
import 'package:note/page_core.dart';

PageMeta page = PageMeta(
  shortTitle: "flutter State",
  builder: build,
);

build(BuildContext context, Pen print) {
  print.markdown(r'''
# flutter State

StatefulWidget 重要特性：
- 会在窗口resize时重新build

  ''');
}
