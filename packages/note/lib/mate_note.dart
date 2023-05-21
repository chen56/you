import 'package:note/mate_core.dart';
import 'package:note/note_core.dart';
import 'package:note/utils_core.dart';
import 'package:code_builder/code_builder.dart' as code;

/// this package is dependency by note page

class MateSample extends NoteContent {
  final Mate mate;
  final bool isShowCode;
  final bool isShowParamEditor;
  final SampleTemplate codeTemplate;

  /// if true , we will return : cell code + mate gen code
  /// and we will erase MateSample call statement and Pen.runInCurrentCell statement
  // final bool isUseCellCodeAsTemplate;
  MateSample(
    this.mate, {
    this.isShowCode = true,
    this.isShowParamEditor = true,
    SampleTemplate? sampleTemplate,
  }) : codeTemplate = sampleTemplate ?? SampleTemplate.notIncludeCellCode;

  @override
  String toString() {
    return "MateSample('${mate.toString()}')";
  }

  String toSampleCode(NoteCell cell, ObjectParam param, Editors editors) {
    return codeTemplate.codeBuilder(cell, param, editors);
  }
}

typedef SampleCodeBuilder = String Function(
    NoteCell cell, ObjectParam param, Editors editors);

class SampleTemplate {
  String name;
  SampleCodeBuilder codeBuilder;
  SampleTemplate({required this.name, required this.codeBuilder});

  // ignore: prefer_function_declarations_over_variables
  static final SampleTemplate notIncludeCellCode = SampleTemplate(
      name: "notIncludeCellCode",
      codeBuilder: (cell, param, editors) {
        var emitter = editors.emitter;
        var formatter = editors.formatter;

        var mateExpression = param.toCodeExpression(editors: editors);

        var toCode = code.Block.of([
          const code.Code("""
    import 'package:flutter/material.dart';
    
    void main() {
      var sample="""),
          mateExpression.statement,
          const code.Code("""      
      runApp(MaterialApp(home: Scaffold(body: sample)));
    }
    """),
        ]);

        String result = toCode.accept(emitter).toString();
        result = formatter.format(result);
        return result;
      });
  // ignore: prefer_function_declarations_over_variables
  static final SampleTemplate includeCleanCellCode = SampleTemplate(
      name: "includeCleanCellCode",
      codeBuilder: (cell, param, editors) {
        var emitter = editors.emitter;
        var formatter = editors.formatter;

        var mateExpression = param.toCodeExpression(editors: editors);
        var toCode = code.Block.of([
          code.Code("""
    import 'package:flutter/material.dart';
    
    void main() {
      
      ${_cleanCellCode(cell, param)}
      
      var sample="""),
          mateExpression.statement,
          const code.Code("""      
      runApp(MaterialApp(home: Scaffold(body: sample)));
    }
    """),
        ]);

        String result = toCode.accept(emitter).toString();
        result = formatter.format(result);
        return result;
      });

  /// The piece of code to be erased from the cell code
  static const Set<String> _eraseCodeTypes = {
    "MateSample.new.firstParentStatement",
    "Pen.runInCurrentCell"
  };

  /// cell代码被转换后作为范例代码
  /// The cell code is transformed as sample code
  static String _cleanCellCode(NoteCell cell, ObjectParam rootParam) {
    var sources = cell.source.specialSources
        .where((e) => _eraseCodeTypes.contains(e.codeType))
        .toList();

    sources.sort((a, b) => a.codeEntity.offset.compareTo(b.codeEntity.offset));

    int offset = cell.source.codeEntity.offset;
    List<String> codes = List.empty(growable: true);
    for (var s in sources) {
      codes.add(
          cell.pen.path.source.code.safeSubstring(offset, s.codeEntity.offset));

      offset = s.codeEntity.end;
    }
    return codes.join(" ");
  }
}
