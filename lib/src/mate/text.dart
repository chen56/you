import 'package:flutter/widgets.dart';

import 'mate.dart';

class TextMate extends WidgetMate {
  String? data;
  TextAlign? textAlign;
  final String constructor;
  InlineSpan? textSpan;

  static var help;

  TextMate(
    String this.data, {
    this.textAlign,
  }) : constructor = "TextMate";

  TextMate.rich(
    InlineSpan this.textSpan, {
    this.textAlign,
  }) : constructor = "TextMate.rich";

  Widget build(BuildContext context) {
    return Text(
      data!,
      textAlign: textAlign,
    );
  }
}
