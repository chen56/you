// ignore_for_file: file_names

import 'dart:ui';

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

  print.nextCell___________________________();
  ThemeData theme = Theme.of(context);
  MediaQueryData mediaQuery = MediaQuery.of(context);
  print.markdown('''
| name                    | value                      | comment                                           |
|-------------------------|----------------------------|---------------------------------------------------|
| theme.platform.name     | ${theme.platform.name}     |                                                   |
| theme.visualDensity     | ${theme.visualDensity.toStringShort()}     |      视觉密度                      |
| mediaQuery.orientation  | ${mediaQuery.orientation}  | Orientation.landscape | Orientation.portrait      |
| mediaQuery.size         | ${mediaQuery.size}         | logical pixel                                     |
| window.physicalSize     | ${window.physicalSize}     | physical pixel                                    |
| window.devicePixelRatio | ${window.devicePixelRatio} | physical pixel= logical pixel *  devicePixelRatio |
  ''');
}
