import 'package:flutter/widgets.dart';
import 'package:note/page.dart';

PageMeta page = PageMeta(
  shortTitle: "note",
  builder: build,
);

build(Pen pen, BuildContext context) {
  pen.markdown(r'''
## flutter Note
  ''');
}
