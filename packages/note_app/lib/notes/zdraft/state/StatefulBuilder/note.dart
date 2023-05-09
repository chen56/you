import 'package:flutter/widgets.dart';
import 'package:note/note_core.dart';

NoteConfPart page = NoteConfPart(
  shortTitle: "StatefulBuilder",
  builder: build,
);

build(BuildContext context, Pen print) {
  print.markdown(r'''
## 范例1   


  ''');

  // print.sample(const Sample1());
}
