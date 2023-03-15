import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:note/utils.dart' as utils;

abstract class Param<T> {
  Param? parent;
  final T init;
  final T _value;

  T get value => _value;

  Param({required this.init}) : _value = init;

  bool get isNullable => utils.isNullable<T>();
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
  final Map<String, ObjectParam> _paramMap = {};
  final T Function(ObjectParam<T> mate)? builder;

  ObjectParam({required super.init, this.builder});

  Param<C> put<C>(String name, C init) {
    assert(
        !_paramMap.containsKey(name), "error:duplicate param name: $name , old:${_paramMap[name]}");

    var result = ObjectParam(init: init);
    result.parent = this;
    return _paramMap[name] = result;
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
