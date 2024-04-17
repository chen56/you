import 'package:flutter/material.dart';
import 'package:note_dart/note.dart';

build(BuildContext context, Pen cell) {

  Layer(cell,title: const Text("slaver布局"), style: const ContentLayout(maxColumn: 3), (cell) {


    Layer(cell,title: const Text("box布局 box布局.Column vs ListView"), style: const ContentLayout(maxColumn: 3), (cell) {
      cell(const Text(""));
    });


    Layer(print,title: const Text("box布局 box布局.Column vs ListView"), style: const ContentLayout(maxColumn: 3), (cell) {
      cell(const Text(""));
    });


  });



}

void noUse(Pen print) {
  var i = 1;
  print.runInCurrentCell((print) {
    print(i);
  });

  print.level(
      title: const Text("1"),
      style: const ContentLayout(
        maxColumn: 3,
      ), () {
    print(const Text("2"));
  });

  {
    // ignore: unused_element
    void x({Text title = const Text("ss")}) {
      // 特殊语句
      print.runInCurrentCell((print) {
        print(i);
      });
    }

    ();

    group(const Text("ss"), () {
      // 特殊语句
      print.runInCurrentCell((print) {
        print(i);
      });
    });
    print.level(
        title: const Text("布局"),
        style: const ContentLayout(
          maxColumn: 3,
        ),
        null)(() {
      print.level(title: const Text("box布局"), style: const ContentLayout(maxColumn: 3), null)(() {
        print.level(title: const Text("box布局.Column vs ListView"), style: const ContentLayout(maxColumn: 3), null)(() {
          print(const Text(""));
        });
      });
      print.level(null, title: const Text("slaver布局"), style: const ContentLayout(maxColumn: 3))(() {
        print(const Text(""));
      });
    });
  }
}

void group(Text text, Null Function() param1) {}

extension X on Pen {
  XX level(Function()? block, {Text title = const Text(""), ContentLayout style = const ContentLayout()}) {
    return XX(block, title: title, style: style);
  }
}

class Layer extends StatelessWidget {
  Layer(dynamic cell,dynamic block, {super.key, Pen? print, Text title = const Text(""), Widget? textBox, ContentLayout style = const ContentLayout(), List<Widget> children = const <Widget>[]}) {
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
