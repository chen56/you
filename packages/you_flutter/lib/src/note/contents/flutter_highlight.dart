import 'package:flutter/material.dart';
import 'package:highlight/highlight.dart' show highlight, Node;

/// ------------------------------------------------------------------------------
/// copy from https://github.com/git-touch/highlight.dart/blob/v0.7.0/flutter_highlight/lib/flutter_highlight.dart
/// origin code is:  RichText,
///       we need :  SelectableText.rich
/// ------------------------------------------------------------------------------
/// Highlight Flutter Widget
class HighlightView extends StatelessWidget {
  /// The original code to be highlighted
  final String source;

  /// Highlight language
  ///
  /// It is recommended to give it a value for performance
  ///
  /// [All available languages](https://github.com/pd4d10/highlight/tree/master/highlight/lib/languages)
  final String? language;

  /// Highlight theme
  ///
  /// [All available themes](https://github.com/pd4d10/highlight/blob/master/flutter_highlight/lib/themes)
  final Map<String, TextStyle> theme;

  /// Padding
  final EdgeInsetsGeometry? padding;

  /// Text styles
  ///
  /// Specify text styles such as font family and font size
  final TextStyle? textStyle;

  HighlightView(
    String input, {
    super.key,
    this.language,
    this.theme = const {},
    this.padding,
    this.textStyle,
    int tabSize = 8, // TO DO?: https://github.com/flutter/flutter/issues/50087
  }) : source = input.replaceAll('\t', ' ' * tabSize);

  List<TextSpan> _convert(List<Node> nodes) {
    List<TextSpan> spans = [];
    var currentSpans = spans;
    List<List<TextSpan>> stack = [];

    // ignore: no_leading_underscores_for_local_identifiers
    _traverse(Node node) {
      if (node.value != null) {
        currentSpans.add(node.className == null ? TextSpan(text: node.value) : TextSpan(text: node.value, style: theme[node.className!]));
      } else if (node.children != null) {
        List<TextSpan> tmp = [];
        currentSpans.add(TextSpan(children: tmp, style: theme[node.className!]));
        stack.add(currentSpans);
        currentSpans = tmp;

        for (var n in node.children!) {
          _traverse(n);
          if (n == node.children!.last) {
            currentSpans = stack.isEmpty ? spans : stack.removeLast();
          }
        }
      }
    }

    for (var node in nodes) {
      _traverse(node);
    }

    return spans;
  }

  static const _rootKey = 'root';
  static const _defaultFontColor = Color(0xff000000);
  static const _defaultBackgroundColor = Color(0xffffffff);

  // See: https://github.com/flutter/flutter/issues/39998
  // So we just use monospace here for now
  static const _defaultFontFamily = 'monospace';

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    var _textStyle = TextStyle(
      fontFamily: _defaultFontFamily,
      color: theme[_rootKey]?.color ?? _defaultFontColor,
    );
    if (textStyle != null) {
      _textStyle = _textStyle.merge(textStyle);
    }

    final ThemeData t = Theme.of(context);
    return Container(
      color: theme[_rootKey]?.backgroundColor ?? _defaultBackgroundColor,
      padding: padding,
      // update:RichText->SelectableText ,  SelectableText不兼容SelectionArea
      // origin: https://github.com/git-touch/highlight.dart/blob/v0.7.0/flutter_highlight/lib/flutter_highlight.dart
      // child: RichText(
      //   text: TextSpan(
      child: SelectableText.rich(
        TextSpan(
          style: _textStyle,
          children: _convert(highlight.parse(source, language: language).nodes!),
        ),
      ),
    );
  }
}
