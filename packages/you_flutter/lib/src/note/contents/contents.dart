import 'package:flutter/widgets.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:you_flutter/src/note/contents/markdown_content.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

final Contents contents = Contents._();

class Contents {
  Contents._();

  Widget contentToWidget(content) {
    return switch (content) {
      MD _ => MarkdownBody(
          data: content.text,
          onTapLink: (String text, String? href, String title) async {
            if (href == null) return;
            await url_launcher.launchUrl(Uri.parse(href));
          },
        ),
      Widget _ => content,
      _ => Text("$content"),
    };
  }
}
