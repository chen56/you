import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:note/utils.dart' as utils;
import 'package:note/utils.dart';

abstract class Param<T> {
  Param? parent;
  final T init;
  final T _value;

  T get value => _value;

  Param({required this.init}) : _value = init;

  bool get isNullable => utils.isNullable<T>();

  factory Param.newValue({required init}) {
    return ValueParam(init: init);
  }
}

class ValueParam<T> extends Param<T> {
  ValueParam({required super.init});
}

class ArrayParam<T> extends Param<List<T>> with ListMixin<T> {
  List<T> array = List.empty(growable: true);

  ArrayParam({required super.init});

  @override
  int get length => array.length;

  @override
  set length(newLength) {
    array.length = newLength;
  }

  @override
  T operator [](int index) {
    return array[index];
  }

  @override
  void operator []=(int index, T value) {
    array[index] = value;
  }
}

class ObjectParam<T> extends Param<T> with MapMixin<String, T> {
  final Map<String, Param> _paramMap = {};
  final T Function(ObjectParam<T> mate)? builder;

  ObjectParam({required super.init, this.builder});

  /// [ObjectParam.put] :
  /// - value is Mate -> use Mate.mateParams
  /// - value is atom value -> ValueParam
  /// - value is null -> ValueParam
  /// - others -> ValueParam
  Param<C> put<C>(String name, C init) {
    assert(
        !_paramMap.containsKey(name), "error:duplicate param name: $name , old:${_paramMap[name]}");

    var result = _convertUseDart3Patterns<C>(init);
    result.parent = this;
    _paramMap[name] = result;
    return result;
  }

  Param<T> asParam() {
    return this;
  }

  // dart3 switch patterns : use idea, click class name can not navigation to source
  Param<C> _convertUseDart3Patterns<C>(C init) {
    return switch (init) {
      Mate() => init.mateParams as Param<C>,
      Param() => init as Param<C>,
      _ => Param.newValue(init: init),
    };
  }

  // ignore: unused_element
  Param<C> _convertUseDart2<C>(C init) {
    if (init is Param) return init as Param<C>;
    if (isSubtype<Mate, C>()) return (init as Mate<C>).mateParams;
    return ValueParam(init: init);
  }

  Param<C> get<C>(String name) {
    return _paramMap[name] as Param<C>;
  }

  @override
  T? operator [](Object? key) {
    return _paramMap[key]?.value;
  }

  @override
  void operator []=(String key, T value) {
    put(key, value);
  }

  @override
  void clear() {
    _paramMap.clear();
  }

  @override
  Iterable<String> get keys => _paramMap.keys;

  @override
  T? remove(Object? key) {
    var p = _paramMap.remove(key);
    return p?.value;
  }

  List<MapEntry<Object, Param>> toList() {
    return List.empty();
  }
}

mixin Mate<T> {
  late final ObjectParam<T> mateParams;
}

mixin WidgetMate<T> on Widget implements Mate<T> {
  @override
  late final ObjectParam<T> mateParams;
}

abstract class Editor<T> {
  final String name;
  final T init;

  Editor({required this.name, required this.init});
}
