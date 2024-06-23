// ignore_for_file: avoid_print

import 'package:checks/checks.dart';
import 'package:test/test.dart';


main() async {
  group('Create Stream: async*', () {
    test('create', () async {
      Stream<int> range(int to) async* {
        for (int i = 1; i <= to; i++) {
          yield i;
        }
      }
      List<int> collect = [];
      await for (int i in range(3)) {
        collect.add(i);
      }
      check(collect).deepEquals([1, 2, 3]);
    });
  });
}
