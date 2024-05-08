import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';

class GetUnit {
  GetUnit(this.unit);

  final CompilationUnit unit;

  CompilationUnitElement get declared => unit.declaredElement!;

  LibraryElement get library => declared.library;

  FunctionElement? topFunction(String name) {
    for (var function in declared.functions) {
      if (function.name == name) {
        return function;
      }
    }
    return null;
  }

  ({ElementAnnotation element, Annotation ast, DartObject value})? annotationOnTopFunction({required String funcName, required String annoType, String? annoUrl}) {
    var func = topFunction(funcName);
    if (func == null) return null;

    for (var meta in func.metadata) {
      var value = meta.computeConstantValue();

      assert(value != null);

      var t = value!.type;
      if (t == null) continue;

      if (t.getDisplayString(withNullability: false) != annoType) continue;

      if (annoUrl != null) {
        var publicExportFrom = findPublicExportLib(t, library);
        if (publicExportFrom?.identifier == annoUrl) continue;
      }

      Iterable<Annotation> annotations = _findAstNodeByType<Annotation>(unit);
      var annotationAst = annotations.where((e) => e.elementAnnotation == meta).first;
      return (element: meta, ast:annotationAst, value:value);
    }

    return null;
  }

  static Iterable<FIND> _findAstNodeByType<FIND>(AstNode node) sync* {
    if (node is FIND) yield node as FIND;
    for (var i in node.childEntities) {
      if (i is! AstNode) continue;
      yield* _findAstNodeByType(i);
    }
  }

  ClassElement? class_(String name) {
    final type = library.exportNamespace.get(name);
    return type is ClassElement ? type : null;
  }
}

/// given a internal lib: package:you_flutter/src/router.dart
///     =>  find it's public export : package:you_flutter/router.dart
LibraryElement? findPublicExportLib(DartType toFind, LibraryElement useAt) {
  for (var import in useAt.importedLibraries) {
    for (var MapEntry(key: _, value: value) in import.exportNamespace.definedNames.entries) {
      if (toFind.element == value) {
        return import;
      }
    }
  }
  return toFind.element!.library;
}
