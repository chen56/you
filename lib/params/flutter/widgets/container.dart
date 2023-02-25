import 'package:flutter/material.dart';

class ContainerMate extends Container with WidgetMate {
  late final Double _width;
  late final Double _height;

  ContainerMate({
    Key? key,
    AlignmentGeometry? alignment,
    Color? color,
    super.clipBehavior,
    double? width,
    double? height,
    Widget? child,
  }) : super(
          key: key,
          alignment: alignment,
          width: width,
          height: height,
          color: color,
          child: child,
        ) {
    _width = addDouble_(name: "width", init: width);
    _height = addDouble_(name: "height", init: height);
  }

  @override
  ContainerMate clone() {
    return ContainerMate(
      key: key,
      width: _width.value,
      height: _height.value,
    );
  }

// @override
// Widget build(BuildContext context) {
//   return Container(
//     key: key,
//     alignment: alignment,
//     padding: padding,
//     color: color,
//     decoration: decoration,
//     foregroundDecoration: foregroundDecoration,
//     width: width.get(),
//     height: height.get(),
//     constraints: constraints,
//     margin: margin,
//     transform: transform,
//     transformAlignment: transformAlignment,
//     clipBehavior: clipBehavior,
//     // child: child?.build(context),
//   );
// }
}

class ColumnMate extends Column with WidgetMate {
  ColumnMate({
    super.key,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    List<Widget> children = const <Widget>[],
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      key: key,
      // children: children.map((e) => e.build(context)).toList(),
    );
  }

  @override
  WidgetMate clone() {
    // TODO: implement clone
    throw UnimplementedError();
  }
}

class CenterMate extends Center with WidgetMate {
  late final Double _widthFactor;
  late final Double _heightFactor;

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
    _widthFactor = addDouble_(name: "widthFactor", init: widthFactor);
    _heightFactor = addDouble_(name: "heightFactor", init: heightFactor);
  }

  @override
  CenterMate clone() {
    return CenterMate(
      key: key,
      widthFactor: _widthFactor.value,
      heightFactor: _heightFactor.value,
      child: child is WidgetMate ? (child as WidgetMate).clone() : child,
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

class MateNode {
  final Map<String, Editor> _paramMap = {};
  final List<Editor> _params = List.empty(growable: true);

  void add(Editor editor) {
    assert(!_paramMap.containsKey(editor.name),
        "error:duplicate key: ${editor.name} ");
    _paramMap[editor.name] = editor;
    _params.add(editor);
  }

  Editor get(String name) {
    return _paramMap[name]!;
  }
}

mixin WidgetMate on Widget {
  final MateNode node = MateNode();

  T get<T>(String name, T o) {
    return o;
  }

  Double addDouble_({required String name, double? init}) {
    var result = Double(name: name, init: init);
    node.add(result);
    return result;
  }

  WidgetMate clone();
// Widget build(BuildContext context);
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
