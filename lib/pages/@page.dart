import 'package:flutter/widgets.dart';
import 'package:flutter_note/page.dart';
import 'package:flutter_note/pages/page_layout.dart';

import 'root_tree.dart';

PageMeta rootPage = PageMeta(
  shortTitle: "home",
  builder: build,
  layout: <T>(Path<T> note) => PageScreen<T>(current: note, tree: paths.note),
);

build(Pen pen, BuildContext context) {
  pen.markdown(r'''
# home 

本页面应该是不暴露的 ,但现在并未做任何限制，通过 / 可以看到

  ''');
}
