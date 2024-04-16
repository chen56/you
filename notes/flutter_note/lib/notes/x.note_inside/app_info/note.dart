// ignore_for_file: file_names

import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:note/note.dart';
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
| name                            | value                                  | comment                                           |
|---------------------------------|----------------------------------------|---------------------------------------------------|
| kIsWeb                          | $kIsWeb                              | bool.fromEnvironment('dart.library.js_util')      |
| kReleaseMode                    | $kReleaseMode                        | bool.fromEnvironment('dart.vm.product')           |
| kProfileMode                    | $kProfileMode                        | bool.fromEnvironment('dart.vm.profile')           |
| kDebugMode                      | $kDebugMode                          | !kReleaseMode && !kProfileMode                    |
| theme.platform.name             | ${theme.platform.name}                 |                                                   |
| theme.visualDensity             | ${theme.visualDensity.toStringShort()} | 视觉密度                                              |
| mediaQuery.orientation          | ${mediaQuery.orientation}              | landscape/portrait                                |
| mediaQuery.size                 | ${mediaQuery.size}                     | logical pixel                                     |
| window.physicalSize             | ${window.physicalSize}                 | physical pixel                                    |
| window.devicePixelRatio         | ${window.devicePixelRatio}             | physical pixel= logical pixel *  devicePixelRatio |
| Platform.operatingSystem        | ${kIsWeb ? "flutter 3.10.0 macos报错" : Platform.operatingSystem}              |                                                   |
| Platform.resolvedExecutable     | ${kIsWeb ? "flutter 3.10.0 macos报错" : Platform.resolvedExecutable}                 |                                                   |

''');
  // | Platform.executable             | ${Platform.executable}                 |                                                   |
  // | Platform.isMacOS                | ${Platform.isMacOS}                    |                                                   |
  // | Platform.isAndroid              | ${Platform.isAndroid}                  |                                                   |
  // | Platform.isFuchsia              | ${Platform.isFuchsia}                  |                                                   |
  // | Platform.isIOS                  | ${Platform.isIOS}                      |                                                   |
  // | Platform.isLinux                | ${Platform.isLinux}                    |                                                   |
  // | Platform.isWindows              | ${Platform.isWindows}                  |                                                   |
  // | Platform.operatingSystemVersion | ${Platform.operatingSystemVersion}     |                                                   |
  // | Platform.localeName             | ${Platform.localeName}                 |                                                   |
  // | Platform.script                 | ${Platform.script}                     |                                                   |
  // | Platform.version                | ${Platform.version}                    |                                                   |
  // | Platform.numberOfProcessors     | ${Platform.numberOfProcessors}         |                                                   |

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
              children: [SelectableText(e.key), SelectableText(e.value)]))
          .toList(),
    ));
  }
}
