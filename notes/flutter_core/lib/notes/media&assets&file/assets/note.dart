import 'package:flutter/material.dart';
import 'package:note_lang_dart/note.dart';
import 'package:flutter/services.dart' show rootBundle;

build(BuildContext context, Pen print) async {
  print.$____________________________________________________________________();
  print.markdown(r'''
# asset

  ''');
  var jsonAsset = await rootBundle.loadString('lib/notes/note.dart');
  print(jsonAsset);
}
