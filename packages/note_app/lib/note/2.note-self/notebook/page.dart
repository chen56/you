// ignore_for_file: avoid_print

import 'package:flutter/widgets.dart';
import 'package:note/page_core.dart';
import 'package:note_mate_flutter/material.dart';

PageMeta page = PageMeta(
  shortTitle: " Notebook-实验",
  builder: build,
);

build(BuildContext context, Pen pen) {
  var a = 1;

  pen.block_______________(() {
    print("$a");
    print("$a");
  });

  pen.block_______________(() {
    print("$a");
    print("$a");
  });

  var b = 1;

  pen.block_______________(() {
    print("$b");
    print("$b");
  });

  var c = 1;
  print("$c");
  var d = 1;

  pen.block_______________();
  print("$d");

  pen.block_______________(() => print("$a"));

  // @Deprecated('Use turnOn instead')
  pen.block_______________();
  a++;
  print("object");

  pen.block_______________(() {
    print("$a");
    print("$a");
  });

  pen.block_______________();
  print("object");

  pen.block_______________();
  pen.markdown(r'''
# Notebook 机制-实验状态
''');

  pen.block_______________();
  pen.widget((param) => const Text("ss"));

  pen.block_______________();
  pen.widget((param) {
    print("object");
    return const Text("notebook");
  });

  pen.block_______________();
  // 注释语句注释语句
  // ignore: unused_element
  void x() {
    print("1");
    print("2");
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
      i++;
    }

    pen.sampleMate(ElevatedButton$Mate(onPressed: onPressed2, child: Text("text:$i")));
  }

  pen.block_______________();
  print("1");
  print("2");
}
