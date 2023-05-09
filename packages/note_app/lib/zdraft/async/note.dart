import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:note/note_core.dart';
import 'package:note_app/note_app.dart';

NoteConfPart page = NoteConfPart(
  shortTitle: "异步async",
  layout: Layouts.defaultLayout(defaultCodeExpand: false),
  builder: build,
);

build(BuildContext context, Pen print) async {
  print.$____________________________________________________________________();
  print.markdown(r'''
# 异步

## Future
  ''');

  print.$____________________________________________________________________();
  {
    Future<String> bomb() async {
      print("s");
      return Future.delayed(Duration(seconds: 3), () => "bong!!!");
    }

    // print.runInCurrentCell((print) {
    //   debugPrint("ppp ${print}");
    //   debugPrint("ppp--- ${print.pen.cells}");
    //
    //   print(FilledButton(onPressed: () {}, child: const Text("按后3秒后爆炸")));
    // });

    //
    print.runInCurrentCell((print) {
      debugPrint("ppp ${print}");
      debugPrint("ppp--- ${print.pen.cells}");

      onPressed() async {
        var msg = await bomb();
        // todo 这个print在 async时，会打到最后一个cell
        print(msg);
        // debugPrint("ppp2 ${print.hashCode}");
        // debugPrint("ppp2--- ${print.pen.cells}");
      }

      print(FilledButton(
          onPressed: onPressed..sampleCodeStr = "onPressed",
          child: const Text("按后3秒后爆炸")));
    });
  }

  print.$____________________________________________________________________();
  print.markdown(r'''
## Isalted

web 模式不支持 Isolated，如果运行在web模式下，此范例将报错

Error: Unsupported operation: dart:isolate is not supported on dart4web
  ''');

  print.$____________________________________________________________________();
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

      print(FilledButton(
          onPressed: onPressed..sampleCodeStr = "onPressed",
          child: const Text("开始，每隔一秒发送1，2，3")));
    });
  }
}
