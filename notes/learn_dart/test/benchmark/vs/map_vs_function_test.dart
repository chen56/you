// ignore_for_file: unnecessary_type_check

import 'dart:core';

import 'package:test/test.dart';


// dart
// 06:25:49 $ dart test -r expanded test/benchmark/vs/map_vs_function_test.dart
// 00:00 +0: string key: map
// 00:11 +1: string key: switch
// 00:20 +2: int key: map
// 00:21 +3: int key: switch int
// 00:22 +4: All tests passed!
// 结论：Map 取算法出来，和纯函数比，没有本质区别，关键是key的选择，string key的比int key，switch一样慢十倍

void main() {
  int bench = 100*1000 * 1000;

  group("string key:", () {

    encode(String s) => s;
    test('map', () {
      // 模仿一个小型的算法策略集合
      var jsonEncoders = Map.fromEntries(List.generate(10, (index) => index).map((e) => MapEntry("jsonEncoder-$e", encode)));

      for (int i = 0; i < bench; i++) {
        // ignore: unused_local_variable
        var result = jsonEncoders["jsonEncoder-${i % 10}"]!("json");
      }
    });
    test('switch', () {
      // 模仿一个小型的算法策略集合
      for (int i = 0; i < bench; i++) {
        var x = "jsonEncoder-${i % 10}";
        // ignore: unused_local_variable
        var result = switch (x) {
          "jsonEncoder-0" => encode("json"),
          "jsonEncoder-1" => encode("json"),
          "jsonEncoder-2" => encode("json"),
          "jsonEncoder-3" => encode("json"),
          "jsonEncoder-4" => encode("json"),
          "jsonEncoder-5" => encode("json"),
          "jsonEncoder-6" => encode("json"),
          "jsonEncoder-7" => encode("json"),
          "jsonEncoder-8" => encode("json"),
          "jsonEncoder-9" => encode("json"),
          _ => throw FormatException('Invalid'),
        };
      }
    });
  });
  // # 条件 - 只有数字，没有任何其他的东西，比如函数调用
  group("int key:", () {
    test('map', () {
      // 模仿一个小型的算法策略集合
      var jsonEncoders = List.generate(10, (i) => i).asMap();

      for (int i = 0; i < bench; i++) {
        int x = i % 10;
        // ignore: unused_local_variable
        var result = jsonEncoders[x]!;
      }
    });

    test('switch int', () {
      // 模仿一个小型的算法策略集合
      for (int i = 0; i < bench; i++) {
        int x = i % 10;
        // ignore: unused_local_variable
        var result = switch (x) {
          0 => i,
          1 => i,
          2 => i,
          3 => i,
          4 => i,
          5 => i,
          6 => i,
          7 => i,
          8 => i,
          9 => i,
          _ => throw FormatException('Invalid $x'),
        };
      }
    });
  });
}
