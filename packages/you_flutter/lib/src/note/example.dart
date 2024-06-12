import 'package:flutter/material.dart';
import 'package:flutter_highlight/themes/atelier-forest-light.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';
import 'package:you_flutter/asset.dart';
import 'package:you_flutter/src/note/contents/flutter_highlight.dart';
import 'package:you_flutter/state.dart';

class FlutterExample extends StatefulWidget {
  final String title;
  final Widget child;
  final WidgetBuilder? builder;
  final double? width;
  final double? height;
  final BoxConstraints? constraints;
  final Asset? source;

  FlutterExample({
    super.key,
    required this.title,
    this.width,
    this.height,
    this.constraints,
    this.builder,
    required this.child,
    this.source,
  }); //

  @override
  State<StatefulWidget> createState() {
    return FlutterExampleState();
  }
}

class FlutterExampleState extends State<FlutterExample> {
  final Value<bool> showCode = false.signal();
  final Value<String?> code = (null as String?).signal();
  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    var textStyle = Theme.of(context).textTheme;

    return Watch(builder: (context) {
      var result = Container(
        decoration: BoxDecoration(color: colors.surfaceContainerLow, borderRadius: BorderRadius.circular(8.0), border: Border.all(width: 1, color: colors.outlineVariant)),
        child: Column(
          children: [
            Container(
              height: 36,
              color: colors.surfaceContainerHigh,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(width: 10),
                  Text(widget.title, style: textStyle.titleMedium),
                  const Spacer(),
                  IconButton(
                      icon: const Icon(size: 24, Icons.code),
                      tooltip: "open source code",
                      onPressed: () async {
                        showCode.value = !showCode.value;
                        if (code.value == null) {
                          if (widget.source == null) {
                            code.value = "// no code";
                          } else {
                            code.value = await widget.source!.loadString();
                          }
                        }
                      }),
                  IconButton(icon: const Icon(size: 24, Icons.fullscreen), onPressed: () {}),
                ],
              ),
            ),
            Container(
              width: widget.width,
              height: widget.height,
              constraints: widget.constraints,
              padding: const EdgeInsets.all(12),
              child: widget.child,
            ),
            // if (showCode.value)
            // Container(
            //   width: widget.width,
            //   height: widget.height,
            //   constraints: widget.constraints,
            //   padding: const EdgeInsets.all(12),
            //   child: Text(code.value == null ? "loading" : code.value!),
            // ),
            if (showCode.value)
              SyntaxView(
                  code: code.value == null ? "// loading" : code.value!,
                  // Code text
                  syntax: Syntax.DART,
                  // Language
                  syntaxTheme: SyntaxTheme.vscodeDark(),
                  // Theme
                  fontSize: 12.0,
                  // Font size
                  withZoom: true,
                  // Enable/Disable zoom icon controls
                  withLinesCount: true,
                  // Enable/Disable line number
                  expanded: false,
                  // Enable/Disable container expansion
                  selectable: true // Enable/Disable code text selection
                  ),
            if (showCode.value)
              HighlightView(
                code.value == null ? "// loading" : code.value!,
                language: 'dart',
                theme: atelierForestLightTheme,
                padding: const EdgeInsets.all(0),
              ),
          ],
        ),
      );

      return result;
    });
  }
}
