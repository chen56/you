import 'package:flutter/widgets.dart';
import 'package:you_flutter/note.dart';

void build(BuildContext context, Cell print) {
  print(const MD(r'''
# flutter State

StatefulWidget 重要特性：
- 会在窗口resize时重新build


## state 持久化

RestorationMixin
WidgetsApp.restorationScopeId
  '''));
}
