import 'package:flutter/widgets.dart';
import 'package:note/page.dart';

PageMeta page = PageMeta(
  shortTitle: "404",
  builder: build,
);

build(Pen pen, BuildContext context) {
  pen.markdown(r'''
## 404 Not Found 


  ''');
}
