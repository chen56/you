import 'dart:collection';

import 'package:code_builder/code_builder.dart' as code;
import 'package:dart_style/dart_style.dart';
import 'package:flutter/material.dart';
import 'package:note/src/mate_color.dart';
import 'package:note/utils.dart' as utils;

abstract class Param<T> extends ChangeNotifier {
  String name;
  Param? parent;
  final T init;
  // fixme 这个nullable是否可以改成isOptional
  final bool nullable;
  final bool isNamed;
  T _value;

  T get value => _value;

  set value(T newValue) {
    if (newValue == null && !nullable) return;

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
    this.isNamed = false,
  }) : _value = init;

  bool get isNullable => nullable;

  bool get isValue => this is ValueParam;

  bool get isObject => this is ObjectParam;

  bool get isList => this is ListParam;

  Iterable<Param> get children;

  //fixme release模式下 runtimeType被混淆了
  String get displayName {
    if (isRoot) return "${init.runtimeType}".replaceAll("\$Mate", "");
    return name;
  }

  @override
  String toString() {
    return "$runtimeType:${init.runtimeType}:$path";
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

  code.Expression toCodeExpression({required Editors editors});
}

// dart3 switch patterns : use idea, click class name can not navigation to source
Param<T> _toSingleParam<T>({
  required String name,
  required T init,
  required bool nullable,
  required bool isNamed,
}) {
  assert(!(utils.isSubtype<List, T>() || utils.isSubtype<List?, T>()),
      "list use useList() : init:$init");

  if (init is Param<T>) return init;

  if (init is Mate) {
    return ObjectParam<T>(
      name: name,
      init: init,
      paramMap: init._mateParams,
      builder: init.mateBuilder,
      builderRefer: code.refer(init.mateCreateName, init.matePackageUrl),
      nullable: nullable,
      isNamed: isNamed,
    );
  }
  return ValueParam<T>(
    name: name,
    init: init,
    nullable: nullable,
    isNamed: isNamed,
  );
}

ListParam<E> _toListParam<E>({
  required String name,
  required List<E>? init,
  required bool isNamed,
}) {
  List<E> notNull = init ?? [];
  List<Param<E>> params = [];
  for (int i = 0; i < notNull.length; i++) {
    params.add(_toSingleParam(
      name: "[$i]",
      init: notNull[i],
      nullable: true,
      isNamed: isNamed,
    ));
  }
  return ListParam<E>(name: name, init: notNull, params: params);
}

class ValueParam<T> extends Param<T> {
  ValueParam({
    super.name,
    required super.init,
    super.nullable,
    super.isNamed,
  });

  @override
  T build() => _value;

  @override
  Iterable<Param> get children => List.empty();

  @override
  code.Expression toCodeExpression({required Editors editors}) {
    return code.literal(value, onError: (o) {
      if (o is Enum) {
        return code.refer("$o");
      }
      if (o is Color) {
        return ColorRegister.instance.get(o);
      }

      return code.refer("$o");
    });
  }
}

class ListParam<E> extends Param<List<E>> {
  late final List<Param<E>> params;

  ListParam({
    super.name,
    required super.init,
    required this.params,
    super.isNamed,
  }) : super(nullable: false) {
    for (var e in params) {
      e.parent = this;
    }
  }

  @override
  List<E> build() => params.map((e) => e.build()).toList();

  @override
  Iterable<Param<E>> get children => params;

  @override
  code.Expression toCodeExpression({required Editors editors}) {
    return code.literalList(children.map((e) => e.toCodeExpression(editors: editors)));
  }
}

class ObjectParam<T> extends Param<T> {
  final Map<String, Param> _paramMap;
  late final Object Function(ObjectParam param) builder;
  final code.Reference builderRefer;
  ObjectParam({
    super.name,
    required super.init,
    required this.builder,
    Map<String, Param>? paramMap,
    required this.builderRefer,
    super.nullable,
    super.isNamed,
  }) : _paramMap = paramMap ?? {} {
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
          init: mate as T,
          builder: mate.mateBuilder,
          paramMap: mate._mateParams,
          nullable: false, //根对象
          builderRefer: code.refer(mate.mateCreateName, mate.matePackageUrl),
        );

  Param<E> use<E>(
    String name,
    E init, {
    bool isNamed = true,
    dynamic defaultValue,
  }) {
    var param = _toSingleParam<E>(
      name: name,
      nullable: utils.isNullableOf<E>(init),
      init: init,
      isNamed: isNamed,
    );
    _paramMap[name] = param;
    return param;
  }

  /// 为简化list参数，不按原可空与否处理，而统一为：
  /// - 进来的init为可空List<E>?
  /// - 出去的返回值为非空List<E>
  ListParam<E> useList<E>(
    String name,
    List<E>? init, {
    bool isNamed = true,
    dynamic defaultValue,
  }) {
    var param = _toListParam(
      name: name,
      init: init,
      isNamed: isNamed,
    );
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

  String toSampleCodeString({
    bool snippet = true,
    code.DartEmitter? emitter,
    DartFormatter? formatter,
    Editors? editors,
  }) {
    var emitter_ =
        emitter ?? code.DartEmitter(allocator: code.Allocator(), useNullSafetySyntax: true);
    // 一般以80个字符为编辑器宽度
    var formatter_ = formatter ??
        DartFormatter(
          pageWidth: 80,
        );
    String result = toSampleCode(snippet: snippet, editors: editors).accept(emitter_).toString();
    result = snippet ? formatter_.formatStatement(result) : formatter_.format(result);
    return result;
  }

  // fixme 位置参数和命名参数要分离,不然生成的代码都是命名参数了
  /// 转换成完整的范例代码
  code.Spec toSampleCode({
    bool snippet = true,
    Editors? editors,
  }) {
    var editors_ = editors ?? Editors();

    if (snippet) {
      return toCodeExpression(editors: editors_).statement;
    }
    code.Library lib = code.Library((e) => e
      ..body.add(code.Method((b) => b
        ..name = "main"
        ..body = code
            .refer("runApp", "package:flutter/material.dart")
            .call([toCodeExpression(editors: editors_)]).code).closure.statement));
    return lib;
  }

  @override
  code.Expression toCodeExpression({required Editors editors}) {
    var filtered = _paramMap.entries.where((e) => e.value.init != null);

    var positionalArguments = filtered
        .where((e) => !e.value.isNamed)
        .map((e) => e.value.toCodeExpression(editors: editors));
    var namedArguments = Map.fromEntries(filtered
        .where((e) => e.value.isNamed)
        .map((e) => MapEntry(e.key, e.value.toCodeExpression(editors: editors))));
    return builderRefer.call(positionalArguments, namedArguments);
  }
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
      alignment: Alignment.topLeft,
      value: param.value as Enum,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      onChanged: (Enum? value) {
        param.value = value;
      },
      items: enums
          .getOrEmpty(param.value.runtimeType)
          .map((e) => e as Enum)
          .map<DropdownMenuItem<Enum>>((Enum value) {
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
  late final String mateCreateName;
  late final String matePackageUrl;

  Param<V> mateUse<V>(
    String name,
    V init, {
    required bool isNamed,
    dynamic defaultValue,
  }) {
    var param = _toSingleParam(
        name: name, nullable: utils.isNullableOf<V>(init), init: init, isNamed: isNamed);
    _mateParams[name] = param;
    return param;
  }

  /// 为简化list参数，不按原可空与否处理，而统一为：
  /// - 进来的init为可空List<E>?
  /// - 出去的返回值为非空List<E>
  Param<List<E>> mateUseList<E>(
    String name,
    List<E>? init, {
    required bool isNamed,
    dynamic defaultValue,
  }) {
    var param = _toListParam(
      name: name,
      init: init,
      isNamed: isNamed,
    );
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
  final EnumRegister enumRegister;
  Editors({EnumRegister? enumRegister}) : enumRegister = enumRegister ?? EnumRegister();

  Editor _getEditor(Param param) {
    if (param.init is double) return DoubleEditor();
    if (param.init is Enum) return EnumEditor(enums: enumRegister);
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

class EnumRegister extends MapBase<Type, List> {
  @protected
  final Map<Type, List> enums = {};

  EnumRegister({Map<Type, List>? enums}) {
    if (enums != null) {
      enums.addAll(enums);
    }
  }
  EnumRegister.list(List<EnumRegister> registers) {
    for (var e in registers) {
      enums.addAll(e.enums);
    }
  }

  List getOrEmpty(Type type) => !enums.containsKey(type) ? [] : enums[type]!;

  @override
  List? operator [](Object? key) {
    return enums[key];
  }

  @override
  void operator []=(Type key, List value) {
    enums[key] = value;
  }

  @override
  void clear() {
    enums.clear();
  }

  @override
  Iterable<Type> get keys => enums.keys;

  @override
  List? remove(Object? key) {
    return enums.remove(key);
  }
}

/// 代码生成
main() {
  // ignore: avoid_print
  // print(Enums._instance.enums[MainAxisAlignment.start.runtimeType]);
}
