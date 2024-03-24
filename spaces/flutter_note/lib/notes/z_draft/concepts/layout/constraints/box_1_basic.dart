import 'package:flutter/material.dart';

main() {
  runApp(
    // flutter程序外部必须有一个Directionality文本方向组件，要不会报错
    Directionality(
      textDirection: TextDirection.ltr,
      // child换成其他实验看效果
      child: test2ParentTight(),
    ),
  );
}

// 查询UI最外层本约束信息
// 最外层是固定这种：BoxConstraints(w=1103.0, h=566.0)
Widget test1QueryBasicConstraints() {
  return LayoutBuilder(builder: (_, constraints) => Text("root: $constraints"));
}

//
Widget test2ParentTight() {
  return Container(
    width: 100,
    height: 100,
    color: Colors.red,
    child: Container(
      width: 200,
      height: 200,
      color: Colors.blue,
        // 蓝色占满屏幕
        // BoxConstraints(w=1103.0, h=566.0),而不是BoxConstraints(w=100.0, h=100)
        child:LayoutBuilder(builder: (_, constraints) => Text("root: $constraints"))
    ),
  );
}
