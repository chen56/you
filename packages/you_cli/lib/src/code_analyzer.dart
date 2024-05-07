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
  // FunctionElement? topFunctionAst(String name) {
  //   for (var function in unit.visitChildren(visitor).functions) {
  //     if (function.name == name) {
  //       return function;
  //     }
  //   }
  //   return null;
  // }



  DartObject? annotationOnTopFunction({required String funcName, required String annoType, String? annoUrl}) {
    var func = topFunction(funcName);
    if (func == null) return null;

    var findToTypeAnno = func.metadata.map((e) => e.computeConstantValue()).where((e) {
      var t = e?.type;
      if (t == null) {
        return false;
      }
      if (t.getDisplayString(withNullability: false) != annoType) {
        return false;
      }
      var element = t.element;
      if (element is! ClassElement) {
        return false;
      }

      if (annoUrl == null) return true;

      var publicExportFrom = findPublicExportLib(t, library);
      return publicExportFrom?.identifier == annoUrl;
    }).firstOrNull;

    return findToTypeAnno;
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
