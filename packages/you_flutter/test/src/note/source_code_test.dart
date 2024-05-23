import 'package:checks/checks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:you_flutter/src/note/source_code.dart';

void main() {
  group("caller", () {
    test('findCaller', () async {
      var content = """
import 'package:flutter/widgets.dart';
import 'package:you_flutter/note.dart';

void build(BuildContext context, Cell print) {
  TextExamples texts = TextExamples();
  CellView(title: "texts.hello", builder: texts.hello);
}

class TextExamples {
  Widget hello(BuildContext context) {
    return Text("bar");
  }
}
""";

      SourceCode s = SourceCode.parse(content);
      check(s.line(6)).equals('''  CellView(title: "texts.hello", builder: texts.hello);''');
      check(s.line(11)).equals('''    return Text("bar");''');

    });
  });
}
