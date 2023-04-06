import 'package:flutter/material.dart';
import 'package:note/page_core.dart';

PageMeta page = PageMeta(
  shortTitle: "Cheat sheet",
  builder: build,
);

build(Pen pen, BuildContext context) {
  pen.markdown(r'''
# Cheat sheet

> A cheat sheet (also cheatsheet) or crib sheet is a concise set of notes used for quick reference..

  ''');
}
