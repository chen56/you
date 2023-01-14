import 'package:learn_flutter/src/notebook/notebook.dart';
import 'package:learn_flutter/src/docs/widgets/text/Text/doc.dart' as text;

Doc doc = Doc(title: "Root", children: [
  Doc(title: "Text", children: [text.doc]),
  text.doc,
]);

main() {}
