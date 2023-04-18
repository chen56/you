import 'package:flutter/material.dart';
import 'package:note/page_core.dart';
import 'package:note_mate_flutter/material.dart';

PageMeta page = PageMeta(
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

  print.nextCell___________________________();
  print(SampleContent(Wrap$Mate(children: [
    // IconButton$Mate(onPressed: () {}, child: Text$Mate("ElevatedButton")),
  ])));
}
