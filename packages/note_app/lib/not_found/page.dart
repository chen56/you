import 'package:flutter/widgets.dart';
import 'package:note/page_core.dart';

PageMeta page = PageMeta(
  shortTitle: "404",
  builder: build,
);

build(BuildContext context, Pen print) {
  print.markdown(r'''
## 404 Not Found 


  ''');
}
