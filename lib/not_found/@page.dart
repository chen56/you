import 'package:flutter/widgets.dart';
import 'package:learn_flutter/note.dart';

Meta notFoundPage = Meta(
  title: "404",
  builder: build,
);

build(Pen pen, BuildContext context) {
  pen. markdown(r'''
## 404 Not Found 


  ''');
}
