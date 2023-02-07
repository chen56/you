import 'package:flutter/widgets.dart';
import 'package:learn_flutter/note.dart';

PageMeta devDebugNote = PageMeta(
  title: "debug相关",
  builder: build,
);

build(Pen note, BuildContext context) {
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
