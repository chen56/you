import 'package:flutter/material.dart';
import 'package:note/page_core.dart';
import 'package:note_mate_flutter/material.dart';

PageMeta page = PageMeta(
  shortTitle: "菜单Menu",
  builder: build,
);

build(BuildContext context, Pen pen) {
  pen.markdown(r'''
# 菜单Menu

  ''');

  pen.markdown(r'''

## CheckboxMenuButton

  ''');

  pen.sampleMate(
    Row$Mate(
      children: [
        CheckboxMenuButton$Mate(
            value: true, onChanged: (bool? value) {}, child: Text$Mate('CheckboxMenuButton')),
      ],
    ),
  );
}
