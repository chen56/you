// ignore_for_file: file_names

import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:note/page_core.dart';

PageMeta page = PageMeta(
  shortTitle: "Platform和设备信息",
  builder: build,
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
}
