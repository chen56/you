import 'dart:io';

import 'package:analyzer/dart/analysis/features.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:note/page_core.dart';
import 'package:analyzer/dart/analysis/utilities.dart' as analyzer_util;
import 'package:path/path.dart' as path;

PageMeta page = PageMeta(
  shortTitle: "temp page",
  builder: build,
);

build(BuildContext context, Pen print) {
  print.markdown('''
# analyzer 

## 分析器可以在web模式运转

  ''');
  print.$____________________________________________________________________();

  var x = analyzer_util.parseString(
      content: print.path.source.code,
      featureSet: FeatureSet.latestLanguageVersion());
  print(x.unit.directives);

  print.$____________________________________________________________________();
  print.markdown('''

## 性能不错

  ''');

  DateTime start = DateTime.now();
  int times = 1000;
  for (int i = 0; i < times; i++) {
    analyzer_util.parseString(
        content: print.path.source.code,
        featureSet: FeatureSet.latestLanguageVersion());
  }
  print(
      "分析本页面源文件:$times 次, 花费时间: ${DateTime.now().difference(start).inMilliseconds} milliseconds");

  print.$____________________________________________________________________();
  print.markdown('''

## path

path很有意思

- web版会变为url
- macos版正常普通目录名

  ''');
  print(path.absolute("a.dart"));

  print.$____________________________________________________________________();
  print.markdown('''
## environment

  ''');
  if (kIsWeb) {
    print("web版无法使用环境变量,会报错：Unsupported operation: Platform._environment");
  } else {
    Map<String, String> env = Platform.environment;
    env.forEach((k, v) => print("Key=$k Value=$v"));
  }
}
