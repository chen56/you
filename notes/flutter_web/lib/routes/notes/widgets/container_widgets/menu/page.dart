import 'package:flutter/material.dart';
import 'package:you_flutter/note.dart';

void build(BuildContext context, Cell print) {
  print(const MD(r'''
# 菜单Menu

  '''));

  print(const MD(r'''

## CheckboxMenuButton

  '''));

  print=print.addCell(title:const Text("new cell-----------------"));
  print(Row(
    children: [
      CheckboxMenuButton(value: true, onChanged: (bool? value) {}, child: const Text('CheckboxMenuButton')),
    ],
  ));
}
