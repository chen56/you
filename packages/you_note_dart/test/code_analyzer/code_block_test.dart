import 'dart:io';

import 'package:analyzer/dart/analysis/results.dart';
import 'package:checks/checks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:you_note_dart/src/content/source_code.dart';

void main() {
  late CodeAnalyzer analyzer;
  Future<ResolvedUnitResult> fileLib(String path) async {
    return await analyzer.getResolvedUnit(
      path: "test/code_analyzer/case_1_one_block.dart",
      content: File("test/code_analyzer/case_1_one_block.dart").readAsStringSync(),
    ) as ResolvedUnitResult;
  }

  setUp(() async {
    analyzer = CodeAnalyzer();
  });

  group("basic case", () {
    test("one block", () async {
      SourceCode code = SourceCode.parseUnit(await fileLib("test/code_analyzer/case_1_one_block.dart"));
      check(code.line(5)).equals(r'  print("block 0");');
      check(code.findBlock(line: 5)!.code).equals(r"""

  print("block 0");
""");
    });
    test("many block", () async {
      SourceCode code = SourceCode.parseUnit(await fileLib("test/code_analyzer/case_1_many_block.dart"));
      check(code.line(7)).equals(r'  print("block 0");');
      check(code.findBlock(line: 7)!.code).equals(r"""

  print("block 0");
""");
    });
  });
}
