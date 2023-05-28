import 'package:flutter/material.dart';

void main() {
  runApp(const Sample1());
}

class Sample1 extends StatelessWidget {
  const Sample1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: insert("Container.width", 100, OfDouble()),
      // height: insert("Container.height", 100, OfDouble()),
      color: Colors.blue,
      child: Container(),
    );
  }
}

// class X{
//   String? ss;
//   static String? ss;
// }
