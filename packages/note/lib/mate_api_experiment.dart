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
    mateCreateName = "Container";
    matePackageUrl = "package:flutter/material.dart";
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
    mateUse("key", key, isNamed: true);
    mateUse("alignment", alignment, isNamed: true);
    mateUse("color", color, isNamed: true);
    mateUse("clipBehavior", clipBehavior, isNamed: true);
    widthMate = mateUse("width", width, isNamed: true);
    heightMate = mateUse("height", height, isNamed: true);
    mateUse("child", child, isNamed: true);
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
    mateCreateName = "Column";
    matePackageUrl = "package:flutter/material.dart";

    mateBuilder = (p) => ColumnMate(
          key: p.get("key").build(),
          mainAxisAlignment: p.get("mainAxisAlignment").build(),
          children: p.get("children").build(),
        );
    mateUse("key", key, isNamed: true);
    mateUse("mainAxisAlignment", mainAxisAlignment, isNamed: true);
    mateUseList("children", children, isNamed: true);
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
    mateCreateName = "Center";
    matePackageUrl = "package:flutter/material.dart";

    mateBuilder = (p) => CenterMate(
          key: p.get("key").build(),
          widthFactor: p.get("widthFactor").build(),
          heightFactor: p.get("heightFactor").build(),
          child: p.get("child").build(),
        );
    mateUse("key", key, isNamed: true);
    mateUse("widthFactor", widthFactor, isNamed: true);
    mateUse("heightFactor", heightFactor, isNamed: true);
    mateUse("child", child, isNamed: true);
  }
}
