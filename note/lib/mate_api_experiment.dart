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
    mateParams = ObjectParam(
        init: this,
        builder: (p) => ContainerMate(
              key: p.get("key").build(),
              alignment: p.get("alignment").build(),
              color: p.get("color").build(),
              clipBehavior: p.get("clipBehavior").build(),
              width: p.get("width").build(),
              height: p.get("height").build(),
              child: p.get("child").build(),
            ));
    //这里会换成代码生成，凡是可以取到类型的，都可以支持编辑
    mateParams.put("key", key);
    mateParams.put("alignment", alignment);
    mateParams.put("color", color);
    mateParams.put("clipBehavior", clipBehavior);
    widthMate = mateParams.put("width", width);
    heightMate = mateParams.put("height", height);
    mateParams.put("child", child);
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
    mateParams = ObjectParam(
        init: this,
        builder: (p) => ColumnMate(
              key: p.get("key").build(),
              mainAxisAlignment: p.get("mainAxisAlignment").build(),
              children: p.get("children").build(),
            ));

    mateParams.put("key", key);
    mateParams.put("mainAxisAlignment", mainAxisAlignment);
    mateParams.putList("children", children);
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
    mateParams = ObjectParam(
        init: this,
        builder: (p) => CenterMate(
              key: p.get("key").build(),
              widthFactor: p.get("widthFactor").build(),
              heightFactor: p.get("heightFactor").build(),
              child: p.get("child").build(),
            ));
    mateParams.put("key", key);
    mateParams.put("widthFactor", widthFactor);
    mateParams.put("heightFactor", heightFactor);
    mateParams.put("child", child);
  }
}
