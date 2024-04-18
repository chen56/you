// ignore_for_file: file_names

import 'dart:io';

import 'package:file/local.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:you_note_dart/note.dart';

build(BuildContext context, Pen print) {
  if (kIsWeb) {
    print("本页面只适合桌面版本， web版无法使用File功能,会报错");
    return;
  }

  print.markdown(r'''
# file
  ''');

  LocalFileSystem fs = const LocalFileSystem();
  // print(fs.isWatchSupported);
  print(fs.directory("").absolute);

  print("Directory.current:${Directory.current}");
  // Directory.current
}

