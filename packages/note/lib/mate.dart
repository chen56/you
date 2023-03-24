import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:note/utils.dart' as utils;

abstract class Param<T> extends ChangeNotifier {
  String name;
  Param? parent;
  final dynamic init;
  final bool nullable;
  T _value;

  T get value => _value;

  set value(T newValue) {
    _value = newValue;
    notifyListeners();
  }

  @override
  void notifyListeners() {
    super.notifyListeners();
    parent?.notifyListeners();
  }

  T build();

  Param({
    this.name = "",
    required this.init,
    this.nullable = false,
  }) : _value = init;

  bool get isNullable => nullable;

  bool get isValue => this is ValueParam;

  bool get isObject => this is ObjectParam;

  bool get isList => this is ListParam;

  Iterable<Param> get children;

  //todo release模式下 runtimeType被混淆了
  String get displayName {
    if (isRoot) return "${init.runtimeType}".replaceAll("\$Mate", "");
    return name;
  }

  @override
  String toString() {
    return path;
  }

  bool get isLeaf => children.isEmpty;

  int get level => isRoot ? 0 : parent!.level + 1;

  int levelTo(Param parent) => this.level - parent.level;

  List<Param> get parents => isRoot ? [this] : [this, ...parent!.parents];

  bool get isRoot => parent == null;

  Param get root => isRoot ? this : parent!.root;

  String get path {
    if (isRoot) return "/";
    var parentPath = parent!.path;
    return parentPath == "/" ? "/$name" : "$parentPath/$name";
  }

  Iterable<Param> flat({
    bool includeThis = true,
    bool Function(Param element)? test,
  }) {
    return [this, ...children.where(test ?? (e) => true).expand((e) => e.flat(test: test))];
  }
}

// dart3 switch patterns : use idea, click class name can not navigation to source
Param<T> _convertToParam<T>({
  required String name,
  required T init,
  required bool nullable,
}) {
  if (init is Param<T>) return init;

  if (init is Mate) {
    return ObjectParam<T>(
        name: name,
        init: init,
        paramMap: init._mateParams,
        nullable: nullable,
        builder: init.mateBuilder);
  }

  if (utils.isSubtype<List, T>() || utils.isSubtype<List?, T>()) {
    List<Param> params = [];
    if (!nullable) {
      init as List;
      for (int i = 0; i < init.length; i++) {
        params.add(_convertToParam(name: "[$i]", init: init[i], nullable: nullable));
      }
    }
    return ListParam(name: name, init: init, nullable: nullable, params: params);
  }

  return ValueParam(name: name, init: init, nullable: nullable);
}

class ValueParam<T> extends Param<T> {
  ValueParam({
    super.name,
    required super.init,
    super.nullable,
  });

  @override
  T build() => _value;

  @override
  Iterable<Param> get children => List.empty();
}

class ListParam<T> extends Param<T> {
  late List<Param> params;

  ListParam({
    super.name,
    required super.init,
    required this.params,
    super.nullable,
  }) {
    for (var e in params) {
      e.parent = this;
    }
  }

  @override
  T build() => params.map((e) => e.build()).toList() as T;

  @override
  Iterable<Param> get children => params;
}

class ObjectParam<T> extends Param<T> {
  final Map<String, Param> _paramMap;
  late final Object Function(ObjectParam param) builder;

  ObjectParam({
    super.name,
    required super.init,
    required this.builder,
    Map<String, Param>? paramMap,
    super.nullable,
  }) : _paramMap = paramMap == null ? {} : paramMap {
    _paramMap.forEach((key, value) {
      value.parent = this;
    });
  }

  // ObjectParam.copy(ObjectParam other)
  //     : this(
  //         name: other.name,
  //         init: other.init,
  //         nullable: other.nullable,
  //         paramMap: other._paramMap.map(
  //           (key, value) => MapEntry(
  //             key,
  //             _convertToParam(
  //               name: key,
  //               init: value.init,
  //               nullable: value.nullable,
  //             ),
  //           ),
  //         ),
  //         builder: other.builder,
  //       );

  ObjectParam.rootFrom(Mate mate)
      : this(
          name: "root",
          //根对象无name
          init: mate,
          builder: mate.mateBuilder,
          paramMap: mate._mateParams,
          nullable: false, //根对象
        );

  Param<E> declare<E>(String name, E init) {
    var param = _convertToParam<E>(name: name, nullable: utils.isNullableOf<E>(init), init: init);
    _paramMap[name] = param;
    return param;
  }

  Param<E> get<E>(String name) {
    return _paramMap[name] as Param<E>;
  }

  @override
  T build() => builder(this) as T;

  @override
  Iterable<Param> get children => _paramMap.values;
}

class DoubleEditor extends Editor<double> {
  DoubleEditor();

  @override
  Widget valueWidget(BuildContext context, Param param) {
    return TextFormField(
      initialValue: "${param.init}",
      autofocus: true,
      decoration: const InputDecoration(
        hintText: "Text#data",
      ),
      onChanged: (value) {
        var newValue = double.tryParse(value);
        if (newValue != null) {
          param.value = newValue;
        }
      },
    );
  }
}

class EnumEditor extends Editor {
  final EnumRegister enums;
  EnumEditor({required this.enums});

  @override
  Widget valueWidget(BuildContext context, Param param) {
    return DropdownButton<Enum>(
      onTap: () {
        print("onTap");
      },
      alignment: Alignment.topLeft,
      value: param.value,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      onChanged: (Enum? value) {
        param.value = value;
      },
      items: enums.getOrEmpty(param.value.runtimeType).map<DropdownMenuItem<Enum>>((Enum value) {
        return DropdownMenuItem<Enum>(
          value: value,
          child: Text(value.name),
        );
      }).toList(),
    );
  }
}

class ReadonlyEditor extends Editor<double> {
  ReadonlyEditor();
}

mixin Mate {
  final Map<String, Param> _mateParams = {};
  late final Object Function(ObjectParam param) mateBuilder;

  Param<V> matePut<V>(String name, V init) {
    var param = _convertToParam(name: name, nullable: utils.isNullableOf<V>(init), init: init);
    _mateParams[name] = param;
    return param;
  }

  Param<C> mateGet<C>(String name) {
    return _mateParams[name] as Param<C>;
  }
}

abstract class Editor<T> {
  Editor();

  Widget nameWidget(BuildContext context, Param param) {
    String type = "${param.init.runtimeType}".replaceAll("\$Mate", "");
    if (param.isRoot) return Text(type);
    if (param.isValue) {
      return Text("${param.name}:");
    } else {
      return Text("${param.name}: $type");
    }
  }

  Widget valueWidget(BuildContext context, Param param) {
    return const Text("");
    // return Text("${node.param.value.runtimeType}".replaceAll("\$Mate", ""));
  }
}

class Editors {
  final EnumRegister enums;
  Editors({required this.enums});

  Editor _getEditor(Param param) {
    if (param.init is double) return DoubleEditor();
    if (param.init is Enum) return EnumEditor(enums: enums);
    return ReadonlyEditor();
  }

  Widget nameWidget(BuildContext context, Param param) {
    return Container(
      padding: EdgeInsets.only(left: param.level * 15),
      child: _getEditor(param).nameWidget(context, param),
    );
  }

  Widget valueWidget(BuildContext context, Param param) {
    return _getEditor(param).valueWidget(context, param);
  }
}

class EnumRegister extends MapBase<Type, List<Enum>> {
  @protected
  final Map<Type, List<Enum>> enums = {};

  EnumRegister();
  EnumRegister.list(List<EnumRegister> registers) {
    for (var e in registers) {
      enums.addAll(e.enums);
    }
  }

  List<Enum> getOrEmpty(Type type) => !enums.containsKey(type) ? [] : enums[type]!;

  @override
  List<Enum>? operator [](Object? key) {
    return enums[key];
  }

  @override
  void operator []=(Type key, List<Enum> value) {
    enums[key] = value;
  }

  @override
  void clear() {
    enums.clear();
  }

  @override
  Iterable<Type> get keys => enums.keys;

  @override
  List<Enum>? remove(Object? key) {
    return enums.remove(key);
  }
}

main() {
  // ignore: avoid_print
  // print(Enums._instance.enums[MainAxisAlignment.start.runtimeType]);
}
