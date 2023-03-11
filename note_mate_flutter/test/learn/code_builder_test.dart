import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:test/test.dart';

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
        ..constructors.add(Constructor(
          (b) => b
            ..name = null
            ..optionalParameters.add(Parameter(
              (b) => b
                ..type = refer("Class", "package:a/a.dart")
                ..name = "b"
                ..named = true
                ..required = true,
            ))
            ..optionalParameters.add(Parameter(
              (b) => b
                ..type = refer("int")
                ..name = "c"
                ..named = false
                ..required = false,
            ))
            ..requiredParameters.add(Parameter((b) => b
                  ..type = refer("int")
                  ..name = "a"
                  ..named = true
                // ..required = true,
                )),
        )))));

    lib.accept(DartEmitter());
    print(_dartfmt.format('${lib.accept(DartEmitter.scoped())}'));
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
    final library = Library((b) => b.body.addAll(methods));
    print(_dartfmt.format('${library.accept(DartEmitter.scoped())}'));
  });
  test('FunctionType', () {
    final library = Library((b) => b.body.add(Field((b) => b
      ..name = "func"
      ..type = FunctionType((b) => b
            ..namedParameters["a"] = TypeReference((b) => b
              ..symbol = "List"
              ..types.add(refer("String")))
            ..namedRequiredParameters["b"] = refer("int")
            ..requiredParameters.add(refer("int"))
          // ..optionalParameters.add(refer("String")),
          ))));

    print(_dartfmt.format('${library.accept(DartEmitter.scoped())}'));
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

    print(_dartfmt.format('${lib.accept(DartEmitter.scoped())}'));
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
    print(_noformat(x));
  });
}

String _format(Spec item) {
  return _dartfmt.format('${item.accept(DartEmitter.scoped())}');
}

String _noformat(Spec item) {
  return '${item.accept(DartEmitter.scoped())}';
}

// Function(
//   int, {int s},[
//   String,
// ])? func;
