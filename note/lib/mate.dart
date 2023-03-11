import 'package:flutter/material.dart';
import 'package:note/utils.dart' as utils;

abstract class Param<T> {
  T get init;
  T get value;
}

class Params<T> extends Param<T> {
  final Map<String, Params> _paramMap = {};
  final T Function(Params<T> mate)? builder;

  @override
  final T init;

  final T _value;

  Params({required this.init, this.builder}) : _value = init;

  bool get isNullable => utils.isNullable<T>();

  @override
  T get value => _value;

  Param<C> set<C>({required String name, required C init}) {
    assert(
        !_paramMap.containsKey(name), "error:duplicate param name: $name , old:${_paramMap[name]}");

    var result = Params(init: init);
    return _paramMap[name] = result;
  }

  Param<C> get<C>(String name) {
    return _paramMap[name] as Param<C>;
  }

  C getValue<C>(String name) {
    return (_paramMap[name] as Param<C>).value;
  }
}

mixin Mate<T> {
  late final Params<T> mateParams;
}

mixin WidgetMate<T> on Widget implements Mate<T> {
  @override
  late final Params<T> mateParams;
}

class A with Mate<String> {}

abstract class Editor<T> {
  final String name;
  final T init;
  Editor({required this.name, required this.init});
}
