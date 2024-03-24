import 'package:flutter/material.dart';

main() {
  runApp(
    // flutter程序外部必须有一个Directionality文本方向组件，要不会报错
    Directionality(
      textDirection: TextDirection.ltr,
      child: test1QueryBasicConstraints(),
    ),
  );
}
// 查询UI最外层本约束信息
// 最外层是固定这种：BoxConstraints(w=1103.0, h=566.0)
Widget test1QueryBasicConstraints(){
  return LayoutBuilder(builder: (context, constraints) {
    debugPrint("${constraints}");
    return Text("LayoutBuilder: ${constraints}");
  });
}
