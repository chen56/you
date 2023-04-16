import 'package:flutter/material.dart';
import 'package:note/page_core.dart';
import 'package:note_mate_flutter/material.dart';

PageMeta page = PageMeta(
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

  print.nextCell___________________________((context, print) {
    print(SampleNote(Row$Mate(
      children: [
        CheckboxMenuButton$Mate(
            value: true, onChanged: (bool? value) {}, child: Text$Mate('CheckboxMenuButton')),
      ],
    )));
  });
}
