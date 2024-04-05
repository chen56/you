// ignore_for_file: unnecessary_type_check

import 'dart:core';

import 'package:intl/intl.dart';
import 'package:test_api/src/backend/invoker.dart';

final numberFormatter = NumberFormat('###,###');

String thousandSeparator(num i) => numberFormatter.format(i);

class Bench {
  final String title;
  final int loop;

  // Loop
  Bench(this.title, Function(Bench bench) callback, {required this.loop}) {

  }

  runBench(String title, Function(int i) banchmark, {int? loop, required}) {
    var thisLoop = loop ?? this.loop;
    Stopwatch stopwatch = Stopwatch();
    stopwatch.start();
    for (var i = 0; i < thisLoop; i++) {
      banchmark(i);
    }
    stopwatch.stop();

    print("${testTitle().padRight(50)} | ${thousandSeparator(thisLoop).padRight(15)} | ${thousandSeparator(stopwatch.elapsedMilliseconds)}");
  }

  /*
| First Header  | Second Header |
| ------------- | ------------- |
| Content Cell  | Content Cell  |
| Content Cell  | Content Cell  |
  */
  void printHeader({String title = ""}) {
    print(groupTitle());
    print("|${"test".padRight(50)} | ${"loop".padRight(15)} | ${"elapsed Milliseconds".padRight(20)} |");
    print("|${"".padRight(50, "-")} | ${"".padRight(15, "-")} | ${"".padRight(20, "-")} |");
  }
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
