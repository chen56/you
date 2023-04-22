// ignore_for_file: file_names

import 'package:flutter/widgets.dart';
import 'package:note/page_core.dart';

PageMeta page = PageMeta(
  shortTitle: "web optimization",
  builder: build,
);

build(BuildContext context, Pen print) {
  print.markdown(r'''
# web 优化 

## web加载优化

### 参考

#### FlorianFlatscher

FlorianFlatscher commented on Feb 13 2023
<https://github.com/flutter/flutter/issues/46589#issuecomment-1427138076>

> Started with ~4MB main.dart.js
> Discovered that https://pub.dev/packages/syncfusion_flutter_pdfviewer contributes a lot, using the mobile bundle analysis.
> By loading the PDF view deferred I decreased my main.dart.js by more than 1MB 😋
> Used deferred loading for other routes as well => only minor improvement
> I adobted the index.html from flutter gallery: https://github.com/flutter/gallery/blob/main/web/index.html (made the loading animation much more enjoyable)
> Added compression to my NGINX proxy. Now my main.dart.js file is only ~0.8MB 😵


#### defer how to

onahwilliams commented on Feb 6, 2020
<https://github.com/flutter/flutter/issues/50196#issuecomment-582503489>

```dart
import 'mywidget.dart' deferred as foo

final Future<void> loadedLibrary = foo.loadLibrary();

Widget build(BuildContext context) {
  return FutureBuilder(future: loadedLibrary, (snapshot, context) { return foo.MyWidget(); });
}
```


## SEO

to do

  ''');
}
