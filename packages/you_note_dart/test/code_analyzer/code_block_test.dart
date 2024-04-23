
import 'package:checks/checks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:you_note_dart/src/content/source_code.dart';

void main() {
  group("basic case", () {
    test("one block", () async {
      SourceCode code = SourceCode.parseFile("test/code_analyzer/case_1_one_block.dart");
      check(code.line(5)).equals(r'  print("block 0");');
      check(code.findBlock(line: 5)!.code).equals(r"""

  print("block 0");
""");
    });
    test("many block", () async {
      SourceCode code = SourceCode.parseFile("test/code_analyzer/case_1_many_block.dart");
      check(code.line(7)).equals(r'  print("block 0");');
      check(code.findBlock(line: 7)!.code).equals(r"""

  print("block 0");
""");
    });
  });
}
