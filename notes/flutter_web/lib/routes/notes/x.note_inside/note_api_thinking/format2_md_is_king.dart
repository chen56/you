// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:you_flutter/note.dart';

/// 仔细想，md来做中控，那代码的嵌套block 算啥呢？2种层级树貌似难以理解
void build(BuildContext context, Function(Object? content) print) {
  print(MD(debugLabel: Text("debug label"), "ssss"));
  print(MD(debugLabel: Text("debug label2"), '''
## 2级标题
### xxx markdwon
dfasdf
### xxx markdwon
asf
### xxx markdwon
### xxx markdwon
      ''').layout(maxColumn: 2));
  print(MD('''
## 2级标题
### xxx markdwon
dfasdf
### xxx markdwon
asf
### xxx markdwon
### xxx markdwon
      ''', debugLabel: (print) {
    print(CodeTemplate(const Text("### xxx markdwon"), () {
      return const Text("里面的xxx");
    }));
  }));

  print(CodeTemplate(const Text("### xxx markdwon"), () {
    return const Text("里面的xxx");
  }));
  CodeTemplateNoReturn(Text("ss"), ({required TestCell cell}) {});
  var cell = print(Text("sss"));
  void x() {
    cell.clear();
    cell("");
  }

  x();
}


class TestCell extends StatelessWidget {
  TestCell(Text title, Function()? block, {super.key, TestCell? print, Text title2 = const Text(""), Widget? textBox, ContentLayout style = const ContentLayout(), List<Widget> children = const <Widget>[]}) {
    if (print != null) print(this);
  }

  call(dynamic){

  }
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

class CodeTemplate extends StatelessWidget {
  CodeTemplate(Text title, Widget Function()? block, {super.key, TestCell? print, Text title2 = const Text(""), Widget? textBox, ContentLayout style = const ContentLayout(), List<Widget> children = const <Widget>[]}) {
    if (print != null) print(this);
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

class CodeTemplateNoReturn extends StatelessWidget {
  CodeTemplateNoReturn(Text title, void Function({required TestCell cell})? block, {super.key, TestCell? print, Text title2 = const Text(""), Widget? textBox, ContentLayout style = const ContentLayout(), List<Widget> children = const <Widget>[]}) {
    if (print != null) print(this);
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

extension MarkdownExt on MD {
  MD layout({int maxColumn = 1}) {
    return this;
  }
}

extension WidgetExt on Widget {
  void pin(Function(Object? s) print) {}
}

class ContentLayout {
  final int maxColumn;

  const ContentLayout({this.maxColumn = 1});
}
