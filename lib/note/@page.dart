import 'package:flutter/widgets.dart';
import 'package:learn_flutter/page.dart';

import '../defalut_layout.dart';

Meta notePage = Meta(
  title: "note",
  builder: build,
  layout: <T>(N<T> note) => DefaultLayout<T>(note),
);

build(Pen pen, BuildContext context) {
  pen.markdown(r'''
## flutter Note
  ''');
}
