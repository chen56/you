import 'package:flutter/widgets.dart';
import 'package:flutter_note/page.dart';

PageMeta page = PageMeta(
  shortTitle: "dart 3 新特性",
  builder: build,
);

build(Pen pen, BuildContext context) {
  pen.markdown(r'''
## dart 3  暂时放弃，等稳定后再搞

# type

interface class
base class
final class
sealed class
mixin class

# records

# match

  ''');
}
