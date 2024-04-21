import 'package:flutter/material.dart';
import 'package:you_note_dart/note.dart';

/// 单print api，print作为单一全局函数，倒是api简单
/// 全靠print或CellBlock内部静态收集器来工作，
/// - 同步时：静态变量做cell区隔收集
/// - 异步时：就必须要靠Trace来跟踪哪个Cell了，要不没线索
void build(BuildContext context, CellPrint print) {
  print(CellBlock(title: const Text("布局"), style: const ContentLayout(maxColumn: 3), () {
    print(CellBlock(title: const Text("box布局"), style: const ContentLayout(maxColumn: 3), () {}));
    print(CellBlock(title: const Text("slaver布局"), style: const ContentLayout(maxColumn: 3), () {
      print(const Text(""));
    }));
    print(CellBlock(title: const Text("box布局 box布局.Column vs ListView"), style: const ContentLayout(maxColumn: 3), () {
      print(const Text(""));
    }));
  }));

  CellBlock(title: const Text("slaver布局"), style: const ContentLayout(maxColumn: 3), () {
    CellBlock(title: const Text("box布局 box布局.Column vs ListView"), style: const ContentLayout(maxColumn: 3), () {
      print(const Text(""));
    });
    CellBlock(title: const Text("box布局 box布局.Column vs ListView"), style: const ContentLayout(maxColumn: 3), () {
      print(const Text(""));
    });
  });
}

void noUse(CellPrint print) {
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

extension X on CellPrint {
  XX level(Function()? block, {Text title = const Text(""), ContentLayout style = const ContentLayout()}) {
    return XX(block, title: title, style: style);
  }
}

class CellBlock extends StatelessWidget {
  CellBlock(dynamic block, {super.key, CellPrint? print, Text title = const Text(""), Widget? textBox, ContentLayout style = const ContentLayout(), List<Widget> children = const <Widget>[]}) {
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
