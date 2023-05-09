// ignore_for_file: file_names

import 'dart:io';
import 'dart:ui';

import 'package:file/local.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:note/note_core.dart';
import 'package:note_app/note_app.dart';
import 'package:path/path.dart' as path;

NoteConfPart page = NoteConfPart(
  shortTitle: "Platform和设备",
  builder: build,
  layout: Layouts.defaultLayout(defaultCodeExpand: true),
);

build(BuildContext context, Pen print) {
  print.markdown('''
# Platform和设备信息 

## 平台参数 
  ''');

  print.$____________________________________________________________________();
  ThemeData theme = Theme.of(context);
  MediaQueryData mediaQuery = MediaQuery.of(context);
  print.markdown('''
| name                    | value                                  | comment                                           |
|-------------------------|----------------------------------------|---------------------------------------------------|
| kIsWeb                  | ${kIsWeb}                              | bool.fromEnvironment('dart.library.js_util')      |
| kReleaseMode            | ${kReleaseMode}                        | bool.fromEnvironment('dart.vm.product')           |
| kProfileMode            | ${kProfileMode}                        | bool.fromEnvironment('dart.vm.profile')           |
| kDebugMode              | ${kDebugMode}                          | !kReleaseMode && !kProfileMode                    |
| theme.platform.name     | ${theme.platform.name}                 |                                                   |
| theme.visualDensity     | ${theme.visualDensity.toStringShort()} | 视觉密度                                              |
| mediaQuery.orientation  | ${mediaQuery.orientation}              | landscape/portrait                                |
| mediaQuery.size         | ${mediaQuery.size}                     | logical pixel                                     |
| window.physicalSize     | ${window.physicalSize}                 | physical pixel                                    |
| window.devicePixelRatio | ${window.devicePixelRatio}             | physical pixel= logical pixel *  devicePixelRatio |
  ''');

  print.$____________________________________________________________________();
  print.markdown('''
## path

path很有意思

- web版会变为url
- macos版正常普通目录名

  ''');
  print.$____________________________________________________________________();
  print(Platform.script.toFilePath());
  print.$____________________________________________________________________();
  print(path.absolute("./"));

  print.$____________________________________________________________________();
  print(path.absolute("a.dart"));
  print.$____________________________________________________________________();
  print(LocalFileSystem().currentDirectory);

  print.$____________________________________________________________________();
  print.markdown('''
## environment(web不可用)

  ''');

  print.$____________________________________________________________________();
  if (kIsWeb) {
    print("web版无法使用环境变量,会报错：Unsupported operation: Platform._environment");
  } else {
    Map<String, String> env = Platform.environment;
    env.forEach((k, v) => print("Key=$k Value=$v"));
  }
}
