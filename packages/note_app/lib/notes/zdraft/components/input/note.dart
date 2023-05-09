import 'package:flutter/material.dart';
import 'package:note/note_core.dart';

NoteConfPart page = NoteConfPart(
  shortTitle: "输入组件",
  builder: build,
);

build(BuildContext context, Pen print) {
  print.markdown(r'''
# input


  ''');
}
