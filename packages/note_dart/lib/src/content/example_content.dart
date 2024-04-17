import 'package:flutter/material.dart';
import 'package:flutter_highlight/themes/vs2015.dart';
import 'package:note_dart/src/content/params.dart';
import 'package:note_dart/src/flutter_highlight.dart';
import 'package:note_dart/core.dart';
import 'package:note_dart/src/note_core.dart';
import 'package:note_dart/ui.dart';
import 'package:code_builder/code_builder.dart' as code;

/// 暂时搁置参数需求
/// this package is dependency by note page

class ExampleContent {
  final Mate mate;
  final bool isShowCode;
  final bool isShowParamEditor;
  final SampleTemplate codeTemplate;

  /// if true , we will return : cell code + mate gen code
  /// and we will erase MateSample call statement and Pen.runInCurrentCell statement
  // final bool isUseCellCodeAsTemplate;
  ExampleContent(
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

typedef SampleCodeBuilder = String Function(NoteCell cell, ObjectParam param, Editors editors);

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
  static const Set<String> _eraseCodeTypes = {"MateSample.new.firstParentStatement", "Pen.runInCurrentCell"};

  /// cell代码被转换后作为范例代码
  /// The cell code is transformed as sample code
  static String _cleanCellCode(NoteCell cell, ObjectParam rootParam) {
    var sources = cell.source.specialSources.where((e) => _eraseCodeTypes.contains(e.codeType)).toList();

    sources.sort((a, b) => a.codeEntity.offset.compareTo(b.codeEntity.offset));

    int offset = cell.source.codeEntity.offset;
    List<String> codes = List.empty(growable: true);
    for (var s in sources) {
      codes.add(cell.pen.notePage.content.safeSubstring(offset, s.codeEntity.offset));

      offset = s.codeEntity.end;
    }
    return codes.join(" ");
  }
}

class ExampleWidget extends StatelessWidget   {
  final ObjectParam rootParam;
  final String title;
  final ExampleContent content;
  final NoteCell cell;

  const ExampleWidget({
    super.key,
    required this.rootParam,
    this.title = "展开代码(手机上暂时无法编辑文本、数字参数)",
    required this.content,
    required this.cell,
  });

  static Widget responsiveUI({
    required BuildContext context,
    required Widget paramView,
    required Widget codeView,
    required ExampleContent content,
  }) {
    WindowClass win = WindowClass.of(context);

    // screen large enough
    if (win == WindowClass.expanded) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (content.isShowCode) Expanded(child: codeView),
          if (content.isShowParamEditor) Expanded(child: paramView),
        ],
      );
    }

    // screen large not enough
    var codeViewFillWidth = LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SizedBox(width: constraints.maxWidth, child: codeView);
      },
    );
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (content.isShowCode) codeViewFillWidth,
        if (content.isShowParamEditor) paramView,
      ],
    );
  }

  Widget buildParamRow(BuildContext context, Param param) {
    var nameWidget = Container(
      padding: EdgeInsets.only(left: param.level * 15),
      child: param.nameWidget(context),
    );

    var row = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(flex: 40, child: nameWidget),
        Expanded(flex: 60, child: param.valueWidget(context)),
      ],
    );
    // TextButton link = TextButton(onPressed: (){}, child: Text(node.title));
    // ignore: unused_local_variable
    var padding = Padding(
      // 缩进模仿树形
      padding: EdgeInsets.only(left: 2 * (param.level).toDouble()),
      child: Container(
        decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey))),
        height: 30,
        child: row,
      ),
    );

    return padding;
  }

  @override
  Widget build(BuildContext context) {
    // codeView do not listen param changed, because we want keep Input widget
    var paramView = Column(
      children: [
        ...rootParam
            // hide null value
            .flat(test: (param) => param.isShow)
            .map((param) => buildParamRow(context, param))
      ],
    );

    // codeView listen param changed
    var codeView = ListenableBuilder(
      listenable: rootParam,
      builder: (context, _) {
        return HighlightView(
          // The original code to be highlighted
          content.toSampleCode(cell, rootParam, rootParam.editors),

          // Specify language
          // It is recommended to give it a value for performance
          language: 'dart',

          // Specify highlight theme
          // All available themes are listed in `themes` folder
          theme: vs2015Theme,

          // Specify padding
          padding: const EdgeInsets.all(6),
        );
      },
    );
    var paramAndCodeView = responsiveUI(context: context, codeView: codeView, paramView: paramView, content: content);

    return Card(
      elevation: 5,
      child: ListenableBuilder(
        listenable: rootParam,
        builder: (context, _) {
          var renderView = rootParam.build() as Widget;

          return Column(
            children: [
              ExpansionTile(
                initiallyExpanded: false,
                expandedAlignment: Alignment.topLeft,
                expandedCrossAxisAlignment: CrossAxisAlignment.start,
                title: Row(children: [Text(title)]),
                children: [
                  paramAndCodeView,
                ],
              ),
              renderView,
            ],
          );
        },
      ),
    );
  }
}
