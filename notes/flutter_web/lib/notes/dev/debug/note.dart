import 'package:flutter/widgets.dart';
import 'package:you_note_dart/note.dart';

void build(BuildContext context, Print print) async {
  print(const MD(r'''
## 打印组件树

```dart
print(WidgetInspectorService.instance.getRootWidgetSummaryTree("groupName"));

print(WidgetsBinding.instance.renderViewElement?.toDiagnosticsNode().toStringDeep());
```

  '''));
}
