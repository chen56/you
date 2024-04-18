import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:you_note_dart/note.dart';

build(BuildContext context, Function(Object? s) print) {
  print(const Markdown(data: "ssss"));
  print(const Markdown(data: '''
## 2级标题
### xxx markdwon
dfasdf
### xxx markdwon
asf
### xxx markdwon
### xxx markdwon
      ''').layout(
    maxColumn: 1,
  ));

  print(CodeTemplate(const Text("### xxx markdwon"), () {
    return const Text("里面的xxx");
  }));
  print(CodeTemplateNoReturn(const Text("### xxx markdwon"), ({required Pen cell}) {
    var i = 1;
    i++;
    cell(i);
  }));
  CodeTemplateNoReturn(Text("ss"), ({required Pen cell}){});
  var cell= print(Text("sss"));
  void x(){
    cell.clear();
    cell.print("");
  }
  x();
}

  class Group extends StatelessWidget {
  Group(Text title, Function()? block, {super.key, Pen? print, Text title2 = const Text(""), Widget? textBox, ContentLayout style = const ContentLayout(), List<Widget> children = const <Widget>[]}) {
    if (print != null) print(this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class Cell extends StatelessWidget {
  Cell(Text title, Function()? block, {super.key, Pen? print, Text title2 = const Text(""), Widget? textBox, ContentLayout style = const ContentLayout(), List<Widget> children = const <Widget>[]}) {
    if (print != null) print(this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class CodeTemplate extends StatelessWidget {
  CodeTemplate(Text title, Widget Function()? block, {super.key, Pen? print, Text title2 = const Text(""), Widget? textBox, ContentLayout style = const ContentLayout(), List<Widget> children = const <Widget>[]}) {
    if (print != null) print(this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class CodeTemplateNoReturn extends StatelessWidget {
  CodeTemplateNoReturn(Text title, void Function({required Pen cell})? block, {super.key, Pen? print, Text title2 = const Text(""), Widget? textBox, ContentLayout style = const ContentLayout(), List<Widget> children = const <Widget>[]}) {
    if (print != null) print(this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

extension MarkdownExt on Markdown {
  Markdown layout({int maxColumn = 1}) {
    return this;
  }
}
extension WidgetExt on Widget {
  void pin(Function(Object? s) print) {
  }
}

class ContentLayout {
  final int maxColumn;

  const ContentLayout({this.maxColumn = 1});
}
