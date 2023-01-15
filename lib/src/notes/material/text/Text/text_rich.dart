
import 'package:flutter/material.dart';
import 'package:learn_flutter/src/note/param.dart';


void main() {
  runApp(const RichTextSample());
}

final Params params = Params();
final insert = params.insert;
final insert_ = params.insert_;

class RichTextSample extends StatelessWidget {
  const RichTextSample({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: insert("Container.width", 100, OfDouble()),
      height: insert("Container.height", 100, OfDouble()),
      color: Colors.blue,
      child: Text.rich(
        TextSpan(
          text: insert_("Container.child.text", "你好！", OfString()),
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
