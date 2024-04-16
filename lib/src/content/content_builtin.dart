import 'package:flutter/material.dart';
import 'package:flutter_highlight/themes/vs2015.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:note/note.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:note/src/flutter_highlight.dart';
import 'package:note/src/note_core.dart';
import 'package:note/src/utils_core.dart';

class ObjectContentExt extends NoteContentExt {
  ObjectContentExt();

  @override
  NoteContentWidgetMixin? create(Object? data, NoteContentArg arg) {
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

class ObjectContentWidget extends StatelessWidget with NoteContentWidgetMixin {
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
  NoteContentWidgetMixin? create(Object? data, NoteContentArg arg) {
    if (data is Widget) {
      return WidgetContentWidget(content: WidgetContent(data));
    } else if (data is WidgetContent) {
      return WidgetContentWidget(content: data);
    }
    return null;
  }
}

class WidgetContentWidget extends StatelessWidget with NoteContentWidgetMixin {
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
  NoteContentWidgetMixin? create(Object? data, NoteContentArg arg) {
    if (data is MarkdownContent) {
      return MarkdownContentWidget(outline: arg.outline, content: data);
    } else if (data is WidgetContent) {
      return WidgetContentWidget(content: data);
    }
    return null;
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

class MarkdownContentWidget extends StatelessWidget with NoteContentWidgetMixin {
  final Outline outline;
  final MarkdownContent content;
  final ScrollController controller = ScrollController();

  MarkdownContentWidget({super.key, required this.outline, required this.content});

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
            TextSpan(style: preferredStyle?.copyWith(height: 2, fontWeight: FontWeight.bold), text: text.text),
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

/// 样机只是展示风格的装饰器吧？应该可以让所有内容都可以配置
/// 在页面上表现一个样机的模样：模仿浏览器、桌面窗口、手机
/// 我们约束child为tight模式，以模仿最外层窗口
/// 参考: https://daisyui.com/components/mockup-window/
class MockupContent extends StatelessWidget {
  final Widget? child;
  final double? width;
  final double? height;
  final String title;

  const MockupContent({
    super.key,
    this.title = "样机：固定宽高限制",
    double? width,
    double? height,
    this.child,
  })  : width = (width == null || width == double.infinity) ? 400 : width,
        height = (height == null || height == double.infinity) ? 50 : height;

  /// call() == withChild copy
  MockupContent call(Widget child) {
    return MockupContent(
      key: key,
      width: width,
      height: height,
      child: child,
    );
  }

  MockupContent withChild(Widget child) {
    return MockupContent(
      key: key,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          AppBar(
            title: Text(title),
            leading: IconButton(icon: const Icon(Icons.fullscreen_exit), onPressed: () {}),
            actions: <Widget>[
              IconButton(icon: const Icon(Icons.fullscreen_exit), onPressed: () {}),
              IconButton(icon: const Icon(Icons.fullscreen), onPressed: () {}),
            ],
          ),
          // Column是无限高，但我们约束child为tight模式，以模仿窗口
          ConstrainedBox(constraints: BoxConstraints.tightFor(width: width, height: height), child: child),
        ],
      ),
    );
  }
}
