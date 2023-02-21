import 'package:flutter/widgets.dart';
import 'package:learn_flutter/page.dart';


PageMeta notePage = PageMeta(
  shortTitle: "note",
  builder: build,
);

build(Pen pen, BuildContext context) {
  pen.markdown(r'''
## flutter Note
  ''');
}
