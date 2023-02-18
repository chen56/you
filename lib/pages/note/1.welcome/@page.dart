import 'package:flutter/widgets.dart';
import 'package:learn_flutter/page.dart';

PageMeta welcomePage = PageMeta(
  title: "welcome",
  builder: build,
);

build(Pen pen, BuildContext context) {
  pen.markdown(r'''
  
# 1

111

## 1.1

1.11111

## 1.2

1.22222
  
  ''');
}
