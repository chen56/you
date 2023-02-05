import 'package:flutter/material.dart';
import 'package:learn_flutter/note/@common/param.dart';

void main() {
  runApp(const Sample1());
}

final Params params = Params();
final insert = params.insert;
final insert_ = params.insert_;


class Sample1 extends StatelessWidget {
  const Sample1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: insert("Container.width", 100, OfDouble()),
      height: insert("Container.height", 100, OfDouble()),
      color: Colors.blue,
      child: ElevatedButton(
        child: const Text("normal"),
        onPressed: () {},
      ),
    );
  }
}

// class X{
//   String? ss;
//   static String? ss;
// }
