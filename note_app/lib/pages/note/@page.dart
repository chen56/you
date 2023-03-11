import 'package:flutter/widgets.dart';
import 'package:flutter_note/page.dart';
import 'package:flutter_note/pages/pages.g.dart';

PageMeta page = PageMeta(
  shortTitle: "note",
  builder: build,
);

build(Pen pen, BuildContext context) {
  pen.markdown(r'''
## flutter Note
  ''');
}
