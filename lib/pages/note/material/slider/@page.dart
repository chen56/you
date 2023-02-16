import 'package:flutter/widgets.dart';
import 'package:learn_flutter/page.dart';


PageMeta widgetSliderNote = PageMeta(
  title: "Slider",
  builder: build,
);

build(Pen pen ,BuildContext context) {
  pen. markdown(r'''
## 范例1 普通文本 

Text.new()

  ''');


  pen. markdown(r'''
## 范例1 富文本 

Text.rich()

  ''');

}
