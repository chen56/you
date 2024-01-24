import 'package:flutter/material.dart';
import 'package:note/note.dart';

build(BuildContext context, Pen print) {
  print.markdown(r'''
# 菜单Menu

  ''');

  print.markdown(r'''

## CheckboxMenuButton

  ''');

  print.$____________________________________________________________________();
  print(WidgetContent(Row(
    children: [
      CheckboxMenuButton(
          value: true,
          onChanged: (bool? value) {},
          child: Text('CheckboxMenuButton')),
    ],
  )));
}
