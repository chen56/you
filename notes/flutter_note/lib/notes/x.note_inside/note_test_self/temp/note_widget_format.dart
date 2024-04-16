import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:note/note.dart';

import 'package:flutter_note/notes/x.note_inside/note_test_self/temp/pen_extension.dart';

build(BuildContext context, Pen print) {
  LayerWithNamedText(null, title: const Text("布局1"), style: const ContentLayout(maxColumn: 3), children: [
    LayerWithNamedText(null, title: const Text("box布局2"), style: const ContentLayout(maxColumn: 3), children: [
      LayerWithNamedText(title: const Text("box布局 box布局.Column vs ListView"), style: const ContentLayout(maxColumn: 3), () {
        print(const Text(""));
      })
    ]),
    LayerWithNamedText(title: const Text("slaver布局"), style: const ContentLayout(maxColumn: 3), () {
      print(const Text(""));
    }),
  ]);

  print.markdown("# xxxx");
  print.markdown("## xxxx");
  print.markdown("## xxxx");
  print(test: "", const Markdown(data: "ssss"));
  Group(const Text("## xxx markdwon"), () {
    Cell(const Text("### xxx markdwon"), () {
      print(const Text("里面的xxx"));
    });
    Cell(const Text("### xxx markdwon"), () {
      print(const Text("里面的xxx"));
    });
  });

  print2(const Markdown(data: '''
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
  print(CodeTemplateNoReturn(const Text("### xxx markdwon"), ({required Pen print}) {
    var i = 1;
    i++;
    print(i);
  }));
}

cell2(Text title, Widget Function()? block, {Pen? print, Text title2 = const Text(""), Widget? textBox, ContentLayout style = const ContentLayout(), List<Widget> children = const <Widget>[]}) {}

PrintResult print2(Object? obj) {
  return PrintResult();
}

class PrintResult {
  void style(ContentLayout blockStyle) {}
}

class LayerWithNamedText extends StatelessWidget {
  LayerWithNamedText(Function()? block, {super.key, Pen? print, Text title = const Text(""), Widget? textBox, ContentLayout style = const ContentLayout(), List<Widget> children = const <Widget>[]}) {
    if (print != null) print(this);
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
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
  CodeTemplateNoReturn(Text title, void Function({required Pen print})? block, {super.key, Pen? print, Text title2 = const Text(""), Widget? textBox, ContentLayout style = const ContentLayout(), List<Widget> children = const <Widget>[]}) {
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
