import 'package:flutter/material.dart';
import 'package:mate/mate_note.dart';
import 'package:note/note_page.dart';
import 'package:mate_flutter/material.dart';

FlutterNoteConf page = FlutterNoteConf(
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
  print(MateSampleContent(Wrap$Mate(children: [
    // IconButton$Mate(onPressed: () {}, child: Text$Mate("ElevatedButton")),
  ])));
}
