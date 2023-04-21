import 'package:flutter/material.dart';

void main() {
  runApp(const RichTextSample());
}

// final ParamNode params = ParamNode();
// final insert = params.insert;
// final insert_ = params.insert_;

class RichTextSample extends StatelessWidget {
  const RichTextSample({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: insert("Container.width", 100, OfDouble()),
      // height: insert("Container.height", 100, OfDouble()),
      color: Colors.blue,
      child: const Text.rich(
        TextSpan(
          text: "text",
          // text: insert_("Container.child.text", "你好！", OfString()),
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
