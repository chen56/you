import 'package:flutter/material.dart';
import 'package:note/note_page.dart';

FlutterNoteConf page = FlutterNoteConf(
  shortTitle: "temp page",
  builder: build,
);

build(BuildContext context, Pen print) {
  var i = 1;
  print.runInCurrentCell((print) {
    print(i);
  });

  {
    void x() {
      // 特殊语句
      print.runInCurrentCell((print) {
        print(i);
      });
    }

    x();
  }
}
