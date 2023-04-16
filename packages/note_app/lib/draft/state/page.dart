import 'package:flutter/widgets.dart';
import 'package:note/page_core.dart';

PageMeta page = PageMeta(
  shortTitle: "note",
  builder: build,
);

build(BuildContext context, Pen print) {
  print.markdown(r'''
## flutter Note
  ''');
}
