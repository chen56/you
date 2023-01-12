// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../param/param.dart';

void main() {
  runApp(TextHelloSample());
}

final Params params = Params();
final insert = params.insert;
final insert_ = params.insert_;

// Container.width
// Container.height
// Container.child.data
// Container.child.textAlign
// Container.child.style.fontSize

class TextHelloSample extends StatelessWidget {
  TextHelloSample({super.key});

  @override
  Widget build(BuildContext context) {
    Container c = Container(
      width: insert("Container.width", 100, OfDouble()),
      height: insert("Container.height", 100, OfDouble()),
      color: Colors.blue,
      child: Text(
        params.ofString("Container.child.data").notNull("default"),
        textAlign: insert_("Container.child.textAlign", TextAlign.center, OfTextAlign()),
        style: insert_(
            "Container.child.style",
            TextStyle(
              fontSize: insert("Container.child.style.fontSize", 24.0, OfDouble()),
              fontWeight: FontWeight.w900,
              fontFamily: "Georgia",
              color: Colors.greenAccent,
              backgroundColor: Colors.red,
            )),
      ),
    );

    return Center(
      child: c,
    );
  }
}

// class X{
//   String? ss;
//   static String? ss;
// }
