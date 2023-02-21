import 'package:flutter/widgets.dart';
import 'package:learn_flutter/page.dart';

PageMeta rootPage = PageMeta(
  shortTitle: "dart 3 新特性",
  builder: build,
);

build(Pen pen, BuildContext context) {
  pen.markdown(r'''
## dart 3 

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
