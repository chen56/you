// ignore_for_file: file_names

import 'package:flutter/widgets.dart';
import 'package:note/note.dart';

NoteConfPart page = NoteConfPart(
  shortTitle: "草稿目录",
  builder: build,
);

build(BuildContext context, Pen print) {
  print.markdown(r'''
# 草稿 

本目录放置草稿，乱七八糟。

  ''');
}
