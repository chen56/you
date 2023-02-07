import 'package:flutter/widgets.dart';
import 'package:learn_flutter/note.dart';


PageMeta widgetSliderNote = PageMeta(
  title: "Slider",
  builder: build,
);

build(Pen note ,BuildContext context) {
  note.markdown(r'''
## 范例1 普通文本 

Text.new()

  ''');


  note.markdown(r'''
## 范例1 富文本 

Text.rich()

  ''');

}
