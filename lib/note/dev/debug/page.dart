import 'package:flutter/widgets.dart';
import 'package:learn_flutter/note/@common/note.dart';

NoteMeta devDebugNote = NoteMeta(
  title: "debug相关",
  builder: build,
);

build(Note note ,BuildContext context) {
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
