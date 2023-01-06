// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:learn_flutter/mate/text.dart';

import '../../param.dart';

Param param = Param();

void main() {
  param.path("text").help(TextMate.help.constructor);
  runApp(TextHello());
}

class TextHello extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      param.path("text.data").help(TextMate.help.data).value("xxx"),
      textAlign: param.path("text.data").help(TextMate.help.textAlign).value(TextAlign.center),
    );
  }
}

class TextHello2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var x = Text.rich;
    var y = Text.new;

    return Text(
      /*param:"text.data"*/ "xxx" /*param*/,
      textAlign: TextAlign.center,
    );
  }
}
