// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../param/param.dart';

Params param = Params();

void main() {
  runApp(TextHelloSimple());
}

class Simple {
  static Param<String> data = param.ofString("text.data", value: "default").notNull();
  static TextAlignEditor textAlign = param.ofTextAlign("text.textAlign", value: TextAlign.center);
}

class TextHelloSimple extends StatelessWidget {
  const TextHelloSimple({super.key});

  @override
  Widget build(BuildContext context) {
    Container c = Container(
      width: 200,
      height: 100,
      color: Colors.blue,
      child: Text(
        param.ofString("text.data", value: "default").notNull().value,
        textAlign: Simple.textAlign.value,
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.w900,
          fontFamily: "Georgia",
          color: Colors.green,
          backgroundColor: Colors.red,
        ),
      ),
    );
    return Center(
      child: c,
    );
  }
}
