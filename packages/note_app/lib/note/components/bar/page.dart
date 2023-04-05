import 'package:flutter/material.dart';
import 'package:note/page_core.dart';

PageMeta page = PageMeta(
  shortTitle: "各种Bar",
  builder: build,
);

build(Pen pen, BuildContext context) {
  pen.markdown(r'''
  

''');
}
