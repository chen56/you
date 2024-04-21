import 'package:flutter/material.dart';
import 'package:you_note_dart/note.dart';

void build(BuildContext context, CellPrint print) {
  print.markdown(r'''
# 菜单Menu

  ''');

  print.markdown(r'''

## CheckboxMenuButton

  ''');

  print.$____________________________________________________________________();
  print(Row(
    children: [
      CheckboxMenuButton(value: true, onChanged: (bool? value) {}, child: const Text('CheckboxMenuButton')),
    ],
  ));
}
