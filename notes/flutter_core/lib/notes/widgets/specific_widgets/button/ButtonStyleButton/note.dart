import 'package:flutter/material.dart';
import 'package:note_lang_dart/note.dart';

build(BuildContext context, Pen print) {
  print.markdown(r'''
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


  ''');

  print.$____________________________________________________________________();
  print(WidgetContent(Wrap(children: [
    ElevatedButton(onPressed: () {}, child: const Text("ElevatedButton")),
  ])));

  print.$____________________________________________________________________();
  print.markdown(r'''
## 范例2 Meta

  ''');
}
