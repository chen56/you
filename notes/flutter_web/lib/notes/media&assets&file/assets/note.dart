import 'package:flutter/material.dart';
import 'package:you_note_dart/note.dart';
import 'package:flutter/services.dart' show rootBundle;

void build(BuildContext context, Note print) async {
  print.next(title:const Text("--------new cell------"));
  print(const MD(r'''
# asset

  '''));
  var jsonAsset = await rootBundle.loadString('lib/notes/note.dart');
  print(jsonAsset);
}
