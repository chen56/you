# component mate

分离的mate包，主要是想模仿被生成的组件库的包可见性关系，比如：
- flutter/widgets.dart 公开
- flutter/src/widgets/container.dart 被隐藏

这样在pages里的引用就可以和原组件引用模式类似：

```dart
// import 'package:flutter/widgets.dart';
// to:
import 'package:mate/flutter/widgets.dart';

// import 'package:flutter/material.dart';
// to:
import 'package:mate/flutter/material.dart';
```
