import 'package:flutter/material.dart';
import 'package:note/mate.dart';

class ContainerMate extends Container with Mate {
  late final Param<double?> widthMate;
  late final Param<double?> heightMate;

  ContainerMate({
    Key? key,
    AlignmentGeometry? alignment,
    Color? color,
    Clip clipBehavior = Clip.none,
    double? width,
    double? height,
    Widget? child,
  }) : super(
          key: key,
          alignment: alignment,
          color: color,
          clipBehavior: clipBehavior,
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
    mateDeclare("key", key);
    mateDeclare("alignment", alignment);
    mateDeclare("color", color);
    mateDeclare("clipBehavior", clipBehavior);
    widthMate = mateDeclare("width", width);
    heightMate = mateDeclare("height", height);
    mateDeclare("child", child);
  }

  ContainerMate configMate({required void Function(ContainerMate self) config}) {
    return this;
  }
}

class ColumnMate extends Column with Mate {
  ColumnMate({
    Key? key,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    List<Widget> children = const <Widget>[],
  }) : super(
          key: key,
          mainAxisAlignment: mainAxisAlignment,
          children: children,
        ) {
    mateBuilder = (p) => ColumnMate(
          key: p.get("key").build(),
          mainAxisAlignment: p.get("mainAxisAlignment").build(),
          children: p.get("children").build(),
        );
    mateDeclare("key", key);
    mateDeclare("mainAxisAlignment", mainAxisAlignment);
    mateDeclare("children", children);
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
    mateDeclare("key", key);
    mateDeclare("widthFactor", widthFactor);
    mateDeclare("heightFactor", heightFactor);
    mateDeclare("child", child);
  }
}
