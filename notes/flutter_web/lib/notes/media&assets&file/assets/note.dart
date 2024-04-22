import 'package:flutter/material.dart';
import 'package:you_note_dart/note.dart';
import 'package:flutter/services.dart' show rootBundle;

void build(BuildContext context, Cell print) async {
  print.next(title:Text("--------new cell------"));
  print.markdown(r'''
# asset

  ''');
  var jsonAsset = await rootBundle.loadString('lib/notes/note.dart');
  print(jsonAsset);
}
