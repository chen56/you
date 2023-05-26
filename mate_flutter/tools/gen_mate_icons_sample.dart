//仅用来引用一下，防止被IDE自动删除，无其他作用
// ignore_for_file: unused_import

// import 'package:flutter/material.dart' show Icons;
export 'package:flutter/src/material/icons.dart' show Icons;
// export 'package:flutter/material.dart' show Icons;
// IF directly Scan the flutter/src/material/icons.dart file,
// get Icons.xxxx field type is dynamic,can not get right field type, so use this sample file .
// AnalysisContextCollection(
//     includedPaths: [flutter/src/material/icons.dart],
//   )
