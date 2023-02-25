import 'package:flutter/material.dart';

class Creators {
  static const String container = "Container";
}

class Nullable<T> {
  final T? value;

  Nullable(this.value);
}

class NotNull<T> {
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

  T get<T>(String name) {
    return _paramMap[name] as T;
  }

  T? get_<T>(String name, T o) {
    return _paramMap[name] as T;
  }
}

mixin WidgetMate on Widget {
  late final MateNode mate;

  NotNull<T> set<T>({required Editor<T> editor}) {
    mate.add(editor);
    return NotNull(editor.value!);
  }

  Nullable<T> set_<T>({required Editor<T> editor}) {
    mate.add(editor);
    return Nullable(editor.value);
  }
}

class Double extends Editor<double> {
  Double({required super.name, super.init});
}

class Dynamic extends Editor<dynamic> {
  Dynamic({required super.name, super.init});
}

class ContainerMate extends Container with WidgetMate {
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
    set(editor: Dynamic(name: "key", init: key));
    set(editor: Dynamic(name: "alignment", init: alignment));
    set(editor: Dynamic(name: "color", init: color));
    set(editor: Dynamic(name: "clipBehavior", init: clipBehavior));
    set_(editor: Double(name: "width", init: width));
    set_(editor: Double(name: "height", init: height));
    set_(editor: Dynamic(name: "child", init: child));
  }

  static ContainerMate create(MateNode node) {
    return ContainerMate(
      key: node.get<dynamic>("key"),
      alignment: node.get<dynamic>("alignment"),
      color: node.get<dynamic>("color"),
      clipBehavior: node.get<dynamic>("clipBehavior"),
      width: node.get<double>("width"),
      height: node.get<double>("height"),
      child: node.get<dynamic>("child"),
    );
  }
}

class ColumnMate extends Column with WidgetMate {
  ColumnMate({
    super.key,
    super.mainAxisAlignment,
    List<Widget> children = const <Widget>[],
  }) : super(children: children) {
    set(editor: Dynamic(name: "key", init: key));
    set(editor: Dynamic(name: "mainAxisAlignment", init: mainAxisAlignment));
    set_(editor: Dynamic(name: "children", init: children));
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
          key: key,
          widthFactor: widthFactor,
          heightFactor: heightFactor,
          child: child,
        ) {
    set_(editor: Dynamic(name: "key", init: key));
    set_(editor: Double(name: "widthFactor", init: widthFactor));
    set_(editor: Double(name: "heightFactor", init: heightFactor));
    set_(editor: Dynamic(name: "child", init: child));
  }

  @override
  static CenterMate create(MateNode meta) {
    return CenterMate(
      key: meta.get("key"),
      widthFactor: meta.get("widthFactor"),
      heightFactor: meta.get("heightFactor"),
      child: meta.get("child"),
    );
  }
}
