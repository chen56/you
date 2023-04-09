import 'package:flutter/material.dart';
import 'package:note/page_core.dart';

PageMeta page = PageMeta(
  shortTitle: "Material3概览",
  builder: build,
);

build(BuildContext context, Pen pen) {
  pen.markdown(r'''
# Material3

> Material3 组件索引参考:
> <https://api.flutter.dev/flutter/material/ThemeData/useMaterial3.html>



  ''');
}
