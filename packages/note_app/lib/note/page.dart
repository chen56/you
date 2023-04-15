// ignore_for_file: file_names

import 'package:flutter/widgets.dart';
import 'package:note/page_core.dart';

PageMeta page = PageMeta(
  shortTitle: "note",
  builder: build,
);

build(BuildContext context, Pen pen) {
  pen.markdown(r'''
# note 

本页面应该是不暴露的 ,但现在并未做任何限制，通过 /note 可以看到

  ''');
}
