// ignore_for_file: avoid_print

import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

final _dartfmt = DartFormatter(pageWidth: 120);

typedef PageRouteFactory = PageRoute<T> Function<T>(RouteSettings settings);

PageRouteFactory? x;

void main() {
  test('Class.constructor', () {
    var lib = Library((b) => b
      ..body.add(
        Method((b) => b
          ..body = const Code('')
          ..name = 'doThing'
          ..returns = refer('Thing', 'package:a/a.dart')),
      )
      ..body.add(Class((b) => b
        ..name = "A"
        ..methods.add(Method(
          (b) => b
            ..name = "ss"
            // ..optionalParameters.add(Parameter(
            //   (b) => b
            //     ..type = refer("Class", "package:a/a.dart")
            //     ..name = "b"
            //     ..named = false
            //     ..required = false,
            // ))
            ..optionalParameters.add(Parameter(
              (b) => b
                ..type = refer("int?")
                ..name = "c"
                ..named = true
                ..required = false,
            ))
            ..optionalParameters.add(Parameter(
              (b) => b
                ..type = refer("int?")
                ..name = "d"
                ..named = false
                ..required = false,
            ))
            ..requiredParameters.add(Parameter(
              (b) => b
                ..type = refer("int?")
                ..name = "a"
                ..named = true
                ..required = false,
            ))
            ..requiredParameters.add(Parameter(
              (b) => b
                ..type = refer("int")
                ..name = "b"
                ..named = true
                ..required = false,
            )),
        )))));

    print(_format(lib));
  });
  test('lib import', () {
    final methods = [
      Method((b) => b
        ..body = const Code('')
        ..name = 'doThing'
        ..returns = refer('Thing', 'package:a/a.dart')),
      Method((b) => b
        ..body = const Code('')
        ..name = 'doOther'
        ..returns = refer('Other', 'package:b/b.dart')),
    ];
    final lib = Library((b) => b.body.addAll(methods));
    print(_format(lib));
  });
  test('FunctionType', () {
    final lib = Library((b) => b.body.add(Field((b) => b
      ..name = "func"
      ..type = FunctionType((b) => b
            ..namedParameters["a"] = TypeReference((b) => b
              ..symbol = "List"
              ..types.add(refer("String")))
            ..namedRequiredParameters["b"] = TypeReference((b) => b
              ..symbol = "List"
              ..url = "dart:ui")
            ..requiredParameters.add(refer("int"))
          // ..optionalParameters.add(refer("String")),
          ))));

    print("---${_format(lib)}");
  });
  test('class.TypeReference', () {
    var lib = Library((b) => b
      ..body.add(Class(
        (b) => b
          ..name = "A"
          ..types.add(TypeReference((b) => b
            ..symbol = "X"
            ..bound = TypeReference((b) => b..symbol = "Object")))
          ..types.add(TypeReference((b) => b
            ..symbol = "Y"
            ..bound = TypeReference((b) => b
              ..symbol = "List"
              ..types.add(TypeReference((b) => b..symbol = "String"))))),
      )));

    print(_format(lib));
  });
  test('expression.assign', () {
    var x = refer("mateParams")
        .assign(refer("Params").call([], {
          "init": refer("this"),
          "builder": Method((b) => b
            ..name = ''
            ..requiredParameters.add(Parameter((b) => b.name = "p"))
            ..body = refer("ContainerMate").call([], {
              "key": refer("p.get").call([literal("key")]).property("value"),
              "width": refer("p.get").call([literal("width")]).property("value"),
            }).code).closure,
        }))
        .code;
    print(_noFormat(x));
    //mateParams = Params(init: this, builder: (p) => ContainerMate(key: p.get('key').value, width: p.get('width').value, ), )
  });
  test('expression.assign2', () {
    var x = refer("mateParams").call([]).property("s").call([]).code;
    print(_noFormat(x));
  });
  test('ObjectFlagProperty<String>.has()', () {
    var x = TypeReference((b) => b
      ..symbol = "ObjectFlagProperty"
      ..types.add(refer("String"))).property("has").call([]).code;
    expect(_noFormat(x), "ObjectFlagProperty<String>.has()");

    var y = TypeReference((b) => b
      ..symbol = "ObjectFlagProperty"
      ..types.add(refer("String"))).newInstanceNamed("has", []).code;
    expect(_noFormat(y), "ObjectFlagProperty<String>.has()");
  });
  test('Lambda : void Function()', () {
    var y = Method((b) => b
      ..name = ''
      ..lambda = false
      ..body = const Code(""));
    expect(_noFormat(y), "() {  } ");
  });
  test('literalMap ', () {
    var y = literalMap({
      "width": refer("ObjectFlagProperty").call([], {"a": literalTrue})
    });
    expect(_noFormat(y), "{'width': ObjectFlagProperty(a: true)}");
  });
}

String _format(Spec item) {
  return _dartfmt.format('${item.accept(DartEmitter.scoped())}');
}

String _noFormat(Spec item) {
  return '${item.accept(DartEmitter.scoped())}';
}

// Function(
//   int, {int s},[
//   String,
// ])? func;
// class A {
//   A([
//     int? b,
//     int? c,
//   ]);
//   A.a(int? aa,[
//     int? b,
//     int? c,
//   ],{int? ss});
// }
