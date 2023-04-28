import 'package:flutter/material.dart';
import 'package:note/page_core.dart';

PageMeta page = PageMeta(
  shortTitle: "exception",
  builder: build,
);

build(BuildContext context, Pen print) {
  print.markdown("""
# exception

""");

  print("hello");
}
