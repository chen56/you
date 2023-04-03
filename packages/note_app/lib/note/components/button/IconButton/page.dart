import 'package:flutter/material.dart';
import 'package:note/page_core.dart';
import 'package:note_mate_flutter/material.dart';

PageMeta page = PageMeta(
  shortTitle: "ButtonStyleButton",
  builder: build,
);

build(Pen pen, BuildContext context) {
  pen.markdown(r'''
# IconButton

继承关系：

- [StatelessWidget]
  - [IconButton] 

### Sample1

- a
- b
- c

  ''');

  pen.sampleMate(Wrap$Mate(children: [
    ElevatedButton$Mate(onPressed: () {}, child: Text$Mate("ElevatedButton")),
  ]));

  pen.markdown(r'''
## 范例2 Meta 

  ''');
}
