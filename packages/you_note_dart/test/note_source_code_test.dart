
import 'package:analyzer/dart/analysis/results.dart';
import 'package:checks/checks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:you_note_dart/src/note/contents/source_code.dart';

void main() {
  late CodeAnalyzer analyzer;
  Future<ResolvedUnitResult> resolveContent(String content) async {
    return await analyzer.getResolvedUnit(path: "x.dart", content: content) as ResolvedUnitResult;
  }

  setUp(() async {
    analyzer = CodeAnalyzer();
  });

  group("basic case", () {
    test("one block", () async {
      SourceCode sourceCode = SourceCode.parseUnit(await resolveContent('''
void build(BuildContext context, Cell print) {
  print("root cell code");
}'''));
      check(sourceCode.line(2)).equals(r'  print("root cell code");');
      check(sourceCode.findCellCodeByLineNo(2)).equals('''  print("root cell code");''');
    });
  });

  group("many block", () {
    test("many block", () async {
      SourceCode code = SourceCode.parseUnit(await resolveContent('''
void build(BuildContext context, Cell print) {
  print("root cell code");
  print.addCell(title:"cell 1");
  print("cell 1 code");
  print.addCell(title:"cell 2");
  print("cell 2 code");
}
'''));
      check(code.line(3)).equals(r'''  print.addCell(title:"cell 1");''');
      // cell 1的代码在 cell 1和cell 2之间
      check(code.findCellCodeByLineNo(3)).equals('''  print("cell 1 code");''');

      check(code.line(5)).equals(r'''  print.addCell(title:"cell 2");''');
      // cell 2的代码在 cell 2到其所属block结束
      check(code.findCellCodeByLineNo(5)).equals('''  print("cell 2 code");''');
    });
  });
}
