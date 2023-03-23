import 'package:flutter/material.dart';
import 'package:note/mate.dart';

class ContainerMate extends Container with Mate {
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
    mateBuilder = (p) => ContainerMate(
          key: p.get("key").build(),
          alignment: p.get("alignment").build(),
          color: p.get("color").build(),
          clipBehavior: p.get("clipBehavior").build(),
          width: p.get("width").build(),
          height: p.get("height").build(),
          child: p.get("child").build(),
        );
    //这里会换成代码生成，凡是可以取到类型的，都可以支持编辑
    matePut("key", key);
    matePut("alignment", alignment);
    matePut("color", color);
    matePut("clipBehavior", clipBehavior);
    widthMate = matePut("width", width);
    heightMate = matePut("height", height);
    matePut("child", child);
  }

  ContainerMate configMate({required void Function(ContainerMate self) config}) {
    return this;
  }
}

class ColumnMate extends Column with Mate {
  ColumnMate({
    super.key,
    super.mainAxisAlignment,
    List<Widget> children = const <Widget>[],
  }) : super(children: children) {
    mateBuilder = (p) => ColumnMate(
          key: p.get("key").build(),
          mainAxisAlignment: p.get("mainAxisAlignment").build(),
          children: p.get("children").build(),
        );
    matePut("key", key);
    matePut("mainAxisAlignment", mainAxisAlignment);
    matePut("children", children);
  }
}

class CenterMate extends Center with Mate {
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
    mateBuilder = (p) => CenterMate(
          key: p.get("key").build(),
          widthFactor: p.get("widthFactor").build(),
          heightFactor: p.get("heightFactor").build(),
          child: p.get("child").build(),
        );
    matePut("key", key);
    matePut("widthFactor", widthFactor);
    matePut("heightFactor", heightFactor);
    matePut("child", child);
  }
}
