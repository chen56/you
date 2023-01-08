// ignore_for_file: unused_local_variable

import 'dart:collection';

import 'package:test/test.dart';

void main() {
  test('param api 实验 ，dart的范型和nullable难搞', () {
    Iterator<String> paths = Iterable.generate(100, ((index) => "s.$index")).iterator;
    String next() {
      paths.moveNext();
      return paths.current;
    }

    // not null
    var params = Params2();
    {
      Param2<String> p = params.string2(next(), value: "str");
      String s = p.value;
    }
    {
      Param2<String> p = params.string2(next());
      String? s = p.value;
    }

    // nullable
    {
      Param2<String?> p = params.string2(next(), value: "str");
      String? s = p.value;
    }
    {
      Param2<String?> p = params.string2(next(), value: null);
      String? s = p.value;
    }
    {
      Param2<String?> p = params.string2(next());
      String? s = p.value;
    }
  });

  test('param api 实验 ，param 先 ，editor后', () {
    Iterator<String> paths = Iterable.generate(100, ((index) => "s.$index")).iterator;
    String next() {
      paths.moveNext();
      return paths.current;
    }

    // not null
    var params = Params2();
    {
      StringEditor p = params.stringEditor(next());
      String? s = p.value;
      Param2<String> pp = p.notNull();
    }

    // nullable
    {
      Param2OrNull<String> p = params.orNull(next());
      String? s = p.value;
    }
    {
      Param2OrNull<String?> p = params.orNull(next(), value: null);
      String? s = p.value;
      String? v = params.orNull(next(), value: null).value;
    }
  });

  test('param api 实验, null safe', () {
    {
      Param2<String?> pp = Param2(value: null);
      String? s = pp.value;
    }
  });
}

class Param2<T> {
  T value;

  Param2({
    required this.value,
  });
}

class Param2OrNull<T> {
  T? value;

  Param2OrNull({
    this.value,
  });
}

class Params2 {
  final Map<String, Param2> _params = HashMap();

  Param2<String> string2(
    String path, {
    String? value,
  }) {
    return _params.putIfAbsent(
      path,
      () => Param2<String>(value: value ?? ""),
    ) as Param2<String>;
  }

  StringEditor stringEditor(String key) {
    return StringEditor();
  }

  Param2<T> notNull<T>(String path, {required T value}) {
    return Param2(value: value);
  }

  Param2OrNull<T> orNull<T>(String next, {T? value}) {
    return Param2OrNull(value: value);
  }
}

class StringEditor {
  String? value;
  static const String notNullDefault = "";
  Param2<String> notNull() {
    return Param2<String>(value: value ?? notNullDefault);
  }
}
