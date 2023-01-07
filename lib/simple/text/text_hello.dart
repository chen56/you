// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../param/param.dart';

Param param = Param.root();

void main() {
  runApp(simple());
}

Widget simple() {
  return TextHello();
}

class TextHello extends StatelessWidget {
  const TextHello({super.key});

  @override
  Widget build(BuildContext context) {
    Container c = Container(
      width: 200,
      height: 100,
      color: Colors.blue,
      child: Text(
        param.define<String>("text.data", value: "default", help: "").value,
        textAlign: param.define<TextAlign>("text.textAlign", value: TextAlign.center, help: "Text.textAlign").value,
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
