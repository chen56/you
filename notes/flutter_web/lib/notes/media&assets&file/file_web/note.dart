// ignore_for_file: file_names

import 'package:flutter/widgets.dart';
import 'package:you_note_dart/note.dart';
// import 'package:web/web.dart' as web;

void build(BuildContext context, Print print) {
  print(const MD(r'''
# file access on web
  '''));

  print("Uri.base(window.location.href): ${Uri.base}");
  // print("web.window.location.href: ${web.window.location.href};");
}
