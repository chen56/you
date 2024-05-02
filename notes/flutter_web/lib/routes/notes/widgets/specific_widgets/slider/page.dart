import 'package:flutter/widgets.dart';
import 'package:you_flutter/note.dart';

void build(BuildContext context, Cell print) {
  print(const MD(r'''
# 进度条

## 范例1 普通文本

Text.new()

  '''));

  print(const MD(r'''
## 范例1 富文本

Text.rich()

  '''));
}
