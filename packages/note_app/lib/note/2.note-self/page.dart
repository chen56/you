import 'package:flutter/material.dart';
import 'package:note/page_core.dart';

PageMeta page = PageMeta(
  shortTitle: "note项目自身机制",
  builder: build,
);

build(BuildContext context, Pen print) {
  print.markdown("""
# note项目机制

""");
}
