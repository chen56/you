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
  String name;
  Param? parent;
  final T init;
  final dynamic defaultValue;
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
    parent?.notifyListeners();
  }

  T build();

  Param({
    this.name = "",
    required this.init,
    this.nullable = false,
    this.isNamed = false,
    this.defaultValue,
  }) : _value = init;

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

  @nonVirtual
  code.Expression toCodeExpression({required Editors editors}) {
    return getEditor(editors).toCode();
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
    return getEditor(editors).nameWidget(context);
  }

  valueWidget(BuildContext context, Editors editors) {
    return getEditor(editors).valueWidget(context);
  }

  Editor getEditor(Editors editors);
}

// dart3 switch patterns : use idea, click class name can not navigation to source
Param<T> _toSingleParam<T>({
  required String name,
  required T init,
  required bool nullable,
  required bool isNamed,
  dynamic defaultValue,
}) {
  assert(!(utils.isType<T, List>()), "list use useList() : init:$init");

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
      defaultValue: defaultValue,
    );
  }
  return ValueParam<T>(
    name: name,
    init: init,
    nullable: nullable,
    isNamed: isNamed,
    defaultValue: defaultValue,
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
      isNamed: false,
    ));
  }
  return ListParam<E>(
    name: name,
    init: notNull,
    params: params,
    isNamed: isNamed,
  );
}

class ValueParam<T> extends Param<T> {
  ValueParam({
    super.name,
    required super.init,
    super.nullable,
    super.isNamed,
    super.defaultValue,
  });

  @override
  T build() => _value;

  @override
  Iterable<Param> get children => List.empty();

  @override
  Editor getEditor(Editors editors) {
    return editors.get<T>(this);
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
  Editor getEditor(Editors editors) {
    return ListParamEditor(this, editors: editors);
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
    super.defaultValue,
  }) : _paramMap = paramMap ?? {} {
    _paramMap.forEach((key, value) {
      value.parent = this;
    });
  }

  ObjectParam.rootFrom(Mate mate)
      : this(
          name: "root",
          //根对象无name
          init: mate as T,
          builder: mate.mateBuilder,
          paramMap: mate._mateParams,
          nullable: false,
          //根对象
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
      defaultValue: defaultValue,
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

  @override
  Editor getEditor(Editors editors) {
    return ObjectParamEditor(this, editors: editors);
  }
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
      name: name,
      nullable: utils.isNullableOf<V>(init),
      init: init,
      isNamed: isNamed,
      defaultValue: defaultValue,
    );
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

  ObjectParam toObjectParam() {
    return ObjectParam.rootFrom(this);
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
    if (param.parent is ListParam && param is ObjectParam) {
      return Text("${0}->${(param as ObjectParam).builderRefer.symbol} ");
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

typedef EditorBuilder = Editor Function(Param param);

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

  Editor get<T>(ValueParam<T> param, {EditorBuilder? onNotFound}) {
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

    if (utils.isType<T, int>()) return IntEditor(param, editors: this);
    if (utils.isType<T, double>()) return DoubleEditor(param, editors: this);
    if (utils.isType<T, bool>()) return BoolEditor(param, editors: this);
    if (utils.isType<T, String>()) return StringEditor(param, editors: this);
    if (utils.isType<T, Color>()) return ColorEditor(param, editors: this);
    if (utils.isType<T, Enum>()) {
      return EnumEditor(param, editors: this, enums: enumRegister.getOrEmpty(T));
    }

    if (utils.isType<T, void Function()>()) {
      var ex = code.Method((b) => b
        ..name = ''
        ..lambda = false
        ..body = const code.Code("")).closure;
      return ManuallyValueEditor(param, editors: this, codeExpression: ex);
    }

    return onNotFound != null ? onNotFound(param) : DefaultValueParamEditor(param, editors: this);
  }
}

abstract class ValueParamEditor extends Editor {
  @override
  final ValueParam param;
  ValueParamEditor(this.param, {required super.editors});

  @override
  Widget valueWidget(BuildContext context) {
    return Text(
      toCodeString(),
    );
  }
}

class ObjectParamEditor extends Editor {
  @override
  final ObjectParam param;

  ObjectParamEditor(this.param, {required super.editors});

  @override
  code.Expression toCode() {
    var filtered = param._paramMap.entries.where((e) => e.value.isShow);

    var positionalArguments = filtered
        .where((e) => !e.value.isNamed)
        .map((e) => e.value.toCodeExpression(editors: editors));
    var namedArguments = Map.fromEntries(filtered
        .where((e) => e.value.isNamed)
        .map((e) => MapEntry(e.key, e.value.toCodeExpression(editors: editors))));
    return param.builderRefer.call(positionalArguments, namedArguments);
  }

  @override
  Widget valueWidget(BuildContext context) {
    return param.isRoot ? const Text("") : Text("${param.builderRefer.symbol}");
  }
}

class ListParamEditor extends Editor {
  @override
  final ListParam param;

  ListParamEditor(this.param, {required super.editors});

  @override
  code.Expression toCode() {
    return code.literalList(param.children.map((e) => e.toCodeExpression(editors: editors)));
  }
}

class ManuallyValueEditor extends ValueParamEditor {
  code.Expression codeExpression;
  ManuallyValueEditor(super.param, {required super.editors, required this.codeExpression});

  @override
  code.Expression toCode() {
    if (param.value == null) return code.literalNull;
    return codeExpression;
  }
}

class DefaultValueParamEditor extends ValueParamEditor {
  DefaultValueParamEditor(super.param, {required super.editors});

  @override
  code.Expression toCode() {
    return code.refer("${param.value}");
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
