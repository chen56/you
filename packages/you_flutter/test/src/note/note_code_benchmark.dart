import 'package:flutter_test/flutter_test.dart';
import 'package:you_flutter/src/note/source_code.dart';

void main() {
  group("CodeAnalyzer", () {
    test('resolve', () async {
      MemoryCodeAnalyzer analyzer = MemoryCodeAnalyzer();
      for (int i = 0; i < 500; i++) {
        var resolveUnitResult = await analyzer.getResolvedUnit(path: "/pkg/lib/routes/notes/page.dart", content: '''
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
''');
        resolveUnitResult;
        // debugPrint("$resolveUnitResult");
      }
    });
  });
}
