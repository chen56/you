import 'package:analyzer/dart/analysis/features.dart';
import 'package:flutter/material.dart';
import 'package:you_note_dart/note.dart';
import 'package:analyzer/dart/analysis/utilities.dart' as analyzer_util;

void build(BuildContext context, Print print) {
  print(const MD('''
# analyzer

## 分析器可以在web模式运转

分析本页dart文件，并打印出import and export directives
  '''));
  print=print.nextCell(title:const Text("new cell-----------------"));

  var x = analyzer_util.parseString(
      content: """int i=1;""",
      featureSet: FeatureSet.latestLanguageVersion());
  for (var e in x.unit.directives) {
    print(e);
  }

  print=print.nextCell(title:const Text("new cell-----------------"));
  print(const MD('''

## 性能不错

看下面性能测试，可以实时在UI上处理单文件语法树，不需要预处理了：
  '''));

  print=print.nextCell(title:const Text("new cell-----------------"));
  DateTime start = DateTime.now();
  int times = 1000;
  for (int i = 0; i < times; i++) {
    analyzer_util.parseString(
        content: """int i=1;""",
        featureSet: FeatureSet.latestLanguageVersion());
  }
  print(
      "分析本页面源文件:$times 次, 花费时间: ${DateTime.now().difference(start).inMilliseconds} milliseconds");
}
