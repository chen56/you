// ignore_for_file: file_names

import 'package:flutter/widgets.dart';
import 'package:note/page_core.dart';
import 'package:note/page_layout.dart';
import 'package:note_app/pages.dart';

PageMeta page = PageMeta(
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
