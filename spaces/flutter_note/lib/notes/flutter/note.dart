import 'package:flutter/material.dart';
import 'package:note/note_page.dart';
import 'package:flutter_note/flutter_note.dart';

FlutterNoteConf page = FlutterNoteConf(
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
