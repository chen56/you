import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:learn_flutter/page.dart';
import 'package:markdown/markdown.dart' as md;


class MarkdownView extends StatelessWidget {
  final Outline outline;
  final String content;
  ScrollController controller = ScrollController();

  MarkdownView({super.key, required this.outline, required this.content});

  @override
  Widget build(BuildContext context) {
    var headerBuilder = _CenteredHeaderBuilder(outline);
    return MarkdownBody(
      data: content,
      selectable: true,
      // 得研究下controller层层嵌套要怎么用
      // controller: controller,
      shrinkWrap: true,

      builders: <String, MarkdownElementBuilder>{
        'h1': headerBuilder,
        'h2': headerBuilder,
        'h3': headerBuilder,
        'h4': headerBuilder,
        'h5': headerBuilder,
        'h6': headerBuilder,
        'h7': headerBuilder,
      },
    );
  }
}


class _CenteredHeaderBuilder extends MarkdownElementBuilder {
  final Outline outline;

  _CenteredHeaderBuilder(this.outline);

  OutlineNode? currentNode;

  @override
  Widget? visitText(md.Text text, TextStyle? preferredStyle) {
    // 我们假设每一个header 都按顺序调用visitElementBefore->visitText
    // 加个守卫语句，防止flutter-markdown没有按顺序调用导致无效head
    if (currentNode == null) {
      return null;
    }
    outline.add(currentNode!);
    var divider = const Divider(
      height: 20,
      thickness: 1,
      // indent: 20,
      // endIndent: 20,
    );

    var heading = Flexible(
      fit: FlexFit.tight,
      flex: 0,
      child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            key: currentNode!.key,
            text.text,
            style: preferredStyle!.copyWith(height: 2),
          )),
    );
    return Column(
      children: [
        heading,
        // h1 h2 加个横线
        if (currentNode!.heading <= 2) divider,
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
