import 'package:flutter/widgets.dart';
import 'package:learn_flutter/page.dart';


PageMeta notePage = PageMeta(
  title: "note",
  builder: build,
);

build(Pen pen, BuildContext context) {
  pen.markdown(r'''
## flutter Note
  ''');
}
