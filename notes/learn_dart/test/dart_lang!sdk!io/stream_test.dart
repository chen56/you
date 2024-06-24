// ignore_for_file: avoid_print

import 'package:checks/checks.dart';
import 'package:test/test.dart';

main() async {
  group('Create Stream', () {
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

    test('Stream<int>.fromIterable()', () async {
      var s = Stream<int>.fromIterable([2, 4, 6]);
      check(await s.toList()).deepEquals([2, 4, 6]);
    });
    test('Stream<int>.periodic()', () async {
      var counterStream = Stream<int>.periodic(const Duration(seconds: 1), (x) => x).take(3);
      check(await counterStream.toList()).deepEquals([0, 1, 2]);
    });
  });

  group('Use Stream', () {});
}
