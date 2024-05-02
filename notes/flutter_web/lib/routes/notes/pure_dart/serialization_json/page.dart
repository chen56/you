// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:you_flutter/note.dart';

void build(BuildContext context, Cell print) {
  print(const MD(r'''
# json

json 序列化。

  '''));

  print=print.addCell(title:const Text("new cell-----------------"));
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
