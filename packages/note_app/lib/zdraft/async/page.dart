import 'package:flutter/material.dart';
import 'package:note/page_core.dart';
import 'package:note_app/note_app.dart';
import 'package:note_mate_flutter/material.dart';

PageMeta page = PageMeta(
  shortTitle: "异步async",
  layout: Layouts.defaultLayout(defaultCodeExpand: false),
  builder: build,
);

build(BuildContext context, Pen print) {
  print.markdown(r'''
# 异步


  ''');
  {
    // Future<String> bomb() async {
    //   return Future.delayed(Duration(seconds: 3), () => "bong!!!");
    // }

    var onPressed = () {};
    print(FilledButton(
        onPressed: onPressed..sampleCodeStr = "onPressed",
        child: Text$Mate("按后3秒后爆炸")));
  }
}
