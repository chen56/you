// ignore_for_file: file_names

import 'package:flutter/widgets.dart';
import 'package:note/page_core.dart';
import 'package:note/page_layout.dart';
import 'package:note/mate.dart';
import 'package:note_app/note_app.dart';
import 'package:note_mate_flutter/mate_enums.g.dart' as flutter_enums;
import 'package:note_mate_flutter/mate_icons.g.dart' as flutter_icons;

PageMeta page = PageMeta(
  shortTitle: "home",
  builder: build,
  layout: <T>(Path<T> note) => PageScreen<T>(
    current: note,
    tree: paths.note,
    editors: Editors(
      enumRegister: EnumRegister.list([flutter_enums.registerEnum()]),
      iconRegisters: IconRegisters([flutter_icons.registerIcon()]),
    ),
  ),
);

build(BuildContext context, Pen pen) {
  pen.markdown(r'''
# home 

本页面应该是不暴露的 ,但现在并未做任何限制，通过 / 可以看到

  ''');
}
