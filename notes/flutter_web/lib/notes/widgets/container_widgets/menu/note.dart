import 'package:flutter/material.dart';
import 'package:you_note_dart/note.dart';

void build(BuildContext context, Print print) {
  print(const MD(r'''
# 菜单Menu

  '''));

  print(const MD(r'''

## CheckboxMenuButton

  '''));

  print=print.next(title:const Text("new cell-----------------"));
  print(Row(
    children: [
      CheckboxMenuButton(value: true, onChanged: (bool? value) {}, child: const Text('CheckboxMenuButton')),
    ],
  ));
}
