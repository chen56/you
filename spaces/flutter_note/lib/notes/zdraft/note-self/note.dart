import 'package:flutter/material.dart';
import 'package:note/note_page.dart';

FlutterNoteConf page = FlutterNoteConf(
  builder: build,
);

build(BuildContext context, Pen print) {
  print.markdown("""
# note项目运转

""");
  print.$____________________________________________________________________();
  // print(DevtoolsLauncher);
}
