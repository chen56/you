import 'package:flutter/widgets.dart';
import 'package:note/note_core.dart';

NoteConfPart page = NoteConfPart(
  shortTitle: "debug相关",
  builder: build,
);

build(BuildContext context, Pen print) async {
  print.markdown(r'''
## 打印组件树 

```dart
print(WidgetInspectorService.instance.getRootWidgetSummaryTree("groupName"));

print(WidgetsBinding.instance.renderViewElement?.toDiagnosticsNode().toStringDeep());
```

  ''');
}
