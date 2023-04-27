// ignore_for_file: file_names

import 'package:flutter/widgets.dart';
import 'package:note/page_core.dart';
import 'package:note_app/note_app.dart';

PageMeta page = PageMeta(
  shortTitle: "草稿目录",
  builder: build,
);

build(BuildContext context, Pen print) {
  print.markdown(r'''
# 草稿 

本目录放置草稿，乱七八糟。

  ''');
}
