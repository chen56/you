import 'package:flutter/material.dart';
import 'package:flutter_highlight/themes/vs2015.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_note/page.dart';
import 'package:highlight/highlight.dart' show highlight, Node;
import 'package:markdown/markdown.dart' as md;

class MarkdownView extends StatelessWidget {
  final Outline outline;
  final String content;
  ScrollController controller = ScrollController();

  MarkdownView({super.key, required this.outline, required this.content});

  @override
  Widget build(BuildContext context) {
    var headerBuilder = _HeaderBuilder(outline);
    return Markdown(
      data: content,
      selectable: true,
      // 得研究下controller层层嵌套要怎么用
      controller: controller,
      shrinkWrap: true,

      builders: <String, MarkdownElementBuilder>{
        'h1': headerBuilder,
        'h2': headerBuilder,
        'h3': headerBuilder,
        'h4': headerBuilder,
        'h5': headerBuilder,
        'h6': headerBuilder,
        'h7': headerBuilder,
        'pre': _PreBuilder(),
      },
    );
  }
}

class _HeaderBuilder extends MarkdownElementBuilder {
  final Outline outline;

  _HeaderBuilder(this.outline);

  OutlineNode? currentNode;

  @override
  Widget? visitText(md.Text text, TextStyle? preferredStyle) {
    // 我们假设每一个header 都按顺序调用visitElementBefore->visitText
    // 加个守卫语句，防止flutter-markdown没有按顺序调用导致无效head
    if (currentNode == null) {
      return null;
    }
    outline.add(currentNode!);
    var heading = Flexible(
      key: currentNode!.key,
      fit: FlexFit.tight,
      flex: 0,
      child: Align(
          alignment: Alignment.centerLeft,
          child: SelectableText.rich(
            TextSpan(
                style: preferredStyle?.copyWith(height: 2, fontWeight: FontWeight.bold),
                text: text.text),
            style: preferredStyle,
          )),
    );
    return Column(
      children: [
        heading,
        // h1 h2 加个横线
        if (currentNode!.heading <= 2) Divider(height: 20, thickness: 1),
      ],
    );
  }

  @override
  void visitElementBefore(md.Element element) {
    // tag value : h1 | h2 | h3 ....
    currentNode = OutlineNode(
      // globalKey用来滚动到此位置
      key: GlobalKey()!,
      heading: int.parse(element.tag.substring(1)),
      title: element.textContent,
    );
    // super.visitElementBefore(element);
  }
}

class _PreBuilder extends MarkdownElementBuilder {
  ScrollController controller = ScrollController();

  _PreBuilder();

  @override
  Widget? visitText(md.Text text, TextStyle? preferredStyle) {
    var highlight = HighlightView(
      // The original code to be highlighted
      text.textContent,

      // Specify language
      // It is recommended to give it a value for performance
      language: 'dart',

      // Specify highlight theme
      // All available themes are listed in `themes` folder
      theme: vs2015Theme,

      // Specify padding
      padding: EdgeInsets.all(12),

      // Specify text style
      textStyle: TextStyle(
        fontFamily: 'My awesome monospace font',
        fontSize: 16,
      ),
    );
    var noScroll = Row(
      children: [
        Expanded(child: highlight),
      ],
    );

    var listView = ListView.separated(
      shrinkWrap: true,
      itemCount: 1,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (context, int index) {
        return highlight;
      },
    );
    Scrollbar scroll = Scrollbar(
      controller: controller,
      child: SingleChildScrollView(
        child: highlight,
      ),
    );
    //目前看，markdown中的code/prd 不滚动是不是更好些，一般内容不会很长
    return Container(
      padding: EdgeInsets.only(right: 100),
      child: noScroll,
    );
  }
}

// 我们需要可选的文本框，所以改八改八
// copy from https://github.com/git-touch/highlight.dart/blob/v0.7.0/flutter_highlight/lib/flutter_highlight.dart
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
    this.language,
    this.theme = const {},
    this.padding,
    this.textStyle,
    int tabSize = 8, // TODO: https://github.com/flutter/flutter/issues/50087
  }) : source = input.replaceAll('\t', ' ' * tabSize);

  List<TextSpan> _convert(List<Node> nodes) {
    List<TextSpan> spans = [];
    var currentSpans = spans;
    List<List<TextSpan>> stack = [];

    _traverse(Node node) {
      if (node.value != null) {
        currentSpans.add(node.className == null
            ? TextSpan(text: node.value)
            : TextSpan(text: node.value, style: theme[node.className!]));
      } else if (node.children != null) {
        List<TextSpan> tmp = [];
        currentSpans.add(TextSpan(children: tmp, style: theme[node.className!]));
        stack.add(currentSpans);
        currentSpans = tmp;

        node.children!.forEach((n) {
          _traverse(n);
          if (n == node.children!.last) {
            currentSpans = stack.isEmpty ? spans : stack.removeLast();
          }
        });
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

  // TODO: dart:io is not available at web platform currently
  // See: https://github.com/flutter/flutter/issues/39998
  // So we just use monospace here for now
  static const _defaultFontFamily = 'monospace';

  @override
  Widget build(BuildContext context) {
    var _textStyle = TextStyle(
      fontFamily: _defaultFontFamily,
      color: theme[_rootKey]?.color ?? _defaultFontColor,
    );
    if (textStyle != null) {
      _textStyle = _textStyle.merge(textStyle);
    }
    return Container(
      color: theme[_rootKey]?.backgroundColor ?? _defaultBackgroundColor,
      padding: padding,
      child: SelectableText.rich(
        TextSpan(
          style: _textStyle,
          children: _convert(highlight.parse(source, language: language).nodes!),
        ),
      ),
    );
  }
}
