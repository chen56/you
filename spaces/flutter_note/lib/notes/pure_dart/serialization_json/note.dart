// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:note/note.dart';

build(BuildContext context, Pen print) {
  print.markdown(r'''
# json

json 序列化。

  ''');

  print.$____________________________________________________________________();
  var userJson = '''
  {
    "name": "Chen Peng",
    "email": "chenpeng@younpc.com"
  }
  ''';
  Map<String, dynamic> user = jsonDecode(userJson);

  print('user: ${user['name']}!');
  print('email: ${user['email']}.');
}
