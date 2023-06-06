import 'package:flutter/material.dart';
import 'package:mate/mate_note.dart';
import 'package:note/note.dart';
import 'package:mate_flutter/material.dart';

build(BuildContext context, Pen print) {
  print.markdown(r'''
# 菜单Menu

  ''');

  print.markdown(r'''

## CheckboxMenuButton

  ''');

  print.$____________________________________________________________________();
  print(MateSampleContent(Row$Mate(
    children: [
      CheckboxMenuButton$Mate(
          value: true,
          onChanged: (bool? value) {},
          child: Text$Mate('CheckboxMenuButton')),
    ],
  )));
}
