import 'package:analyzer/dart/analysis/features.dart';
import 'package:flutter/material.dart';
import 'package:note/note.dart';
import 'package:analyzer/dart/analysis/utilities.dart' as analyzer_util;

NoteConfPart page = NoteConfPart(
  shortTitle: "test-analyzer",
  builder: build,
);

build(BuildContext context, Pen print) {
  print.markdown('''
# analyzer 

## 分析器可以在web模式运转

分析本页dart文件，并打印出import and export directives
  ''');
  print.$____________________________________________________________________();

  var x = analyzer_util.parseString(
      content: print.path.source.code,
      featureSet: FeatureSet.latestLanguageVersion());
  for (var e in x.unit.directives) {
    print(e);
  }

  print.$____________________________________________________________________();
  print.markdown('''

## 性能不错

看下面性能测试，可以实时在UI上处理单文件语法树，不需要预处理了：
  ''');

  print.$____________________________________________________________________();
  DateTime start = DateTime.now();
  int times = 1000;
  for (int i = 0; i < times; i++) {
    analyzer_util.parseString(
        content: print.path.source.code,
        featureSet: FeatureSet.latestLanguageVersion());
  }
  print(
      "分析本页面源文件:$times 次, 花费时间: ${DateTime.now().difference(start).inMilliseconds} milliseconds");
}
