import 'package:_you_dart_internal/utils.dart';
import 'package:checks/checks.dart';
import 'package:test/test.dart';

void main() {
  group("types.isType", () {
    test('TypeHook can const 对比一下常量对类型参数的影响', () {
      check(identical(const TypeHook(), const TypeHook())).equals(true);
      check(identical(const TypeHook<int>(), const TypeHook<int>())).equals(true);
      check(identical(const TypeHook<int>(), const TypeHook())).equals(false);
      check(identical(const TypeHook<int>(), const TypeHook<int?>())).equals(false);
    });

    test('isType 普通对象 ', () {
      check(const TypeHook<List>().isType<List>()).equals(true);
      check(const TypeHook<List>().isType<Iterable>()).equals(true);
      check(const TypeHook<List>().isType<Set>()).equals(false);
    });

    test('isType 数字原生对象', () {
      // ok
      check(const TypeHook<num>().isType<num>()).equals(true);
      check(const TypeHook<int>().isType<num>()).equals(true);
      check(const TypeHook<num>().isType<Object>()).equals(true);
      check(const TypeHook<num>().isType<dynamic>()).equals(true);

      // 反过来不行
      check(const TypeHook<num>().isType<int>()).equals(false);
      check(const TypeHook<dynamic>().isType<num>()).equals(false);
      check(const TypeHook<Object>().isType<num>()).equals(false);

      // 其他类型当然更不行
      check(const TypeHook<String>().isType<num>()).equals(false);
      check(const TypeHook<num>().isType<String>()).equals(false);

      // ⚠️特别注意 类型比较时，nullable 被忽视了
      check(const TypeHook<num>().isType<num?>()).equals(true);
      check(const TypeHook<num?>().isType<num>()).equals(true);


    });
  });
  test('isNullable ', () {
    check(const TypeHook<List>().isNullable()).equals(false);
    check(const TypeHook<List?>().isNullable()).equals(true);
  });

  group("type name", () {
    test('is string ', () {
      check(types.simpleName(List)).equals("List");
      check(types.simpleName(String)).equals("String");
    });
  });

  group("Uniquely", () {
    test('equals ', () {
      var a=  Unique("a");
      var b=  Unique("a");
      check(a== a).equals(true);
      check(a!= b).equals(true);
    });
  });


}
