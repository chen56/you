import 'package:flutter/widgets.dart';
import 'package:note/note_page.dart';

build(BuildContext context, Pen print) async {
  print.markdown(r'''
## 打印组件树

```dart
print(WidgetInspectorService.instance.getRootWidgetSummaryTree("groupName"));

print(WidgetsBinding.instance.renderViewElement?.toDiagnosticsNode().toStringDeep());
```

  ''');
}
