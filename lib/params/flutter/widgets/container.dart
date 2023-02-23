import 'package:flutter/material.dart';

class ContainerMate extends WidgetMate {
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final Decoration? decoration;
  final Decoration? foregroundDecoration;
  final BoxConstraints? constraints;
  final EdgeInsetsGeometry? margin;
  final Matrix4? transform;
  final AlignmentGeometry? transformAlignment;
  final Clip clipBehavior;

  late final Double_ width;
  late final Double_ height;

  final WidgetMate? child;

  ContainerMate({
    super.key,
    this.alignment,
    this.padding,
    this.color,
    this.decoration,
    this.foregroundDecoration,
    double? width,
    double? height,
    this.constraints,
    this.margin,
    this.transform,
    this.transformAlignment,
    this.child,
    this.clipBehavior = Clip.none,
  }) {
    this.width = ofDouble_(name: "width", init: width);
    this.height = ofDouble_(name: "height", init: height);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      alignment: alignment,
      padding: padding,
      color: color,
      decoration: decoration,
      foregroundDecoration: foregroundDecoration,
      width: width.get(),
      height: height.get(),
      constraints: constraints,
      margin: margin,
      transform: transform,
      transformAlignment: transformAlignment,
      clipBehavior: clipBehavior,
      child: child?.build(context),
    );
  }
}

class ColumnMate extends WidgetMate {
  final List<WidgetMate> children;

  ColumnMate({
    Key? key,
    this.children = const <WidgetMate>[],
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      key: key,
      children: children.map((e) => e.build(context)).toList(),
    );
  }
}

class CenterMate extends WidgetMate {
  late final Double_ widthFactor;
  late final Double_ heightFactor;
  WidgetMate? child;

  CenterMate({
    super.key,
    double? widthFactor,
    double? heightFactor,
    this.child,
  }) {
    this.widthFactor = ofDouble_(name: "widthFactor", init: widthFactor);
    this.heightFactor = ofDouble_(name: "heightFactor", init: heightFactor);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      key: key,
      widthFactor: widthFactor.get(),
      heightFactor: heightFactor.get(),
      child: child?.build(context),
    );
  }
}

abstract class Editor<T> {}

class Double extends Editor<double> {}

class Double_ extends Editor<double> {
  double? init;
  String name;

  Double_({required this.name, this.init});

  double? get() {
    return init;
  }
}

abstract class WidgetMate {
  Map<String, Object?> params = {};

  final Key? key;

  WidgetMate({this.key});

  T get<T>(String name, T o) {
    return o;
  }

  Double_ ofDouble_({required String name, double? init}) {
    return _initOnce(name, () => Double_(name: name, init: init));
  }

  T _initOnce<T extends Editor>(String name, T Function() create) {
    return params.putIfAbsent(name, () {
      return create();
    }) as T;
  }

  Widget build(BuildContext context);
}

mixin Show on Widget {
  List<WidgetMate> list = List.empty(growable: true);

  static Show of(BuildContext context) {
    Show? result;
    context.visitAncestorElements((element) {
      if (element.widget is Show) {
        result = element.widget as Show;
        return false;
      }
      return true;
    });
    assert(false, "Sample not found , your Samples must with mixin [Sample]");
    return result!;
  }
}
