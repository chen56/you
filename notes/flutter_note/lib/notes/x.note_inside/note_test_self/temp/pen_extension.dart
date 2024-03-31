import 'package:flutter/widgets.dart';
import 'package:note/note.dart';

extension X on Pen {
  XX level(Function()? block, {Text title = const Text(""), BlockStyle style = const BlockStyle()}) {
    return XX(block, title: title, style: style);
  }
}

class Layer extends StatelessWidget {
  Layer(Function()? block, {Pen? print, Text title = const Text(""), Widget? textBox, BlockStyle style = const BlockStyle(), List<Widget> children = const <Widget>[]}) {
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
  BlockStyle style;

  XX(this.block, {required this.title, required this.style});

  call(Function() block) {}
}

class BlockStyle {
  final int maxColumn;

  const BlockStyle({this.maxColumn = 1});
}
