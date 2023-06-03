import 'package:flutter/widgets.dart';
import 'package:note/note_page.dart';

FlutterNoteConf page = FlutterNoteConf(
  builder: build,
);

build(BuildContext context, Pen print) {
  print.markdown(r'''
## 范例1


  ''');

  // print.sample(const Sample1());
}
