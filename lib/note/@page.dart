import 'package:flutter/widgets.dart';
import 'package:learn_flutter/page.dart';


Meta notePage = Meta(
  title: "note",
  builder: build,
);

build(Pen pen, BuildContext context) {
  pen.markdown(r'''
## flutter Note
  ''');
}
