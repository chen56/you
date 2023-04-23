import 'package:flutter/widgets.dart';
import 'package:note/page_core.dart';

PageMeta page = PageMeta(
  shortTitle: "StatefulBuilder",
  builder: build,
);

build(BuildContext context, Pen print) {
  print.markdown(r'''
## 范例1   


  ''');

  // print.sample(const Sample1());
}
