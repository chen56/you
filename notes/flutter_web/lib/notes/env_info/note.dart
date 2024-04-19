import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:you_note_dart/note.dart';
import 'package:path/path.dart' as path;

build(BuildContext context, Pen print) {
  print.markdown('''
# Platform和设备信息

## 平台参数
  ''');

  print.$____________________________________________________________________();
  ThemeData theme = Theme.of(context);
  MediaQueryData mediaQuery = MediaQuery.of(context);
  print.markdown('''
| name                            | value                                    | comment                                                          |
|---------------------------------|------------------------------------------|------------------------------------------------------------------|
| kIsWeb                          | $kIsWeb                                  | bool.fromEnvironment('dart.library.js_util')                     |
| kReleaseMode                    | $kReleaseMode                            | bool.fromEnvironment('dart.vm.product')                          |
| kProfileMode                    | $kProfileMode                            | bool.fromEnvironment('dart.vm.profile')                          |
| kDebugMode                      | $kDebugMode                              | !kReleaseMode && !kProfileMode                                   |
| theme.platform.name             | ${theme.platform.name}                   |                                                                  |
| theme.visualDensity             | ${theme.visualDensity.toStringShort()}   | 视觉密度                                                          |
| mediaQuery.orientation          | ${mediaQuery.orientation}                | landscape/portrait                                               |
| mediaQuery.size                 | ${mediaQuery.size}                       | logical pixel                                                    |
| window.physicalSize             | ${window.physicalSize}                   | physical pixel                                                   |
| window.devicePixelRatio         | ${window.devicePixelRatio}               | physical pixel= logical pixel *  devicePixelRatio                |
| Uri.base                        | ${Uri.base}                              | web == `window.location.href`                                    |




''');
  print.$____________________________________________________________________();
  print.markdown('''
## path

path很有意思

- web版会变为url
- macos版正常普通目录名

  ''');
  print.$____________________________________________________________________();
  print(path.absolute("a/b.dart"));

  print.$____________________________________________________________________();
  print.markdown('''
## environment(web不可用)

  ''');

  print.$____________________________________________________________________();
  if (kIsWeb) {
    print("web版无法使用环境变量,会报错：Unsupported operation: Platform._environment");
  } else {
    Map<String, String> env = Platform.environment;
    print(Table(
      border: TableBorder.all(),
      children: env.entries
          .map((e) => TableRow(
              children: [Text(e.key), Text(e.value)]))
          .toList(),
    ));
  }
}
