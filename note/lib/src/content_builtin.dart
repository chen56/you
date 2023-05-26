import 'package:flutter/material.dart';
import 'package:flutter_highlight/themes/vs2015.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:note/note_core.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:note/src/flutter_highlight.dart';
import 'package:note/utils_core.dart';

class NoteContentExtensions {
  final List<NoteContentExt> contentExtensions;

  NoteContentExtensions.ext(List<NoteContentExt> contentExtensions)
      : contentExtensions = [
          ...contentExtensions,
          MarkdownContentExtension(),
          WidgetContentExtension(),
          _ObjectContentExt(),
        ];

  NoteWidgetMinin create(Object? data, ContentArg arg) {
    for (var ext in contentExtensions) {
      var w = ext.create(data, arg);
      if (w != null) {
        return w;
      }
    }
    throw Exception(
        "Must provide NoteContentExt for data <$data> of type <${data.runtimeType}>");
  }
}

abstract class NoteContentExt {
  NoteWidgetMinin? create(Object? data, ContentArg arg);
}

class ContentArg {
  final NoteCell cell;
  final Outline outline;

  ContentArg({required this.cell, required this.outline});
}

class _ObjectContentExt extends NoteContentExt {
  _ObjectContentExt();

  @override
  NoteWidgetMinin? create(Object? data, ContentArg arg) {
    return ObjectContentWidget(content: ObjectContent(data));
  }
}

class ObjectContent extends NoteContent {
  final Object? object;

  ObjectContent(this.object);

  @override
  String toString() {
    return "ObjectNote('${object?.toString()}')";
  }
}

class ObjectContentWidget extends StatelessWidget with NoteWidgetMinin {
  final ObjectContent content;

  const ObjectContentWidget({super.key, required this.content});

  @override
  get isMarkdown => false;

  @override
  Widget build(BuildContext context) {
    return SelectableText("${content.object}");
  }
}

class WidgetContentExtension extends NoteContentExt {
  WidgetContentExtension();

  @override
  NoteWidgetMinin? create(Object? data, ContentArg arg) {
    if (data is Widget) {
      return WidgetContentWidget(content: WidgetContent(data));
    } else if (data is WidgetContent) {
      return WidgetContentWidget(content: data);
    }
    return null;
  }
}

class WidgetContentWidget extends StatelessWidget with NoteWidgetMinin {
  final WidgetContent content;

  const WidgetContentWidget({super.key, required this.content});

  @override
  get isMarkdown => false;

  @override
  Widget build(BuildContext context) {
    return content.widget;
  }
}

class WidgetContent extends NoteContent {
  final Widget widget;

  WidgetContent(this.widget);

  @override
  String toString() {
    return "WidgetNote('${widget.runtimeType}')";
  }
}

class MarkdownContentExtension extends NoteContentExt {
  MarkdownContentExtension();

  @override
  NoteWidgetMinin? create(Object? data, ContentArg arg) {
    if (data is MarkdownContent) {
      return MarkdownContentWidget(outline: arg.outline, content: data);
    } else if (data is WidgetContent) {
      return WidgetContentWidget(content: data);
    }
    return null;
  }
}

extension MarkdownCellExtension on NoteCell {
  void markdown(String content) {
    call(MarkdownContent(content));
  }
}

extension MarkdownPenExtension on Pen {
  void markdown(String content) {
    call(MarkdownContent(content));
  }
}

class MarkdownContent extends NoteContent {
  final String content;

  MarkdownContent(this.content);

  @override
  String toString() {
    return "MarkdownContent('${content.replaceAll("\n", "\\n").safeSubstring(0, 50)}')";
  }
}

class MarkdownContentWidget extends StatelessWidget with NoteWidgetMinin {
  final Outline outline;
  final MarkdownContent content;
  final ScrollController controller = ScrollController();

  MarkdownContentWidget(
      {super.key, required this.outline, required this.content});

  @override
  Widget build(BuildContext context) {
    var headerBuilder = _HeaderBuilder(outline);
    return Markdown(
      data: content.content,
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

  @override
  get isMarkdown => true;
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
                style: preferredStyle?.copyWith(
                    height: 2, fontWeight: FontWeight.bold),
                text: text.text),
            style: preferredStyle,
          )),
    );
    return Column(
      children: [
        heading,
        // h1 h2 加个横线
        if (currentNode!.heading <= 2) const Divider(height: 20, thickness: 1),
      ],
    );
  }

  @override
  void visitElementBefore(md.Element element) {
    // tag value : h1 | h2 | h3 ....
    currentNode = OutlineNode(
      // globalKey用来滚动到此位置
      key: GlobalKey(),
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
      padding: const EdgeInsets.all(12),

      // Specify text style
      textStyle: const TextStyle(
        fontFamily: 'My awesome monospace font',
        fontSize: 16,
      ),
    );
    var noScroll = Row(
      children: [
        Expanded(child: highlight),
      ],
    );

    //目前看，markdown中的code/prd 不滚动是不是更好些，一般内容不会很长
    return Container(
      padding: const EdgeInsets.only(right: 100),
      child: noScroll,
    );
  }
}
