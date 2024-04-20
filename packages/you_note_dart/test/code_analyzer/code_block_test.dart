
import 'package:checks/checks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:you_note_dart/src/content/source_code.dart';

void main() {
  group("code analyzer", () {
    test("block", () async {
      SourceCode code = SourceCode.parseFile("test/code_analyzer/use_case_basic.dart");
      check(code.line(8)).equals(r'  print("x:$x");');
      check(code.findCellCode(line: 8)!.blockContent).equals(r"""

  // begin comment 中文字符
  print("x:$x");
  // end comment 中文字符
""");
    });
  });
}
