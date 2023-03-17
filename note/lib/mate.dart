import 'package:flutter/material.dart';
import 'package:note/utils.dart' as utils;
import 'package:note/utils.dart';

abstract class Param<T> {
  Param? parent;
  final T init;
  T _value;

  T get value => _value;
  // todo 临时产物，待删除
  set value(T newValue) {
    _value = newValue;
  }

  Param({required this.init}) : _value = init;

  bool get isNullable => utils.isNullable<T>();

  factory Param.newValue({required init}) {
    return ValueParam(init: init);
  }

  bool get isValue => this is ValueParam;

  bool get isObject => this is ObjectParam;

  bool get isList => this is ListParam;

  Iterable<ParamNode> _childrenNodes(ParamNode parent);
}

// dart3 switch patterns : use idea, click class name can not navigation to source
Param<C> _convertUseDart3Patterns<C>(C init) {
  if (init is List) throw Exception("List type please use putList()");
  if (init is Mate<C>) return ObjectParam.copy(init.mateParams);
  if (init is Param) return init as Param<C>;
  return Param.newValue(init: init);

  // flutter build fail:
  // Target dart2js failed: Exception: ../note/lib/mate.dart:31:10:
  // Error: Expected an identifier, but got 'switch'.
  // return switch (init) {
  //   /// Mate 不直接 return [Mate.mateParams] 而复制一份ObjectParam的原因是 C可能是可空类型，而Mate.mateParams不是
  //   List() => throw Exception("List type please use putList()"),
  //   Mate<C>() => ObjectParam.copy(init.mateParams),
  //   Param() => init as Param<C>,
  //   _ => Param.newValue(init: init),
  // };
}

// ignore: unused_element
Param<C> _convertUseDart2<C>(C init) {
  if (init is Param) return init as Param<C>;
  if (isSubtype<Mate, C>()) return (init as Mate<C>).mateParams;
  return ValueParam(init: init);
}

class ValueParam<T> extends Param<T> {
  ValueParam({required super.init});

  @override
  Iterable<ParamNode> _childrenNodes(ParamNode parent) => List.empty();
}

class ListParam<T, E> extends Param<T> {
  late List<Param<E>> params;

  ListParam({required super.init}) {
    if (init != null) {
      params = (init as List<E>).map((e) => _convertUseDart3Patterns(e)).toList(growable: true);
    }
  }

  int get length => params.length;

  List<E> toValueList() {
    return params.map((e) => e.value).toList();
  }

  @override
  Iterable<ParamNode> _childrenNodes(ParamNode parent) {
    int i = 0;
    return params.map((e) => ParamNode._(name: "${i++}", param: e, parent: parent));
  }
}

class ObjectParam<T> extends Param<T> {
  final Map<String, Param> _paramMap = {};
  late final T Function(ObjectParam<T> mate) builder;

  ObjectParam({required super.init, required this.builder});

  ObjectParam.copy(ObjectParam<T> other) : super(init: other.init) {
    builder = (mate) => other.builder(mate);
    _paramMap.addAll(other._paramMap);
  }

  /// switch(init) :
  /// - value is Mate       => return [Mate.mateParams]
  /// - value is atom value => return new [ValueParam]
  /// - value is null       => return new [ValueParam]
  /// - value is List       => throw Error, please use [putList]
  /// - others              => return new [ValueParam]
  /// generic V : value type
  Param<V> put<V>(String name, V init) {
    _checkName(name);
    var param = _convertUseDart3Patterns(init);
    param.parent = this;
    _paramMap[name] = param;
    return param;
  }

  /// generic V : list type
  /// generic E : list element type
  Param<V> putList<V, E>(String name, V init) {
    _checkName(name);
    Param<V> param = ListParam<V, E>(init: init);
    param.parent = this;
    _paramMap[name] = param;
    return param;
  }

  void _checkName(String name) {
    assert(
        !_paramMap.containsKey(name), "error:duplicate param name: $name , old:${_paramMap[name]}");
  }

  Param<C> get<C>(String name) {
    return _paramMap[name] as Param<C>;
  }

  ParamNode toParamNode() {
    return ParamNode._root(name: "", param: this);
  }

  List<ParamNode> toList({bool Function(ParamNode element)? test}) {
    return toParamNode().toList(test: test);
  }

  @override
  Iterable<ParamNode> _childrenNodes(ParamNode parent) =>
      _paramMap.entries.map((e) => ParamNode._(name: e.key, param: e.value, parent: parent));
}

// tree node
class ParamNode {
  final String name;
  final Param param;
  final ParamNode? parent;
  late final Iterable<ParamNode> _children;
  final Map<String, Object> attributes = {};

  ParamNode._({required this.name, required this.param, required ParamNode this.parent}) {
    _children = param._childrenNodes(this);
  }
  ParamNode._root({required this.name, required this.param}) : parent = null {
    _children = param._childrenNodes(this);
  }

  String get displayName {
    if (isRoot) return "root";
    return name;
  }

  @override
  String toString() {
    return path;
  }

  List<ParamNode> toList({bool Function(ParamNode element)? test}) {
    return [this, ..._children.where(test ?? (e) => true).expand((e) => e.toList(test: test))];
  }

  bool get isLeaf => _children.isEmpty;

  int get level => isRoot ? 0 : parent!.level + 1;

  int levelTo(ParamNode parent) => this.level - parent.level;

  List<ParamNode> get parents => isRoot ? [this] : [this, ...parent!.parents];

  bool get isRoot => parent == null;

  ParamNode get root => isRoot ? this : parent!.root;

  String get path {
    if (isRoot) return "/";
    var parentPath = parent!.path;
    return parentPath == "/" ? "/$name" : "$parentPath/$name";
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
