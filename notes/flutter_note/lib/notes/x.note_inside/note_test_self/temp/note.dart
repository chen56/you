import 'package:flutter/material.dart';
import 'package:note/note.dart';

import 'pen_extension.dart';

build(BuildContext context, Pen print) {
  var i = 1;
  print.runInCurrentCell((print) {
    print(i);
  });

  print.level(
      title: Text(""),
      style: const BlockStyle(
        maxColumn: 3,
      ), () {
    print(const Text(""));
  });

  {
    void x() {
      // 特殊语句
      print.runInCurrentCell((print) {
        print(i);
      });
    }

    x();
  }
  print.level(
      title: Text("布局"),
      style: const BlockStyle(
        maxColumn: 3,
      ),
      null)(() {
    print.level(title: Text("box布局"), style: const BlockStyle(maxColumn: 3), null)(() {
      print.level(title: Text("box布局.Column vs ListView"), style: const BlockStyle(maxColumn: 3), null)(() {
        print(const Text(""));
      });
    });
    print.level(null, title: Text("slaver布局"), style: const BlockStyle(maxColumn: 3))(() {
      print(const Text(""));
    });
  });

  print(Layer(title: const Text("布局"), style: const BlockStyle(maxColumn: 3), () {
    print(Layer(title: const Text("box布局"), style: const BlockStyle(maxColumn: 3), () {
      print(Layer(title: const Text("box布局 box布局.Column vs ListView"), style: const BlockStyle(maxColumn: 3), () {
        print(const Text(""));
      }));
    }));
    print(Layer(title: Text("slaver布局"), style: const BlockStyle(maxColumn: 3), () {
      print(const Text(""));
    }));
  }));

  var body = Layer(null, title: const Text("布局"), style: const BlockStyle(maxColumn: 3), children: [
    Layer(null, title: const Text("box布局"), style: const BlockStyle(maxColumn: 3), children: [
      Layer(title: const Text("box布局 box布局.Column vs ListView"), style: const BlockStyle(maxColumn: 3), () {
        print(const Text(""));
      })
    ]),
    Layer(title: Text("slaver布局"), style: const BlockStyle(maxColumn: 3), () {
      print(const Text(""));
    }),
  ]);

  print(body);
}

