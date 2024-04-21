import 'package:flutter/material.dart';
import 'package:you_note_dart/note.dart';
import 'package:flutter/services.dart' show rootBundle;

void build(BuildContext context, Pen print) async {
  print.$____________________________________________________________________();
  print.markdown(r'''
# asset

  ''');
  var jsonAsset = await rootBundle.loadString('lib/notes/note.dart');
  print(jsonAsset);
}
