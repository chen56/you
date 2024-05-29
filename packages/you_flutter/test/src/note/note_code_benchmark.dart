import 'package:_you_dart_internal/analyzer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("CodeAnalyzer", () {
    test('resolve', () async {
      MemoryFsAnalyzer analyzer = MemoryFsAnalyzer();
      for (int i = 0; i < 500; i++) {
        var resolveUnitResult = await analyzer.getResolvedLibrary(path: "/pkg/lib/routes/notes/page.dart", content: '''
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
