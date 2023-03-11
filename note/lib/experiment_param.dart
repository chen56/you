import 'package:flutter/material.dart';

class Creators {
  static const String pen = "pen";
  static const String container = "Container";
  static const String column = "Column";
}

class Param<T> {
  final String name;
  final T init;
  T value;

  Param({required this.name, required this.init}) : value = init;
}

class ParamNode {
  final Map<String, Editor> _paramMap = {};
  final List<Editor> _params = List.empty(growable: true);

  /// 创建器，因为一个类可能有多个构造器，每个构造器的参数表不同，要区分开
  /// 这样才能按原构造器recreate
  String creator;

  ParamNode(this.creator);

  void add(Editor editor) {
    assert(!_paramMap.containsKey(editor.name), "error:duplicate key: ${editor.name} ");
    _paramMap[editor.name] = editor;
    _params.add(editor);
  }

  Param<T> set<T>({required String name, required init}) {
    return Param(name: name, init: init);
  }

  T get<T>(String name) {
    return _paramMap[name] as T;
  }
}

mixin WidgetMate on Widget {
  late final ParamNode mate;
}

class ContainerMate extends Container with WidgetMate {
  late final Param<double> widthMate;
  late final Param<double> heightMate;

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
    mate = ParamNode(Creators.container);
    //这里会换成代码生成，凡是可以取到类型的，都可以支持编辑
    mate.set(name: "key", init: key);
    mate.set(name: "alignment", init: alignment);
    mate.set(name: "color", init: color);
    mate.set(name: "clipBehavior", init: clipBehavior);
    widthMate = mate.set(name: "width", init: width);
    heightMate = mate.set(name: "height", init: height);
    mate.set(name: "child", init: child);
  }

  static ContainerMate create(ParamNode mate) {
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
    mate = ParamNode(Creators.column);

    mate.set(name: "key", init: key);
    mate.set(name: "mainAxisAlignment", init: mainAxisAlignment);
    mate.set(name: "children", init: children);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      key: key,
      // children: children.map((e) => e.build(context)).toList(),
    );
  }

  @override
  static ColumnMate create(ParamNode meta) {
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
    mate = ParamNode(Creators.column);
    mate.set(name: "key", init: key);
    mate.set(name: "widthFactor", init: widthFactor);
    mate.set(name: "heightFactor", init: heightFactor);
    mate.set(name: "child", init: child);
  }

  @override
  static CenterMate create(ParamNode meta) {
    return CenterMate(
      key: meta.get("key"),
      widthFactor: meta.get("widthFactor"),
      heightFactor: meta.get("heightFactor"),
      child: meta.get("child"),
    );
  }
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

class Double extends Editor<double> {
  Double({required super.name, super.init});
}

class Dynamic extends Editor<dynamic> {
  Dynamic({required super.name, super.init});
}
