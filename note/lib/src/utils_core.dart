/// 基础包，不依赖其他业务代码
library;

/// result = Sub is Super
bool isType<Sub, Super>() {
  return <Sub>[] is List<Super> || <Sub>[] is List<Super?>;
}

bool isSubTypeOf<Sub, Super>(Sub object) {
  return <Sub>[] is List<Super> || <Sub>[] is List<Super?> || object is Super;
}

/// 判断类型T是否是nullable的:
///     expect(isNullable<int>(), isFalse);
///     expect(isNullable<int?>(), isTrue);
bool isNullable<T>() {
  return null is T;
}

bool isNullableOf<T>(T t) {
  return null is T || t == null;
}

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

extension StringExt on String {
  String safeSubstring(int start, [int? end]) {
    end ??= length;
    end = end <= length ? end : length;
    try {
      return substring(start, end);
    } catch (e) {
      throw Exception("$e, string $this");
    }
  }
}
