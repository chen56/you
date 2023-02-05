import 'package:learn_flutter/note/@common/note.dart';

Pag note = Pag(
  "最原始的状态管理",
);

build() {
  note.markdown(r'''
## 范例1 普通文本 

print(WidgetInspectorService.instance.getRootWidgetSummaryTree("groupName"));

打印组件树

print(WidgetsBinding.instance.renderViewElement?.toDiagnosticsNode().toStringDeep());


  ''');


  note.markdown(r'''
## 范例1 普通文本 

  ''');

}
