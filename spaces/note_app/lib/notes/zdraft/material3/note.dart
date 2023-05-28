import 'package:flutter/material.dart';
import 'package:note/note_page.dart';

NoteConfPart page = NoteConfPart(
  shortTitle: "Material3概览",
  builder: build,
);

build(BuildContext context, Pen print) {
  print.markdown(r'''
# Material3

> Material3 组件索引参考:
> <https://api.flutter.dev/flutter/material/ThemeData/useMaterial3.html>



  ''');
}
