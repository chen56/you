import 'package:flutter/material.dart';
import 'package:learn_flutter/params/param.dart';

void main() {
  runApp(const NormalTextSample());
}

final ParamNode params = ParamNode();
final insert = params.insert;
final insert_ = params.insert_;

// Container.width
// Container.height
// Container.child.data
// Container.child.textAlign
// Container.child.style.fontSize

class NormalTextSample extends StatelessWidget {
  const NormalTextSample({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: insert("Container.width", 100, OfDouble()),
      height: insert("Container.height", 100, OfDouble()),
      color: Colors.blue,
      child: Text(
        insert("Container.child.data", "文本", OfString()),
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
  }
}

// class X{
//   String? ss;
//   static String? ss;
// }
