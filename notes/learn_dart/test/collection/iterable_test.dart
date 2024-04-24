// ignore_for_file: unnecessary_type_check

import 'dart:core';

import 'package:checks/checks.dart';
import 'package:test/test.dart';

void main() {
  group("范型", () {
    test('null 问题', () {
      Iterable<int> notNull = [1, 2];
      expect(notNull is Iterable, true);

      Iterable<int>? nullable = [1, 2];
      expect(nullable is Iterable, true);

      Iterable<int>? nullableNull;
      expect(nullableNull is! Iterable<int>, true);
      expect(nullableNull is Iterable<int>?, true);
    });
  });
  group("expand", () {
    var x = [
      [1, 2],
      [4, 5]
    ];
    test('yield', () {
      check(x.expand((e) sync* {
        for (var i in e) {
          yield i;
        }
      })).deepEquals([1, 2, 4, 5]);
    });
    test('yield*', () {
      check(x.expand((e) sync* {
        yield* e;
      })).deepEquals([1, 2, 4, 5]);
    });
  });
  group("expand", () {
    var x = [1,2,3,4];
    test('yield', () {

      Iterable<(E value,E? next)> combineNext<E>(Iterable<E> values)sync*{
        var list=values.toList();
        for(int i =0;i<list.length;i++){
          if(i+1<list.length){
            yield (list[i],list[i+1]);
          }else{
            yield (list[i],null);
          }
        }
      }
      var combined = combineNext(x);
      check(combined).deepEquals([(1,2),(2,3),(3,4),(4,null)]);
    });
  });
}
