import 'package:flutter/material.dart';
import 'package:note/note_core.dart';

NoteConfPart page = NoteConfPart(
  shortTitle: "note项目自身机制",
  builder: build,
);

build(BuildContext context, Pen print) {
  print.markdown("""
# note项目运转

""");
  print.$____________________________________________________________________();
  // print(DevtoolsLauncher);
}
