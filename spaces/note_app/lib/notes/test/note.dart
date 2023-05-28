// ignore_for_file: file_names

import 'package:flutter/widgets.dart';
import 'package:note/note_page.dart';
import 'package:note_app/note_app.dart';

NoteConfPart page = NoteConfPart(
  shortTitle: "自测目录",
  builder: build,
  layout: Layouts.defaultLayout(defaultCodeExpand: true),
);

build(BuildContext context, Pen print) {
  print.markdown(r'''
# test自测目录

本目录放置自测页面，以验证基础功能。

  ''');
}
