import 'package:flutter/material.dart';
import 'package:note/page_core.dart';
import 'package:note_app/note_app.dart';

NoteBuilder page = NoteBuilder(
  shortTitle: "Flutter Cheat sheet",
  layout: Layouts.defaultLayout(defaultCodeExpand: false),
  builder: build,
);

build(BuildContext context, Pen print) {
  print.markdown(r'''
# Cheat sheet

wikipedia 定义：

>  **🚫Tip:**
> Cheat sheet: A cheat sheet (also cheatsheet) or crib sheet is a concise set of notes used for quick reference..

  ''');
}
