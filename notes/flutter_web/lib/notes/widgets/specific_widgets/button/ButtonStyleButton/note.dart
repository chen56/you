import 'package:flutter/material.dart';
import 'package:you_note_dart/note.dart';

void build(BuildContext context, Cell print) {
  print(const MD(r'''
# ButtonStyleButton

ButtonStyleButton 相关子类

* [StatefulWidget]
  * [ButtonStyleButton]
    * [ElevatedButton], a filled overview whose material elevates when pressed.
    * [FilledButton]
      1. Constructor [FilledButton], a filled overview variant that uses a secondary fill color.
      1. Constructor [FilledButton.tonal], a filled overview variant that uses a secondary fill color.
    * [OutlinedButton], a overview with an outlined border and no fill color.
    * [TextButton], a overview with no outline or fill color.


  '''));

  print=print.addCell(title:const Text("new cell-----------------"));
  print(Wrap(children: [
    ElevatedButton(onPressed: () {}, child: const Text("ElevatedButton")),
  ]));

  print=print.addCell(title:const Text("new cell-----------------"));
  print(const MD(r'''
## 范例2 Meta

  '''));
}
