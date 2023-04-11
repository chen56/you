// ignore_for_file: avoid_pen.print

import 'package:flutter/widgets.dart';
import 'package:note/page_core.dart';
import 'package:note_mate_flutter/material.dart';

PageMeta page = PageMeta(
  shortTitle: " Notebook-实验",
  builder: build,
);

build(BuildContext context, Pen pen) {
  var a = 1;
  pen.print("start $a");

  pen.block_______________(() {
    pen.print("a $a");
    pen.print("b $a");
  });

  pen.block_______________(() {
    pen.print("c $a");
    pen.print("d $a");
  });

  var b = 1;

  pen.block_______________(() {
    pen.print("$b");
    pen.print("$b");
  });

  var c = 1;
  pen.print("$c");
  var d = 1;

  pen.block_______________();
  pen.print("$d");

  pen.block_______________(() => pen.print("$a"));

  // @Deprecated('Use turnOn instead')
  pen.block_______________();
  a++;
  pen.print("object");

  pen.block_______________(() {
    pen.print("$a");
    pen.print("$a");
  });

  pen.block_______________();
  pen.print("object");

  pen.block_______________();
  pen.markdown(r'''
# Notebook 机制-实验状态
''');

  pen.block_______________();
  pen.widget((param) => const Text("ss"));

  pen.block_______________();
  pen.widget((param) {
    pen.print("object");
    return const Text("notebook");
  });

  pen.block_______________();
  // 注释语句注释语句
  // ignore: unused_element
  void x() {
    pen.print("1");
    pen.print("2");
  }

  pen.block_______________();
  {
    int i = 1;

    {
      onPressed2() {
        i++;
      }

      for (var i = 0; i < 10; i++) {
        pen.sampleMate(ElevatedButton$Mate(onPressed: onPressed2, child: Text("text:$i")));
      }
    }

    onPressed2() {
      pen.print("sssssss");
      i++;
      (context as Element).markNeedsBuild();
    }

    pen.sampleMate(ElevatedButton$Mate(onPressed: onPressed2, child: Text("tsssext:$i")));
  }

  pen.block_______________();
  pen.print("1");
  pen.print("2");
}
