// ignore_for_file: prefer_const_constructors

import 'dart:ffi';

import 'package:flutter/material.dart';

import '../../param/param.dart';

void main() {
  runApp(TextHelloSample());
}

final Params params = Params();

class TextHelloSample extends StatelessWidget {
  TextHelloSample({super.key});

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < 10; i++) {}
    Container c = Container(
      width: 200,
      height: 100,
      color: Colors.blue,
      child: Text(
        params.ofString("text.data").notNull("default"),
        textAlign: params.ofTextAlign("text.textAlign").nullable(TextAlign.center),
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
