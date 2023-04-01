import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

main() {
  runApp(const MyHomepage());
}

class MyHomepage extends StatelessWidget {
  const MyHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    const directionality = Directionality(
      textDirection: TextDirection.ltr,
      child: Text("Hello"),
    );
    SchedulerBinding.instance.addPostFrameCallback((Duration timeStamp) {
      // print(" constraints addPostFrameCallback ${context.findRenderObject()?.constraints}");
      // print(" constraints addPostFrameCallback ${context.findRenderObject()?.paintBounds}");
      // print(" constraints addPostFrameCallback ${context.findRenderObject()?.parentData}");
      // print(" constraints addPostFrameCallback ${context.findRenderObject()?.semanticBounds}");
      context.visitAncestorElements((element) {
        // print(
        //     " element pre  ${" " * element.depth} ${element.toStringShort()} ${element.toDiagnosticsNode().getProperties().map((e) => "xxxx:${e.name}")}");
        // print("${element is RootRenderObjectElement}");

        // if (element is! RootRenderObjectElement) {
        //   print(
        //       " element con ${element.toStringShallow()} ${element.findRenderObject()?.constraints}");
        // } else {
        //   print(" --  ${element.toDiagnosticsNode()} ");
        // }
        return true;
      });
    });
    // print(" constraints ${context.findRenderObject()?.constraints}");
    // print(" constraints ${context.findRenderObject()?.parentData}");
    return Container(
      // decoration: BoxDecoration(color: Colors.lightBlue, border: Border.all(color: Colors.brown)),
      margin: const EdgeInsets.all(18),
      color: Colors.green,

      // width: 200,
      // height: 100,
      child: directionality,
    );
  }
}
