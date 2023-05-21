import 'package:code_builder/code_builder.dart' as code;
import 'package:dart_style/dart_style.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:note/src/buildin_editors.dart';
import 'package:note/utils.dart' as utils;

final defaultEmitter =
    code.DartEmitter(allocator: code.Allocator(), useNullSafetySyntax: true);

// 一般以80个字符为编辑器宽度
final defaultDartFormatter = DartFormatter(
  pageWidth: 80,
);

abstract class Param extends ChangeNotifier {
  final Param? _parent;
  final Editors editors;
  final BuilderArg builderArg;
  dynamic _value;

  Param({
    required this.builderArg,
    Param? parent,
    required this.editors,
  })  : _value = builderArg.init,
        _parent = parent {
    builderArg.param = this;
  }

  dynamic get value => _value;
  String get name => builderArg.name;
  dynamic get init => builderArg.init;
  bool get nullable => builderArg.nullable;
  bool get isNamed => builderArg.isNamed;
  dynamic get defaultValue => builderArg.defaultValue;

  set value(dynamic newValue) {
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

  dynamic build();

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
    return [
      this,
      ...children.where(test ?? (e) => true).expand((e) => e.flat(test: test))
    ];
  }

  @nonVirtual
  code.Expression toCodeExpression({required Editors editors}) {
    return getEditor().toCode();
  }

  @nonVirtual
  String toCodeExpressionString({
    bool format = false,
  }) {
    var emitter_ = editors.emitter;
    var formatter_ = editors.formatter;

    var c = toCodeExpression(editors: editors);
    return format
        ? formatter_.formatStatement(c.statement.accept(emitter_).toString())
        : c.accept(emitter_).toString();
  }

  Widget nameWidget(BuildContext context, Editors editors) {
    return getEditor().nameWidget(context);
  }

  valueWidget(BuildContext context, Editors editors) {
    return getEditor().valueWidget(context);
  }

  // todo editor 应该事先初始化好
  @nonVirtual
  Editor getEditor() {
    return editors.get(this);
  }

  @override
  String toString() {
    return "$runtimeType:${init.runtimeType}:$path";
  }
}

Param _toParam({
  required BuilderArg builderArg,
  required Param parent,
  required Editors editors,
}) {
  if (builderArg.isSubType<List>()) {
    var result = ListParam(
      builderArg: builderArg,
      parent: parent,
      editors: editors,
    );

    return result;
  }
  if (builderArg.isSubType<Set>()) {
    var result = SetParam(
      builderArg: builderArg,
      parent: parent,
      editors: editors,
    );

    return result;
  }
  // if (init is Param<T>) return init;

  if (builderArg.init is Mate) {
    return ObjectParam._fromMate(
      builderArg.init as Mate,
      builderArg: builderArg,
      parent: parent,
      editors: editors,
    );
  }

  return ValueParam(
    builderArg: builderArg,
    parent: parent,
    editors: editors,
  );
}

class ValueParam extends Param {
  ValueParam({
    required super.builderArg,
    required Param parent,
    required super.editors,
  }) : super(parent: parent);

  @override
  dynamic build() => _value;

  @override
  Iterable<Param> get children => List.empty();
}

class ListParam extends Param {
  final List<Param> params = List.empty(growable: true);

  ListParam({
    required super.builderArg,
    required Param parent,
    required super.editors,
  }) : super(parent: parent) {
    if (init != null) {
      List notNull = init as List;
      for (int i = 0; i < notNull.length; i++) {
        assert(notNull[i] != null,
            "list element [$i] should not be null init: $init");
        params.add(_toParam(
          builderArg: BuilderArg(
            name: "$i",
            init: notNull[i],
            isNamed: false,
            defaultValue: null,
          ),
          parent: this,
          editors: editors,
        ));
      }
    }
  }

  @override
  dynamic build() {
    if (init == null) return null;

    // 直接返回map后的list会转型错误：🔔⚠️❗️💡👉
    //     exception : return params.map((e)=>e.build()).toList() as T
    // 可以利用init的原始类型复制出来做基础，再转型就不会错了。
    return utils.castList<dynamic>(
        from: params.map((e) => e.build()), to: init as List);
  }

  @override
  Iterable<Param> get children => params;
}

class SetParam extends Param {
  final List<Param> params = List.empty(growable: true);
  int _index = 0;
  SetParam({
    required super.builderArg,
    required Param parent,
    required super.editors,
  }) : super(parent: parent) {
    if (init != null) {
      Iterable notNull = init as Iterable;
      for (var e in notNull) {
        assert(
            e != null, "set element[$_index] should not be null init: $init");
        params.add(_toParam(
          builderArg: BuilderArg(
            name: "$_index",
            init: e,
            isNamed: false,
            defaultValue: null,
          ),
          parent: this,
          editors: editors,
        ));
        _index++;
      }
    }
  }

  @override
  dynamic build() {
    if (init == null) return null;

    // 直接返回map后的toSet()会转型错误：🔔⚠️❗️💡👉
    //     exception : return params.map((e)=>e.build()).toSet() as T
    // 可以利用init的原始类型复制出来做基础，再转型就不会错了。
    return utils.castSet<dynamic>(
        from: params.map((e) => e.build()), to: init as Set);
  }

  @override
  Iterable<Param> get children => params;
}

Object _defaultParamBuilder(ObjectParam param) {
  return "";
}

class ObjectParam extends Param {
  final Map<String, Param> _params = {};
  final Object Function(ObjectParam param) builder;
  final code.Reference builderRefer;

  ObjectParam._({
    required super.builderArg,
    super.parent,
    required this.builder,
    required Map<String, BuilderArg> args,
    required this.builderRefer,
    required super.editors,
  }) {
    _params.addAll(args.map((key, value) =>
        MapEntry(key, value.toParam(parent: this, editors: editors))));
  }

  Map<String, Param> get params => _params;

  ObjectParam.rootFromMate(Mate init, {required Editors editors})
      : this._fromMate(
          init,
          //根对象无name
          builderArg: BuilderArg(
            name: "",
            init: init,
            isNamed: false,
            defaultValue: init,
          ),
          editors: editors,
        );

  ObjectParam.root({
    required Editors editors,
    Object Function(ObjectParam param) builder = _defaultParamBuilder,
  }) : this._(
          builderArg: BuilderArg(
            //根对象无name
            name: "",
            init: "",
            isNamed: false,
            defaultValue: "",
          ),
          args: {},
          builder: builder,
          //根对象
          builderRefer:
              code.refer("ObjectParam", "package:note/mate_core.dart"),
          editors: editors,
        );

  ObjectParam._fromMate(
    Mate init, {
    required BuilderArg builderArg,
    Param? parent,
    required Editors editors,
  }) : this._(
          builderArg: builderArg,
          parent: parent,
          builder: init.mateBuilder,
          args: init.mateParams,
          builderRefer: code.refer(init.mateBuilderName, init.matePackageUrl),
          editors: editors,
        );

  /// todo remove ObjectParam目前并没有调用此方法的场景，可能是我们把Mate Param和 数据状态搞混了，要好好想想
  BuilderArg<E> use<E>(
    String name,
    E init, {
    bool isNamed = true,
    dynamic defaultValue,
  }) {
    if (_params.containsKey(name))
      return (_params[name] as Param).builderArg as BuilderArg<E>;
    var result = BuilderArg<E>(
      name: name,
      init: init,
      isNamed: isNamed,
      defaultValue: defaultValue,
    );
    var param = _toParam(
      builderArg: result,
      parent: this,
      editors: editors,
    );
    _params[name] = param;
    return result;
  }

  BuilderArg<E> get<E>(String name) {
    assert(_params.containsKey(name), "$name should be exists");
    return _params[name]!.builderArg as BuilderArg<E>;
  }

  @override
  dynamic build() => builder(this);

  @override
  Iterable<Param> get children => _params.values;

  /// 为编辑器提供完整的代码
  String toSampleCode({
    bool snippet = true,
    bool format = false,
    Editors? editors,
  }) {
    var editors_ = editors ?? Editors();

    var emitter = editors_.emitter;
    var formatter = editors_.formatter;

    var mateExpression = toCodeExpression(editors: editors_);

    var toCode = mateExpression.statement;

    if (!snippet) {
      toCode = code.Block.of([
        const code.Code("""
import 'package:flutter/material.dart';

void main() {
  var sample="""),
        mateExpression.statement,
        const code.Code("""      
  runApp(MaterialApp(home: Scaffold(body: sample)));
}
    """),
      ]);
    }

    String result = toCode.accept(emitter).toString();
    if (format) {
      result = snippet
          ? formatter.formatStatement(result)
          : formatter.format(result);
    }
    return result;
  }
}

/// what use of BuilderArg class:
/// - hold arg type T
/// - mateUse use/get public interface
/// this class is a transition state of the parameter tree
class BuilderArg<T> {
  final String name;
  final bool isNamed;
  final Object? defaultValue;
  final T init;
  late final bool nullable;
  late final Param param;

  /// if create from [ObjectParam.use] or [Mate] <T>  type is provided
  final bool isTypeProvided;

  BuilderArg({
    required this.name,
    required this.init,
    required this.isNamed,
    this.isTypeProvided = false,
    this.defaultValue,
  }) : nullable = utils.isNullableOf<T>(init);

  T get value => param.value;

  Type get argType => T;
  set value(T newValue) {
    param.value = newValue;
  }

  bool get isNullable => nullable;

  get isValue => param.isValue;

  get isList => param.isList;

  get isObject => param.isObject;

  Param toParam({required ObjectParam parent, required Editors editors}) {
    return _toParam(
      builderArg: this,
      parent: parent,
      editors: editors,
    );
  }

  T build() => param.build();

  String toCodeExpressionString() => param.toCodeExpressionString();

  /// 此时param可能还未初始化
  isSubType<Super>() => utils.isSubTypeOf<T, Super>(init);

  isSubTypeWithParam<Super>() =>
      utils.isSubTypeOf<T, Super>(init) || param.init is Super;

  @override
  String toString() {
    return "name:$name isNamed:$isNamed, nullable:$nullable,defaultValue:$defaultValue, init:$init";
  }
}

/// WARN: [Mate]'s fields use for code gen, so careful to change name.
mixin Mate {
  @protected
  late final Object Function(ObjectParam param) mateBuilder;
  @protected
  late final String mateBuilderName;
  @protected
  late final String matePackageUrl;
  // The purpose of the cache variable is to ensure that to Root Param is only called once,
  // because multiple calls will cause BuildArg.param to initialize multiple times
  // and report an error
  final Expando _cache = Expando("cache");

  Map<String, BuilderArg> get mateParams;

  BuilderArg<C> mateGet<C>(String name) {
    return mateParams[name] as BuilderArg<C>;
  }

  ObjectParam toRootParam({required Editors editors}) {
    var result = _cache[this];
    if (result == null) {
      result = ObjectParam.rootFromMate(this, editors: editors);
      _cache[this] = result;
    }
    return result as ObjectParam;
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
    Widget? icon = param.builderArg.isSubType<Widget>()
        ? const Tooltip(message: "Widget", child: Icon(Icons.widgets, size: 15))
        : null;
    if (param._parent is ListParam && param is ObjectParam) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (icon != null) icon,
          // Text加Expanded 防止溢出
          Expanded(child: Text("${(param as ObjectParam).builderRefer.symbol}"))
        ],
      );
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (icon != null) icon,
        // Text加Expanded 防止溢出
        Expanded(
            child: Text("${param.displayName}${param.isRoot ? '' : ': '} "))
      ],
    );
  }

  Param get param;

  Widget valueWidget(BuildContext context);
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
  final IconRegisters iconRegisters;
  final code.DartEmitter emitter;
  final DartFormatter formatter;

  Editors({
    EnumRegister? enumRegister,
    IconRegisters? iconRegisters,
    code.DartEmitter? emitter,
    DartFormatter? formatter,
  })  : enumRegister = enumRegister ?? EnumRegister(),
        iconRegisters = iconRegisters ?? IconRegisters([]),
        emitter = emitter ?? defaultEmitter,
        formatter = formatter ?? defaultDartFormatter;

  /// <T> There are two situations:
  /// 1. if the parameter comes from [ObjectParam.use] or [Mate],
  ///   it has a strongly typed value
  /// 2. otherwise <T> is dynamic type.
  /// When querying the corresponding Editor, these two situations will be handled
  Editor get(Param param, {EditorBuilder? onNotFound}) {
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
    if (param is SetParam) {
      return SetParamEditor(param, editors: this);
    }

    param as ValueParam;
    BuilderArg arg = param.builderArg;
    if (arg.isSubTypeWithParam<int>()) {
      return IntEditor(param, editors: this);
    }
    if (arg.isSubTypeWithParam<double>()) {
      return DoubleEditor(param, editors: this);
    }
    if (arg.isSubTypeWithParam<bool>()) {
      return BoolEditor(param, editors: this);
    }
    if (arg.isSubTypeWithParam<String>()) {
      return StringEditor(param, editors: this);
    }
    if (arg.isSubTypeWithParam<Color>()) {
      return ColorEditor(param, editors: this);
    }
    if (arg.isSubTypeWithParam<Enum>()) {
      return EnumEditor(param,
          editors: this, enums: enumRegister.getOrEmpty(arg.argType));
    }
    if (arg.isSubTypeWithParam<IconData>()) {
      return IconDataEditor(param, editors: this);
    }

    // todo Editors:这下面的函数类型越来越多啊，需要解决掉
    // if (arg.isSubTypeWithParam<void Function()>()) {
    //   var ex = code.Method((b) => b
    //     ..name = ''
    //     ..lambda = false
    //     ..body = const code.Code("")).closure;
    //   return ManuallyValueEditor(param, editors: this, codeExpression: ex);
    // }
    //
    // // todo 这些function类型的等到范例模版好了后要清理掉 github:#61
    // if (arg.isSubTypeWithParam<void Function(bool)>()) {
    //   var ex = code.Method((b) => b
    //     ..name = ''
    //     ..lambda = false
    //     ..requiredParameters.add(code.Parameter((b) => b..name = "b"))
    //     ..body = const code.Code("")).closure;
    //   return ManuallyValueEditor(param, editors: this, codeExpression: ex);
    // }
    // if (arg.isSubTypeWithParam<void Function(int)>()) {
    //   var ex = code.Method((b) => b
    //     ..name = ''
    //     ..lambda = false
    //     ..requiredParameters.add(code.Parameter((b) => b..name = "b"))
    //     ..body = const code.Code("")).closure;
    //   return ManuallyValueEditor(param, editors: this, codeExpression: ex);
    // }
    // if (arg.isSubTypeWithParam<Function>()) {
    //   var ex = code.refer("null /* not support function */");
    //   return ManuallyValueEditor(param, editors: this, codeExpression: ex);
    // }
    // // SegmentedButton.onSelectionChanged: void Function(Set<T>)?
    // if (arg.isSubTypeWithParam<void Function(Set<String>)>()) {
    //   var ex = code.Method((b) => b
    //     ..name = ''
    //     ..lambda = false
    //     ..requiredParameters.add(code.Parameter((b) => b..name = "b"))
    //     ..body = const code.Code("")).closure;
    //   return ManuallyValueEditor(param, editors: this, codeExpression: ex);
    // }
    return onNotFound != null
        ? onNotFound(param)
        : UnknowTypeParamEditor(param, editors: this);
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

class IconRegisters {
  final Map<code.Reference, IconRegister> registers = {};

  IconRegisters(List<IconRegister> registers) {
    for (var r in registers) {
      this.registers[r.ref] = r;
    }
  }

  code.Expression getOrEmpty(IconData? icon) {
    if (icon == null) return code.literalNull;
    for (var register in registers.values) {
      var result = register.get(icon);
      if (result != null) return result;
    }
    return code.literalNull;
  }
}

class IconRegister {
  final Map<IconData, String> icons = {};
  final code.Reference ref;
  IconRegister(String refSymbol, String refUrl)
      : ref = code.Reference(refSymbol, refUrl);

  void register(IconData icon, String name) {
    icons[icon] = name;
  }

  code.Expression? get(IconData icon) {
    var find = icons[icon];
    return find == null ? null : ref.property(find);
  }
}

/// 代码生成
main() {
  // ignore: avoid_print
  // print(Enums._instance.enums[MainAxisAlignment.start.runtimeType]);
}
