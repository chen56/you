import 'package:flutter/material.dart';
import 'package:note/mate.dart';

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
    mateParams = Params(
        init: this,
        builder: (p) => ContainerMate(
              key: p.getValue("key"),
              alignment: p.getValue("alignment"),
              color: p.getValue("color"),
              clipBehavior: p.getValue("clipBehavior"),
              width: p.getValue("width"),
              height: p.getValue("height"),
              child: p.getValue("child"),
            ));
    //这里会换成代码生成，凡是可以取到类型的，都可以支持编辑
    mateParams.set(name: "key", init: key);
    mateParams.set(name: "alignment", init: alignment);
    mateParams.set(name: "color", init: color);
    mateParams.set(name: "clipBehavior", init: clipBehavior);
    widthMate = mateParams.set(name: "width", init: width);
    heightMate = mateParams.set(name: "height", init: height);
    mateParams.set(name: "child", init: child);
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
    mateParams = Params(
        init: this,
        builder: (p) => ColumnMate(
              key: p.getValue("key"),
              mainAxisAlignment: p.getValue("mainAxisAlignment"),
              children: p.getValue("children"),
            ));

    mateParams.set(name: "key", init: key);
    mateParams.set(name: "mainAxisAlignment", init: mainAxisAlignment);
    mateParams.set(name: "children", init: children);
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
    mateParams = Params(
        init: this,
        builder: (p) => CenterMate(
              key: p.getValue("key"),
              widthFactor: p.getValue("widthFactor"),
              heightFactor: p.getValue("heightFactor"),
              child: p.getValue("child"),
            ));
    mateParams.set(name: "key", init: key);
    mateParams.set(name: "widthFactor", init: widthFactor);
    mateParams.set(name: "heightFactor", init: heightFactor);
    mateParams.set(name: "child", init: child);
  }
}
