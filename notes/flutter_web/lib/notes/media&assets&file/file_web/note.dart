// ignore_for_file: file_names


import 'package:flutter/widgets.dart' ;

import 'package:you_note_dart/note.dart';
// web依赖的js_interop 无法在macos平台使用
// package:flutter_web/main.dart => package:flutter_web/notes.g.dart => package:flutter_web/notes/media&assets&file/file_web/note.dart => package:web/web.dart => package:web/src/dom.dart => package:web/src/dom/angle_instanced_arrays.dart => package:web/src/dom/webgl1.dart => package:web/src/dom/dom.dart => package:web/src/dom/css_font_loading.dart => package:web/src/dom/html.dart => package:web/src/dom/clipboard_apis.dart => package:web/src/dom/fileapi.dart => package:web/src/dom/streams.dart => package:web/src/dom/webidl.dart => dart:js_interop
// import 'package:web/web.dart' as web;

build(BuildContext context, Pen print) {
  print.markdown(r'''
# file access on web
  ''');

  print("Uri.base(window.location.href): ${Uri.base}");
  // print("web.window.location.href: ${web.window.location.href};");
}

