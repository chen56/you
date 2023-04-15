import 'package:flutter/material.dart';
import 'package:note/page_core.dart';

PageMeta page = PageMeta(
  shortTitle: "note项目自身机制",
  builder: build,
);

build(BuildContext context, Pen pen, MainCell print) {
  print("hello note 1");
  print("hello note 2");

  print = pen.nextCell___________________________;
  print.markdown("## markdown content");

  print = pen.nextCell___________________________;
  print("hello note 3");
  print("hello note 4");
}
