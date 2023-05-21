import 'package:flutter/material.dart';
import 'package:note/mate_note.dart';
import 'package:note/note_core.dart';
import 'package:note_mate_flutter/material.dart';

NoteConfPart page = NoteConfPart(
  shortTitle: "菜单Menu",
  builder: build,
);

build(BuildContext context, Pen print) {
  print.markdown(r'''
# 菜单Menu

  ''');

  print.markdown(r'''

## CheckboxMenuButton

  ''');

  print.$____________________________________________________________________();
  print(MateSample(Row$Mate(
    children: [
      CheckboxMenuButton$Mate(
          value: true,
          onChanged: (bool? value) {},
          child: Text$Mate('CheckboxMenuButton')),
    ],
  )));
}
