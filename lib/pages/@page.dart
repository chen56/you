import 'package:flutter/widgets.dart';
import 'package:learn_flutter/page.dart';

import 'root_tree.dart';

Meta rootPage = Meta(
  title: "home",
  builder: build,
  layout: <T>(N<T> note) => DefaultLayout<T>(current: note, tree: paths.note),
);

build(Pen pen, BuildContext context) {
  pen.markdown(r'''
## 欢迎来到flutter世界 
  ''');
}
