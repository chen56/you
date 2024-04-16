import 'package:flutter/material.dart';
import 'package:note/note.dart';

import 'package:flutter_core/notes/x.note_inside/note_test_self/temp/pen_extension.dart';

build(BuildContext context, Pen print) {
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

    print(Layer(title: const Text("布局"), style: const ContentLayout(maxColumn: 3), () {
      print(Layer(title: const Text("box布局"), style: const ContentLayout(maxColumn: 3), () {
        print(Layer(title: const Text("box布局 box布局.Column vs ListView"), style: const ContentLayout(maxColumn: 3), () {
          print(const Text(""));
        }));
      }));
      print(Layer(title: const Text("slaver布局"), style: const ContentLayout(maxColumn: 3), () {
        print(const Text(""));
      }));
    }));

    var body = Layer(null, title: const Text("布局1"), style: const ContentLayout(maxColumn: 3), children: [
      Layer(null, title: const Text("box布局2"), style: const ContentLayout(maxColumn: 3), children: [
        Layer(title: const Text("box布局 box布局.Column vs ListView"), style: const ContentLayout(maxColumn: 3), () {
          print(const Text(""));
        })
      ]),
      Layer(title: const Text("slaver布局"), style: const ContentLayout(maxColumn: 3), () {
        print(const Text(""));
      }),
    ]);

    print(body);
    RichText(
      text: const TextSpan(text: 'Hello'),
    );
    group(const Text2("ss"), () {
      group(const Text("ss2"), () {});
    });
  }
}

group(Object x, Function y) {}
class Text2 extends Text{
  const Text2(super.data, {super.key});

}