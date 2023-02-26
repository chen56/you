import 'package:flutter/widgets.dart';
import 'package:flutter_note/page.dart';

PageMeta notFoundPage = PageMeta(
  shortTitle: "404",
  builder: build,
);

build(Pen pen, BuildContext context) {
  pen.markdown(r'''
## 404 Not Found 


  ''');
}
