// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

main() {
  FlutterError.onError = (FlutterErrorDetails details) {
    debugPrint("err:${details.toStringShort()}");
  };

  // flutter程序外部必须有一个Directionality文本方向组件，所以汇报错，并自己捕获
  runApp(const Text("这个文本出不来"));
}