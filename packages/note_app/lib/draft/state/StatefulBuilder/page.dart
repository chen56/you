import 'package:flutter/widgets.dart';
import 'package:note/page_core.dart';

PageMeta page = PageMeta(
  shortTitle: "StatefulBuilder",
  builder: build,
);

build(Pen pen, BuildContext context) {
  pen.markdown(r'''
## 范例1   


  ''');

  // pen.sample(const Sample1());
}
