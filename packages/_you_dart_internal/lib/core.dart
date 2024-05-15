import 'package:meta/meta.dart';

/// 基础包，不依赖其他业务代码

Types types = Types();
Strings strings = Strings();
final Collections collections=Collections();


@experimental
typedef Convert<FROM, TO> = TO Function(FROM from);

@experimental
base mixin class Types {
// 集合的直接类型转换会报错：
//     exception : return params.map((e)=>e.build()).toList() as T
// 可以利用原类型集合复制出来做基础，再填充，然后转型就不会错了。
  R castList<R>({required Iterable from, required List to}) {
    assert(to is R, "arg to:$to , type should be $R");
//copy same type list
    var result = to.sublist(0, 0);
// or
// var result = to.toList()..clear();

// fill
    for (var e in from) {
      result.add(e);
    }

//cast, no exception ,because : to is R == true
    return result as R;
  }

  @experimental
  R castSet<R>({required Iterable from, required Set to}) {
    assert(to is R, "arg to:$to , type should be $R");
//copy same type list
    var result = to.toSet();
// or
// var result = to.toList()..clear();

// fill
    for (var e in from) {
      result.add(e);
    }

//cast, no exception ,because : to is R == true
    return result as R;
  }

  @experimental
  String simpleName(Type type) {
    String str = type.toString();
    int index = str.indexOf("<");
    if (index < 0) return str;
    return str.substring(0, index);
  }
}


/// 范型参数只有在类型内才能看见，比如Map Signal内的key, value类型外部是无法看见的，
/// 只能通过钩子传出来
@experimental
final class TypeHook<T> {
  const TypeHook();

  bool isType<Super>() {
    return <T>[] is List<Super> || <T>[] is List<Super?>;
  }

  bool isSuper<Sub>() {
    return <Sub>[] is List<T> || <Sub>[] is List<T?>;
  }

  /// 判断类型T是否是nullable的:
  ///     expect(isNullable<int>(), isFalse);
  ///     expect(isNullable<int?>(), isTrue);
  bool isNullable() {
    return null is T;
  }
  bool isNullableOf(T t) {
    return null is T || t == null;
  }

  bool isTypeOf(obj) {
    return obj is T;
  }
}

@experimental
class Unique {
  final String name;
  Unique(this.name);

  String shortHash(Object? object) {
    return object.hashCode.toUnsigned(20).toRadixString(16).padLeft(5, '0');
  }

  @override
  String toString() => '[#$name:${shortHash(this)}]';

}

class Strings {
  /// content only space、/r/n ...not useful text
  bool isBlank(String str) {
    // \s: 匹配任何空白字符，包括空格、制表符、换行符等。
    return str.contains(RegExp(r'^\s*$'));
  }

  String safeSubstring(String str, int start, [int? end]) {
    end ??= str.length;
    end = end <= str.length ? end : str.length;
    try {
      return str.substring(start, end);
    } catch (e) {
      throw Exception("$e, string $this");
    }
  }
}



class Collections{
  Iterable<(E value, E? next)> combineNext<E>(Iterable<E> values) sync* {
    var list = values.toList();
    for (int i = 0; i < list.length; i++) {
      if (i + 1 < list.length) {
        yield (list[i], list[i + 1]);
      } else {
        yield (list[i], null);
      }
    }
  }

}