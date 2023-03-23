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
    required this.name,
    required this.init,
    required this.nullable,
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

  Widget mainWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: level * 15),
      child: getEditor(this).nameWidget(context, this),
    );
  }

  Widget extWidget(BuildContext context) {
    return getEditor(this).valueWidget(context, this);
  }
}

// dart3 switch patterns : use idea, click class name can not navigation to source
Param<T> _convertToParam<T>({
  required String name,
  required T init,
  required bool nullable,
}) {
  // init.mateParams as ObjectParam<C> 转型的含义：
  // 某Mate比如Center$Mate中定义的是非空范型参数：ObjectParam<Center$Mate> mateParam
  // 而[convertToParam]返回值Param<C>的范型参数可能是可空的，比如ObjectParam<Center?>
  // 为什么会有这种差别，是因为定义 Center$Mate的时候，并不知道其[ObjectParam.value]是否能非空，
  // 直到在另一个构造器中使用时才知道。
  // ignore: unnecessary_cast
  if (init is Mate) {
    // var result2 = ObjectParam(
    //     init: init,
    //     // builder: (mate) => init.mateParams.builder(mate),
    //     paramMap: init.mateParams.map((key, value) => MapEntry(key, convertToParam(value))),
    //     nullable: false);
    // return result2;
  }

  if (init is List) {
    // return ListParam(
    //     init: init,
    //     // nullable: nullable,
    //     params: init == null
    //         ? []
    //         : (init as List).map((e) => convertToParam(e)).toList(growable: true));
  }
  if (init is Param<T>) return init;

  return ValueParam(name: name, init: init, nullable: false);

  // flutter build error - Flutter 3.9.0-1.0.pre.2 • channel beta
  // Target dart2js failed: Exception: Warning: The 'dart2js' entrypoint script is deprecated, please use 'dart compile js' instead.
  // ../note/lib/mate_old.dart:39:10:
  // Error: Expected an identifier, but got 'switch'.
  // return switch (init) {
  //   /// Mate 不直接 return [Mate.mateParams] 而复制一份ObjectParam的原因是 C可能是可空类型，而Mate.mateParams不是
  //   List() => throw Exception("List type please use putList()"),
  //   Mate<C>() => ObjectParam.copy(init.mateParams),
  //   Param() => init as Param<C>,
  //   _ => Param.newValue(init: init),
  // };
}

class ValueParam<T> extends Param<T> {
  ValueParam({required super.name, required super.init, required super.nullable});

  @override
  T build() => _value;

  @override
  Iterable<Param> get children => List.empty();
}

class ListParam<T> extends Param<T> {
  late List<Param> params;

  ListParam({
    required super.name,
    required super.init,
    required this.params,
    required super.nullable,
  });

  @override
  T build() => params.map((e) => e.build()).toList() as T;

  @override
  Iterable<Param> get children => params;
}

class ObjectParam<T> extends Param<T> {
  final Map<String, Param> _paramMap;
  late final Object Function(ObjectParam param) builder;

  ObjectParam({
    required super.name,
    required super.init,
    required this.builder,
    Map<String, Param>? paramMap,
    required super.nullable,
  }) : _paramMap = paramMap ?? {};

  ObjectParam.copy(ObjectParam other)
      : _paramMap = {},
        super(
          name: other.name,
          init: other.init,
          nullable: other.nullable,
        ) {
    // builder = (mate) => other.builder(mate);
    _paramMap.addAll(other._paramMap);
  }

  ObjectParam.rootFrom(Mate mate)
      : this(
          name: "root",
          //根对象无name
          init: mate,
          builder: (objectBuilder) => mate.mateBuilder(objectBuilder),
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

Editor getEditor(Param node) {
  if (node.init is double) return DoubleEditor();
  if (node.init is Enum) return EnumEditor();
  return ReadonlyEditor();
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
  EnumEditor();

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
      items: Enums.get(param.value.runtimeType).map<DropdownMenuItem<Enum>>((Enum value) {
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

class Editors {}

// todo 暂时这样，要用代码生成所有的枚举，并放到note_app里
class Enums {
  static final Enums _instance = Enums._();
  final Map<Type, List<Enum>> enums = {};

  Enums._() {
    enums[MainAxisAlignment] = MainAxisAlignment.values;
    enums[CrossAxisAlignment] = CrossAxisAlignment.values;
    enums[VerticalDirection] = VerticalDirection.values;
    enums[Clip] = Clip.values;
  }

  static Enums get instance => _instance;

  static List<Enum> get(Type type) {
    return !instance.enums.containsKey(type) ? [] : instance.enums[type]!;
  }
}

main() {
  // ignore: avoid_print
  print(Enums._instance.enums[MainAxisAlignment.start.runtimeType]);
}
