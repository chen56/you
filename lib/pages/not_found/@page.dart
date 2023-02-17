import 'package:flutter/widgets.dart';
import 'package:learn_flutter/page.dart';

PageMeta notFoundPage = PageMeta(
  title: "404",
  builder: build,
);

build(Pen pen, BuildContext context) {
  pen.markdown(r'''
## 404 Not Found 


  ''');
}
