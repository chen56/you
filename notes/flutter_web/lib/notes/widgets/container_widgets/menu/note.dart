import 'package:flutter/material.dart';
import 'package:you_note_dart/note.dart';

void build(BuildContext context, Cell print) {
  print.markdown(r'''
# 菜单Menu

  ''');

  print.markdown(r'''

## CheckboxMenuButton

  ''');

  print=print.next(title:const Text("new cell-----------------"));
  print(Row(
    children: [
      CheckboxMenuButton(value: true, onChanged: (bool? value) {}, child: const Text('CheckboxMenuButton')),
    ],
  ));
}
