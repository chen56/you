import 'package:code_builder/code_builder.dart' as code;
import 'package:dart_style/dart_style.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:note/src/buildin_editors.dart';
import 'package:note/utils.dart' as utils;

final defaultEmitter = code.DartEmitter(allocator: code.Allocator(), useNullSafetySyntax: true);

// 一般以80个字符为编辑器宽度
final defaultDartFormatter = DartFormatter(
  pageWidth: 80,
);

abstract class Param<T> extends ChangeNotifier {
  final String name;
  final T init;
  final Param? _parent;
  final dynamic defaultValue;
  final bool nullable;
  final bool isNamed;
  final Editors editors;
  final BuilderArg builderArg;
  T _value;

  Param({
    required this.builderArg,
    required this.name,
    required this.init,
    Param? parent,
    required this.nullable,
    required this.isNamed,
    this.defaultValue,
    required this.editors,
  })  : _value = init,
        _parent = parent;

  T get value => _value;

  set value(T newValue) {
    if (newValue == null && !nullable) return;

    _value = newValue;
    notifyListeners();
  }

  void setValue(Object? newValue) {
    if (newValue == null) {
      assert(nullable, "nullable=$nullable, null value can set null");
      if (newValue == null && !nullable) return;
    }
  }

  /// 是否是一个可见的参数
  /// Mate中的null参数 或 缺省参数，不需要表现到代码中
  bool get isShow => init != null && init != defaultValue;

  @override
  void notifyListeners() {
    super.notifyListeners();
    _parent?.notifyListeners();
  }

  T build();

  bool get isNullable => nullable;

  bool get isValue => this is ValueParam;

  bool get isObject => this is ObjectParam;

  bool get isList => this is ListParam;

  Iterable<Param> get children;

  String get displayName {
    if (isRoot && this is ObjectParam) {
      var toThis = this as ObjectParam;
      return "${toThis.builderRefer.symbol}";
    }
    return name;
  }

  @override
  String toString() {
    return "$runtimeType:${init.runtimeType}:$path";
  }

  bool get isLeaf => children.isEmpty;

  int get level => isRoot ? 0 : _parent!.level + 1;

  int levelTo(Param parent) => this.level - parent.level;

  Param? get parent => _parent;

  List<Param> get parents => isRoot ? [this] : [this, ..._parent!.parents];

  bool get isRoot => _parent == null;

  Param get root => isRoot ? this : _parent!.root;

  String get path {
    if (isRoot) return "/";
    var parentPath = _parent!.path;
    return parentPath == "/" ? "/$name" : "$parentPath/$name";
  }

  Iterable<Param> flat({
    bool includeThis = true,
    bool Function(Param element)? test,
  }) {
    return [this, ...children.where(test ?? (e) => true).expand((e) => e.flat(test: test))];
  }

  @nonVirtual
  code.Expression toCodeExpression({required Editors editors}) {
    return getEditor2().toCode();
  }

  @nonVirtual
  String toCodeExpressionString({
    bool format = false,
    required Editors editors,
  }) {
    var emitter_ = editors.emitter;
    var formatter_ = editors.formatter;

    var c = toCodeExpression(editors: editors);
    return format
        ? formatter_.formatStatement(c.statement.accept(emitter_).toString())
        : c.accept(emitter_).toString();
  }

  Widget nameWidget(BuildContext context, Editors editors) {
    return getEditor2().nameWidget(context);
  }

  valueWidget(BuildContext context, Editors editors) {
    return getEditor2().valueWidget(context);
  }

  @nonVirtual
  Editor getEditor2() {
    return builderArg.getEditor(this, editors);
  }
}

// dart3 switch patterns : use idea, click class name can not navigation to source
Param<T> _toParam<T>({
  required BuilderArg builderArg,
  required String name,
  required T init,
  required Param parent,
  required bool nullable,
  required bool isNamed,
  dynamic defaultValue,
  required Editors editors,
}) {
  if (utils.isType<T, List>()) {
    var result = ListParam<T>(
      name: name,
      init: init,
      builderArg: builderArg,
      parent: parent,
      nullable: nullable,
      isNamed: isNamed,
      defaultValue: defaultValue,
      editors: editors,
    );

    return result;
  }
  // if (init is Param<T>) return init;

  if (init is Mate) {
    return ObjectParam._fromMate(
      name,
      init,
      builderArg: builderArg,
      parent: parent,
      isNamed: isNamed,
      nullable: nullable,
      defaultValue: defaultValue,
      editors: editors,
    );
  }

  return ValueParam<T>(
    name: name,
    init: init,
    builderArg: builderArg,
    parent: parent,
    nullable: nullable,
    isNamed: isNamed,
    defaultValue: defaultValue,
    editors: editors,
  );
}

class ValueParam<T> extends Param<T> {
  ValueParam({
    required super.builderArg,
    required super.name,
    required super.init,
    required Param parent,
    required super.nullable,
    required super.isNamed,
    super.defaultValue,
    required super.editors,
  }) : super(parent: parent);

  @override
  T build() => _value;

  @override
  Iterable<Param> get children => List.empty();
}

class ListParam<T> extends Param<T> {
  final List<Param> params = List.empty(growable: true);

  ListParam({
    required super.name,
    required super.init,
    required super.builderArg,
    required Param parent,
    required super.isNamed,
    required super.nullable,
    super.defaultValue,
    required super.editors,
  }) : super(parent: parent) {
    if (init != null) {
      List notNull = init as List;
      for (int i = 0; i < notNull.length; i++) {
        assert(notNull[i] != null, "list element [$i] should not be null init: $init");
        params.add(_toParam(
          builderArg: BuilderArg(name: name, init: init, isNamed: isNamed, isFromUse: false),
          name: "$i",
          init: notNull[i],
          parent: this,
          nullable: false,
          isNamed: false,
          editors: editors,
        ));
      }
    }
  }

  @override
  T build() {
    if (init == null) return null as T;

    // 直接返回map后的list会转型错误：🔔⚠️❗️💡👉
    //     exception : return params.map((e)=>e.build()).toList() as T
    // 可以利用init的原始类型复制出来做基础，再转型就不会错了。
    return utils.castList<T>(from: params.map((e) => e.build()), to: init as List);
  }

  @override
  Iterable<Param> get children => params;
}

class ObjectParam<T> extends Param<T> {
  final Map<String, Param> _params = {};
  final Object Function(ObjectParam param) builder;
  final code.Reference builderRefer;

  ObjectParam._({
    required super.name,
    required super.init,
    required super.builderArg,
    super.parent,
    required this.builder,
    required Map<String, BuilderArg> args,
    required this.builderRefer,
    required super.nullable,
    required super.isNamed,
    super.defaultValue,
    required super.editors,
  }) {
    _params.addAll(
        args.map((key, value) => MapEntry(key, value.toParam(parent: this, editors: editors))));
  }

  Map<String, Param> get params => _params;

  ObjectParam.rootFromMate(Mate init, {required Editors editors})
      : this._fromMate(
          //根对象无name
          "",
          init,
          builderArg: BuilderArg(name: "", init: init, isNamed: false, isFromUse: false),
          nullable: false,
          isNamed: false,
          editors: editors,
        );

  ObjectParam.root({required Editors editors})
      : this._(
          //根对象无name
          name: "",
          init: "root" as T,
          builderArg: BuilderArg(name: "", init: "", isNamed: false, isFromUse: false),
          args: {},
          nullable: false,
          isNamed: false,
          //暂时没想好这个咋弄
          builder: (s) => "root",
          //根对象
          builderRefer: code.refer("ObjectParam", "package:note/mate.dart"),
          editors: editors,
        );

  ObjectParam._fromMate(
    String name,
    Mate init, {
    required BuilderArg builderArg,
    Param? parent,
    required bool nullable,
    required bool isNamed,
    required Editors editors,
    dynamic defaultValue,
  }) : this._(
          name: name,
          init: init as T,
          builderArg: builderArg,
          parent: parent,
          builder: init.mateBuilder,
          args: init._mateParams,
          nullable: nullable,
          isNamed: isNamed,
          builderRefer: code.refer(init.mateBuilderName, init.matePackageUrl),
          defaultValue: defaultValue,
          editors: editors,
        );

  Param<E> use<E>(
    String name,
    E init, {
    bool isNamed = true,
    dynamic defaultValue,
  }) {
    var param = _toParam<E>(
      builderArg: BuilderArg(name: name, init: init, isNamed: isNamed, isFromUse: true),
      name: name,
      init: init,
      parent: this,
      nullable: utils.isNullableOf<E>(init),
      isNamed: isNamed,
      defaultValue: defaultValue,
      editors: editors,
    );
    _params[name] = param;
    return param;
  }

  Param<E> get<E>(String name) {
    return _params[name] as Param<E>;
  }

  @override
  T build() => builder(this) as T;

  @override
  Iterable<Param> get children => _params.values;

  /// 为编辑器提供完整的代码
  String toSampleCodeString({
    bool snippet = true,
    bool format = false,
    Editors? editors,
  }) {
    var editors_ = editors ?? Editors();

    var emitter = editors_.emitter;
    var formatter = editors_.formatter;

    var mateExpression = toCodeExpression(editors: editors_);
    var runApp = code.refer("runApp", "package:flutter/material.dart");
    var c = snippet
        ? mateExpression.statement
        : code.Library((e) => e
          ..body.add(code.Method((b) => b
            ..name = "main"
            ..body = runApp.call([mateExpression]).code).closure.statement));
    String result = c.accept(emitter).toString();
    if (format) {
      result = snippet ? formatter.formatStatement(result) : formatter.format(result);
    }
    return result;
  }
}

/// what use of BuilderArg class:
/// - hold arg type T
/// - mateUse use/get interface
/// this class is a transition state of the parameter tree
class BuilderArg<T> {
  final String name;
  final bool isNamed;
  final Object? defaultValue;
  final T init;
  late final bool nullable;

  /// is create from [ObjectParam.use] or [Mate.mateUse]
  /// if create by use , <T> is known
  final bool isFromUse;

  BuilderArg({
    required this.name,
    required this.init,
    required this.isNamed,
    required this.isFromUse,
    this.defaultValue,
  }) {
    nullable = utils.isNullable<T>();
  }

  Param<T> toParam({required Param parent, required Editors editors}) {
    return _toParam(
      builderArg: this,
      name: name,
      init: init,
      parent: parent,
      nullable: nullable,
      isNamed: isNamed,
      defaultValue: defaultValue,
      editors: editors,
    );
  }

  Editor getEditor(Param param, Editors editors) {
    return editors.get<T>(param);
  }
}

mixin Mate {
  final Map<String, BuilderArg> _mateParams = {};
  late final Object Function(ObjectParam param) mateBuilder;
  late final String mateBuilderName;
  late final String matePackageUrl;

  BuilderArg<V> mateUse<V>(
    String name,
    V init, {
    required bool isNamed,
    dynamic defaultValue,
  }) {
    var param = BuilderArg(
      name: name,
      init: init,
      isFromUse: true,
      isNamed: isNamed,
      defaultValue: defaultValue,
    );

    _mateParams[name] = param;
    return param;
  }

  BuilderArg<C> mateGet<C>(String name) {
    return _mateParams[name] as BuilderArg<C>;
  }

  ObjectParam<T> toRootParam<T>({required Editors editors}) {
    return ObjectParam.rootFromMate(this, editors: editors);
  }
}

abstract class Editor {
  final Editors editors;
  final code.DartEmitter emitter;
  final DartFormatter formatter;

  Editor({required this.editors})
      : emitter = editors.emitter,
        formatter = editors.formatter;

  @nonVirtual
  Widget nameWidget(BuildContext context) {
    if (param._parent is ListParam && param is ObjectParam) {
      return Text("${(param as ObjectParam).builderRefer.symbol}");
    }
    return Text("${param.displayName}${param.isRoot ? '' : ': '} ");
  }

  Param get param;

  Widget valueWidget(BuildContext context) {
    return const Text("");
  }

  code.Expression toCode();

  /// sub class should not override
  @nonVirtual
  String toCodeString({format = false}) {
    var c = toCode();
    // 如果要格式化，转成statement以使其不报错
    return format
        ? formatter.formatStatement(c.statement.accept(emitter).toString())
        : c.accept(emitter).toString();
  }
}

typedef EditorBuilder<T> = Editor Function(Param param);

class Editors {
  final EnumRegister enumRegister;
  final code.DartEmitter emitter;
  final DartFormatter formatter;

  Editors({
    EnumRegister? enumRegister,
    code.DartEmitter? emitter,
    DartFormatter? formatter,
  })  : enumRegister = enumRegister ?? EnumRegister(),
        emitter = emitter ?? defaultEmitter,
        formatter = formatter ?? defaultDartFormatter;

  /// <T> There are two situations:
  /// 1. if the parameter comes from [ObjectParam.use] or [Mate.mateUse],
  ///   it has a strongly typed value
  /// 2. otherwise <T> is dynamic type.
  /// When querying the corresponding Editor, these two situations will be handled
  Editor get<T>(Param param, {EditorBuilder<T>? onNotFound}) {
    // 20230401 dart2js compile error: can not use patterns.
    // flutter build web --enable-experiment=records,patterns --release --web-renderer html --base-href "/note/"
    // --------------------------------------------------
    // Error: Expected an identifier, but got 'switch'.
    // var isPrimary = switch (color) {
    // ^^^^^^
    // --------------------------------------------------
    // var xx = switch (T) {
    // int => IntEditor(param, editors: this),
    // _ => onNotFound != null ? onNotFound(param) : DefaultValueParamEditor(param, editors: this)
    // };
    // return xx;
    if (param is ObjectParam) {
      return ObjectParamEditor(param, editors: this);
    }
    if (param is ListParam) {
      return ListParamEditor(param, editors: this);
    }

    param as ValueParam;
    if (utils.isType<T, int>() || param.init is int) {
      return IntEditor(param, editors: this);
    }
    if (utils.isType<T, double>() || param.init is double) {
      return DoubleEditor(param, editors: this);
    }
    if (utils.isType<T, bool>() || param.init is bool) {
      return BoolEditor(param, editors: this);
    }
    if (utils.isType<T, String>() || param.init is String) {
      return StringEditor(param, editors: this);
    }
    if (utils.isType<T, Color>() || param.init is Color) {
      return ColorEditor(param, editors: this);
    }
    if (utils.isType<T, Enum>() || param.init is Enum) {
      return EnumEditor(param, editors: this, enums: enumRegister.getOrEmpty(T));
    }

    if (utils.isType<T, void Function()>() || param.init is void Function()) {
      var ex = code.Method((b) => b
        ..name = ''
        ..lambda = false
        ..body = const code.Code("")).closure;
      return ManuallyValueEditor(param, editors: this, codeExpression: ex);
    }

    return onNotFound != null ? onNotFound(param) : DefaultValueParamEditor(param, editors: this);
  }
}

class EnumRegister {
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

  List getOrEmpty(Type type) {
    return !enums.containsKey(type) ? [] : enums[type]!;
  }

  void operator []=(Type key, List value) {
    enums[key] = value;
  }

  void register<T>(List<T> values) {
    enums[T] = values;
    register_<T?>(values);
  }

  void register_<T>(List<T> values) {
    enums[T] = values;
  }
}

/// 代码生成
main() {
  // ignore: avoid_print
  // print(Enums._instance.enums[MainAxisAlignment.start.runtimeType]);
}
