import 'dart:isolate';

import 'package:flutter/material.dart';

import 'package:you_flutter/note.dart';

void build(BuildContext context, Cell print) async {
  print.addCell(title:const Text("--------new cell------"));
  print(const MD(r'''
# 异步

很好的异步视频：
[Dart asynchronous programming: Isolates and event loops](https://medium.com/dartlang/dart-asynchronous-programming-isolates-and-event-loops-bffc3e296a6a)
文档对应的视频：<https://www.youtube.com/watch?v=vl_AaCgudcY>

## Future

  '''));

  print.addCell(title:const Text("--------new cell------"));
  {
    Future<String> bomb() async {
      print("s");
      return Future.delayed(const Duration(seconds: 3), () => "bong!!!");
    }

    // print.runInCurrentCell((print) {
    //   debugPrint("ppp ${print}");
    //   debugPrint("ppp--- ${print.pen.cells}");
    //
    //   print(FilledButton(onPressed: () {}, child: const Text("按后3秒后爆炸")));
    // });

    //
    print.runInCurrentCell((print) {
      onPressed() async {
        var msg = await bomb();
        print(msg);
        // debugPrint("ppp2 ${print.hashCode}");
        // debugPrint("ppp2--- ${print.pen.cells}");
      }

      print(FilledButton(onPressed: onPressed, child: const Text("按后3秒后爆炸")));
    });
  }

  print.addCell(title:const Text("--------new cell------"));
  print(const MD(r'''
## Isalted

web 模式不支持 Isolated，如果运行在web模式下，此范例将报错

Error: Unsupported operation: dart:isolate is not supported on dart4web

2018年前dart1支持web版Isolated，但dart2后被去掉了，详细信息参考：
[[dart-announce] Dart2 Breaking Change: Removing web support for dart:mirrors and dart:isolate 2018年2月24日 ](https://groups.google.com/a/dartlang.org/g/misc/c/djfFMNCWmkE/m/F7WE8a0JAwAJ?pli=1)
<https://groups.google.com/a/dartlang.org/g/misc/c/djfFMNCWmkE/m/F7WE8a0JAwAJ?pli=1>
  '''));

  print.addCell(title:const Text("--------new cell------"));
  {
    send123(sendPort) async {
      for (var message in ["1", "2", "3"]) {
        (sendPort as SendPort).send(message);
        await Future.delayed(const Duration(seconds: 1));
      }
    }

    print.runInCurrentCell((print) {
      onPressed() async {
        try {
          ReceivePort receivePort = ReceivePort();
          Isolate.spawn(send123, receivePort.sendPort);

          receivePort.listen((message) {
            print("receive : $message");
          });
        } catch (e) {
          print("error: $e");
        }
      }

      print(FilledButton(onPressed: onPressed, child: const Text("开始，每隔一秒发送1，2，3")));
    });
  }
}
