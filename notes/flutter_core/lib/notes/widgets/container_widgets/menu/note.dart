import 'package:flutter/material.dart';
import 'package:note_dart/note.dart';

build(BuildContext context, Pen print) {
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
