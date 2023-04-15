import 'package:flutter/widgets.dart';
import 'package:note/page_core.dart';

PageMeta page = PageMeta(
  shortTitle: "404",
  builder: build,
);

build(BuildContext context, Pen pen, MainCell print) {
  pen.markdown(r'''
## 404 Not Found 


  ''');
}
