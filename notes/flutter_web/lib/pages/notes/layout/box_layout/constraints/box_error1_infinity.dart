// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

main() {
  runApp(
    Builder(
      builder: (context) => Directionality(
        textDirection: TextDirection.ltr,
        /*修改这里测试*/ child: test2_ListView_is_ok(),
      ),
    ),
  );
}

Widget constraintsInfo(String title) {
  return LayoutBuilder(builder: (context, constraints) {
    debugPrint("$title: $constraints");
    return Text("$title: $constraints");
  });
}

// 查询UI最外层本约束信息
// 最外层是固定这种：BoxConstraints(w=1103.0, h=566.0)
Widget test1_QueryBasicConstraints() {
  return constraintsInfo("/");
}

// Column直接包ListView汇报错
Widget test1_unbounded_fail() {
  return Column(
    children: [
      // 1. 报错
      // error: Vertical viewport was given unbounded height.
      // 父Column说：儿子你可以无限高(BoxConstraints(0.0<=w<=542.0, 0.0<=h<=Infinity))
      // 儿ListView说：那我就要无限高吧，我自带滚动条
      // 父Column说：error，我挂了！
      ListView(children: const [Text("")]),
    ],
  );
}

// Column直接包ListView报错
Widget test1_unbounded_fail_recover() {
  return Column(
    children: [
      // Column的可以无限高
      // BoxConstraints(0.0<=w<=542.0, 0.0<=h<=Infinity)
      constraintsInfo("Column"),
      const Divider(),

      SizedBox(
        height: 200,
        // BoxConstraints(0.0<=w<=826.0, h=200.0)
        child: constraintsInfo("Column>SizedBox(height:200)"),
      ),
      const Divider(),

      SizedBox(
        width: 200,
        height: 200,
        // BoxConstraints(w=200.0, h=200.0)
        child: constraintsInfo("Column>SizedBox(width: 200, height:200)"),
      ),
      const Divider(),

      // 2.必须限制高度
      // 父Column说：大春，我还是限制下你吧，你比较特殊(BoxConstraints(0.0<=w<=826.0, h=200.0))
      // 儿ListView说：好吧，我高200
      // 父Column说：谢谢
      SizedBox(
        height: 200,
        child: ListView(children: [
          // BoxConstraints(w=826.0, 0.0<=h<=Infinity)
          constraintsInfo("Column>SizedBox(width:200,height:200)>ListView"),
          ...List.generate(100, (index) => Text("list item:$index")),
        ]),
      ),

      // 3. Expanded也会限制，而且更好，因为他算好剩余的高度给到儿子ListView
      // Expanded 要求：BoxConstraints(0.0<=w<=623.0, h=91.0)
      // 即：填满空间所需的高度作为约束，
      Expanded(
        child: constraintsInfo("Column>Expanded"),
      ),
      const Divider(),

      // 3.1. 就这样
      Expanded(
        child: ListView(children: [constraintsInfo("Column>Expanded>ListView")]),
      ),
      const Divider(),
    ],
  );
}

Widget test2_ListView_is_ok() {
  return ListView(
    children: [
      // Column的可以无限高
      // BoxConstraints(0.0<=w<=542.0, 0.0<=h<=Infinity)
      constraintsInfo("ListView"),
      constraintsInfo("ListView"),
      constraintsInfo("ListView"),
      const Divider(),
      Column(
        children: [
          constraintsInfo("ListView>Column"),
        ],
      )
    ],
  );
}
