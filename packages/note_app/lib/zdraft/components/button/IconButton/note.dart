import 'package:flutter/material.dart';
import 'package:note/note_core.dart';
import 'package:note_mate_flutter/material.dart';

NoteConfPart page = NoteConfPart(
  shortTitle: "IconButton",
  builder: build,
);

build(BuildContext context, Pen print) {
  print.markdown(r'''
# IconButton

图标按钮。

继承关系：

- [StatelessWidget]
  - [IconButton] 
  ''');

  print.$____________________________________________________________________();
  print(MateSample(Wrap$Mate(children: [
    // IconButton$Mate(onPressed: () {}, child: Text$Mate("ElevatedButton")),
  ])));
}
