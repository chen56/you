# component mate

@deprecated 2024-01-24: 此包已废弃,虽然此包功能强大，但太复杂了，随着flutter版本升级，每次重新生成
都可能破坏原先的api。


> ⚠️ **注意**
> lib目录全是生成的类，lib可以随时删除重建，不要在里面编辑文件.

分离的mate包，主要是想模仿被生成的组件库的包可见性关系，比如：
- flutter/widgets.dart 公开
- flutter/src/widgets/container.dart 被隐藏

这样在pages里的引用就可以和原组件引用模式类似：
```dart
//from:
import 'package:flutter/material.dart';
// to:
import 'package:mate_flutter/material.dart';
```
