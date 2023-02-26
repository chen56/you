import 'package:flutter/widgets.dart';
import 'package:flutter_note/page.dart';

PageMeta notePage = PageMeta(
  shortTitle: "note",
  builder: build,
);

build(Pen pen, BuildContext context) {
  pen.markdown(r'''
## flutter Note
  ''');
}
