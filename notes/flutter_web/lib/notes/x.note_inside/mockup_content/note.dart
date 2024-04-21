// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:you_note_dart/note.dart';
void build(BuildContext context, Cell print) {
  print.markdown('''


  ''');

  print(MockupWindow()(LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
    return ColoredBox(
      color: Colors.red,
      child: Text(" $constraints"),
    );
  })));
  print(MockupWindow()(LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
    return Text(" $constraints");
  })));

  print(MockupWindow(
    width: 100000,
  )(LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
    return SizedBox.square(
      dimension: 10000,
      child: Text("$constraints"),
    );
  })));
  print(MockupWindow(
    height: 100,
    width: 10000,
  )(LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
    return ListView(

      children: [
        // Expanded(child: Icon(Icons.add, size: 100)),
        // Expanded(child: Icon(Icons.add, size: 100)),
        LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
          return Text(" $constraints");
        }),
        Align(alignment:Alignment.bottomRight ,child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
          return Text(" $constraints");
        }),),
        Align(alignment:Alignment.bottomRight ,child: Icon(Icons.add, size: 100),),
        Icon(Icons.add, size: 100),
        Icon(Icons.add, size: 100),
        LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
          return Text(" $constraints");
        }),
        // Container(height: double.infinity,width: 100, color: Colors.red,)
      ],
    );
  })));
}
