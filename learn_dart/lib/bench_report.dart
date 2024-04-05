// ignore_for_file: unnecessary_type_check

import 'dart:core';

import 'package:intl/intl.dart';
import 'package:test_api/src/backend/invoker.dart' show Invoker;

final numberFormatter = NumberFormat('###,###');

String thousandSeparator(num i) => numberFormatter.format(i);

/// 未完成，回头用过了再说

/*
| First Header  | Second Header |
| ------------- | ------------- |
| Content Cell  | Content Cell  |
| Content Cell  | Content Cell  |
  */

void printHeader({String title = ""}) {
  int bench=100;
  int elapsedMilliseconds=1000;

  print(groupTitle());
  print("|${"test".padRight(50)} | ${"loop".padRight(15)} | ${"elapsed Milliseconds".padRight(20)} |");
  print("|${"".padRight(50, "-")} | ${"".padRight(15, "-")} | ${"".padRight(20, "-")} |");
  print("${testTitle().padRight(50)} | ${thousandSeparator(bench).padRight(15)} | ${thousandSeparator(elapsedMilliseconds)}");

}

String testTitle() {
  final liveTest = Invoker.current!.liveTest;
  return "bench:${liveTest.test.name}";
}

String groupTitle() {
  if (Invoker.current == null) {
    return "not in test!";
  }
  final liveTest = Invoker.current!.liveTest;
  var group = liveTest.groups.last;
  if (group.name.isEmpty) return "main";
  return group.name.isEmpty ? "main" : group.name;
}
