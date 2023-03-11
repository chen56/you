import 'package:flutter/material.dart';
import 'package:note/experiment_param.dart';

class ContainerMate extends Container with WidgetMate<ContainerMate> {
  late final Param<double?> widthMate;
  late final Param<double?> heightMate;

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
    mate = ParamNode(
        init: this,
        builder: (mate) => ContainerMate(
              key: mate.getValue<dynamic>("key"),
              alignment: mate.getValue<dynamic>("alignment"),
              color: mate.getValue<dynamic>("color"),
              clipBehavior: mate.getValue<dynamic>("clipBehavior"),
              width: mate.getValue<double>("width"),
              height: mate.getValue<double>("height"),
              child: mate.getValue<dynamic>("child"),
            ));
    //这里会换成代码生成，凡是可以取到类型的，都可以支持编辑
    mate.set(name: "key", init: key);
    mate.set(name: "alignment", init: alignment);
    mate.set(name: "color", init: color);
    mate.set(name: "clipBehavior", init: clipBehavior);
    widthMate = mate.set(name: "width", init: width);
    heightMate = mate.set(name: "height", init: height);
    mate.set(name: "child", init: child);
  }

  ContainerMate configMate({required void Function(ContainerMate self) config}) {
    return this;
  }
}

class ColumnMate extends Column with WidgetMate<ColumnMate> {
  ColumnMate({
    super.key,
    super.mainAxisAlignment,
    List<Widget> children = const <Widget>[],
  }) : super(children: children) {
    mate = ParamNode(
        init: this,
        builder: (p) => ColumnMate(
              key: p.getValue("key"),
              mainAxisAlignment: p.getValue("mainAxisAlignment"),
              children: p.getValue("children"),
            ));

    mate.set(name: "key", init: key);
    mate.set(name: "mainAxisAlignment", init: mainAxisAlignment);
    mate.set(name: "children", init: children);
  }
}

class CenterMate extends Center with WidgetMate<CenterMate> {
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
    mate = ParamNode(
        init: this,
        builder: (p) => CenterMate(
              key: p.getValue("key"),
              widthFactor: p.getValue("widthFactor"),
              heightFactor: p.getValue("heightFactor"),
              child: p.getValue("child"),
            ));
    mate.set(name: "key", init: key);
    mate.set(name: "widthFactor", init: widthFactor);
    mate.set(name: "heightFactor", init: heightFactor);
    mate.set(name: "child", init: child);
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
