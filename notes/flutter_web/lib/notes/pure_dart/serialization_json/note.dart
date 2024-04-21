// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:you_note_dart/note.dart';

void build(BuildContext context, Cell print) {
  print.markdown(r'''
# json

json 序列化。

  ''');

  print.$____________________________________________________________________();
  var userJson = '''
  {
    "name": "chen56",
    "email": "chen56@chen56.com"
  }
  ''';
  Map<String, dynamic> user = jsonDecode(userJson);

  print('user: ${user['name']}!');
  print('email: ${user['email']}.');
}
