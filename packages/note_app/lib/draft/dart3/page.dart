import 'package:flutter/widgets.dart';
import 'package:note/page_core.dart';

PageMeta page = PageMeta(
  shortTitle: "dart 3 新特性",
  builder: build,
);

build(BuildContext context, Pen pen, MainCell print) {
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
