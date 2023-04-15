import 'package:flutter/material.dart';
import 'package:note/page_core.dart';

PageMeta page = PageMeta(
  shortTitle: "Cheat sheet",
  builder: build,
);

build(BuildContext context, Pen pen, MainCell print) {
  pen.markdown(r'''
# Cheat sheet

wikipedia 定义：

>  **🚫Tip:**
> Cheat sheet: A cheat sheet (also cheatsheet) or crib sheet is a concise set of notes used for quick reference..

  ''');
}
