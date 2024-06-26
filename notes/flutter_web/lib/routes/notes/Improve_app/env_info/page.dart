import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:you_flutter/note.dart';

void build(BuildContext context, Cell print) {
  print(const MD('''
# Platform和设备信息

## 平台参数
  '''));

  print = print.addCell(title: const Text("new cell-----------------"));
  ThemeData theme = Theme.of(context);
  MediaQueryData mediaQuery = MediaQuery.of(context);
  print(MD('''
| name                            | value                                    | comment                                                          |
|---------------------------------|------------------------------------------|--------------------------------------|
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
| Isolate.packageConfig           | 不支持flutter,仅dart sdk                  |                                      |
'''));

  if (!kIsWeb) {
    print = print.addCell(title: const Text("new cell-----------------"));
    Map<String, String> env = Platform.environment;
    print(Table(
      border: TableBorder.all(),
      children: env.entries.map((e) => TableRow(children: [Text(e.key), Text(e.value)])).toList(),
    ));
  }
}
