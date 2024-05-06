import 'package:flutter/widgets.dart';
import 'package:you_flutter/note.dart';
import 'package:you_flutter/router.dart';

@PageMeta(label: "笔记", toType: ToNote)
void build(BuildContext context, Cell print) {
  print(const MD(r'''
# home

本页面应该是不暴露的 ,但现在并未做任何限制，通过 / 可以看到

  '''));
}
