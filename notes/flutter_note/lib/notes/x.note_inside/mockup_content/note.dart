// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note/note.dart';
build(BuildContext context, Pen print) {
  print.markdown('''


  ''');

  print(MockupContent()(LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
    return ColoredBox(
      color: Colors.red,
      child: Text(" $constraints"),
    );
  })));
  print(MockupContent()(LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
    return Text(" $constraints");
  })));

  print(MockupContent(
    width: 100000,
  )(LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
    return SizedBox.square(
      dimension: 10000,
      child: Text("$constraints"),
    );
  })));
  print(MockupContent(
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
