import 'package:flutter/widgets.dart';
import 'package:note_lang_dart/note.dart';

extension X on Pen {
  XX level(Function()? block, {Text title = const Text(""), ContentLayout style = const ContentLayout()}) {
    return XX(block, title: title, style: style);
  }
}

class Layer extends StatelessWidget {
  Layer(Function()? block, {super.key, Pen? print, Text title = const Text(""), Widget? textBox, ContentLayout style = const ContentLayout(), List<Widget> children = const <Widget>[]}) {
    if (print != null) print(this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class XX {
  Function()? block;
  Text title;
  ContentLayout style;

  XX(this.block, {required this.title, required this.style});

  call(Function() block) {}
}

class ContentLayout {
  final int maxColumn;

  const ContentLayout({this.maxColumn = 1});
}
