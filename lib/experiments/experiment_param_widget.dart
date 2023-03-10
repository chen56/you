import 'package:flutter/material.dart';

class Creators {
  static const String pen = "pen";
  static const String container = "Container";
  static const String column = "Column";
}

class Param {}

class Nullable<T> extends Param {
  T? value;

  Nullable(this.value);
}

class NotNull<T> extends Param {
  final T value;

  NotNull(this.value);
}

abstract class Editor<T> {
  final String name;
  final T? init;
  T? _value;
  bool _alreadySet = false;

  set value(T? v) {
    _value = v;
    _alreadySet = true;
  }

  T? get value {
    return _alreadySet ? _value : init;
  }

  Editor({required this.name, this.init});
}

class MateNode {
  final Map<String, Editor> _paramMap = {};
  final List<Editor> _params = List.empty(growable: true);

  /// 创建器，因为一个类可能有多个构造器，每个构造器的参数表不同，要区分开
  /// 这样才能按原构造器recreate
  String creator;

  MateNode(this.creator);

  void add(Editor editor) {
    assert(!_paramMap.containsKey(editor.name), "error:duplicate key: ${editor.name} ");
    _paramMap[editor.name] = editor;
    _params.add(editor);
  }

  Nullable<T> set_<T>({required Editor<T> editor}) {
    add(editor);
    return Nullable(editor.value);
  }

  Nullable<T> set2_<T>({required String name, T? init}) {
    return Nullable(init);
  }

  NotNull<T> set<T>({required Editor<T> editor}) {
    add(editor);
    return NotNull(editor.value!);
  }

  T get<T>(String name) {
    return _paramMap[name] as T;
  }

  T? get_<T>(String name, T o) {
    return _paramMap[name] as T;
  }
}

mixin WidgetMate on Widget {
  late final MateNode mate;
}

class Double extends Editor<double> {
  Double({required super.name, super.init});
}

class Dynamic extends Editor<dynamic> {
  Dynamic({required super.name, super.init});
}

class ContainerMate extends Container with WidgetMate {
  late final Nullable<double> widthMate;
  late final Nullable<double> heightMate;

  ContainerMate({
    super.key,
    super.alignment,
    super.color,
    super.clipBehavior,
    double? width,
    double? height,
    Widget? child,
  }) : super(
          width: width,
          height: height,
          child: child,
        ) {
    mate = MateNode(Creators.container);
    //这里会换成代码生成，凡是可以取到类型的，都可以支持编辑
    mate.set_(editor: Dynamic(name: "key", init: key));
    mate.set_(editor: Dynamic(name: "alignment", init: alignment));
    mate.set_(editor: Dynamic(name: "color", init: color));
    mate.set(editor: Dynamic(name: "clipBehavior", init: clipBehavior));
    widthMate = mate.set_(editor: Double(name: "width", init: width));
    heightMate = mate.set_(editor: Double(name: "height", init: height));
    mate.set_(editor: Dynamic(name: "child", init: child));
  }

  static ContainerMate create(MateNode mate) {
    return ContainerMate(
      key: mate.get<dynamic>("key"),
      alignment: mate.get<dynamic>("alignment"),
      color: mate.get<dynamic>("color"),
      clipBehavior: mate.get<dynamic>("clipBehavior"),
      width: mate.get<double>("width"),
      height: mate.get<double>("height"),
      child: mate.get<dynamic>("child"),
    );
  }

  ContainerMate configMate({required void config(ContainerMate self)}) {
    return this;
  }
}

class ColumnMate extends Column with WidgetMate {
  ColumnMate({
    super.key,
    super.mainAxisAlignment,
    List<Widget> children = const <Widget>[],
  }) : super(children: children) {
    mate = MateNode(Creators.column);

    mate.set(editor: Dynamic(name: "key", init: key));
    mate.set(editor: Dynamic(name: "mainAxisAlignment", init: mainAxisAlignment));
    mate.set_(editor: Dynamic(name: "children", init: children));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      key: key,
      // children: children.map((e) => e.build(context)).toList(),
    );
  }

  @override
  static ColumnMate create(MateNode meta) {
    return ColumnMate(
      key: meta.get("key"),
      mainAxisAlignment: meta.get("mainAxisAlignment"),
      children: meta.get("children"),
    );
  }
}

class CenterMate extends Center with WidgetMate {
  CenterMate({
    Key? key,
    double? widthFactor,
    double? heightFactor,
    Widget? child,
  }) : super(
          key: ValueKey("1"),
          widthFactor: widthFactor,
          heightFactor: heightFactor,
          child: child,
        ) {
    mate = MateNode(Creators.column);
    mate.set_(editor: Dynamic(name: "key", init: key));
    double? d = mate.set2_(name: "widthFactor", init: widthFactor).value;
    mate.set_(editor: Double(name: "widthFactor", init: widthFactor));
    mate.set_(editor: Double(name: "heightFactor", init: heightFactor));
    mate.set_(editor: Dynamic(name: "child", init: child));
  }

  @override
  static CenterMate create(MateNode meta) {
    double x = meta.get("widthFactor");
    double? x2 = meta.get("widthFactor");
    return CenterMate(
      key: meta.get("key"),
      widthFactor: meta.get("widthFactor"),
      heightFactor: meta.get("heightFactor"),
      child: meta.get("child"),
    );
  }
}
