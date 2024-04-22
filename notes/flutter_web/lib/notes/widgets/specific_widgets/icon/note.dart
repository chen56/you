import 'package:flutter/material.dart';
import 'package:you_note_dart/note.dart';

// [   +4 ms] Font asset "MaterialIcons-Regular.otf" was tree-shaken,
// reducing it from 1645184 to 10272 bytes (99.4% reduction).
// Tree-shaking can be disabled by providing the --no-tree-shake-icons flag
// import 'package:mate_flutter/mate_icons.g.dart' deferred as deferred_icons;

Set<String> iconTypes = {"sharp", "rounded", "outlined"};

void build(BuildContext context, Cell print) {
  print.markdown('''
# Material Icon

官方图标库：package:flutter/material/icons.dart

## 基本用法

  ''');

  print = print.next(title: const Text("new cell-----------------"));
  // ignore: constant_identifier_names
  var sampleIcons = {"access_time": Icons.access_time, "access_time_outlined": Icons.access_time_outlined, "access_time_sharp": Icons.access_time_sharp, "access_time_filled": Icons.access_time_filled};
  for (var entry in sampleIcons.entries) {
    var (name, iconData) = (entry.key, entry.value);
    print(Row(
      children: [
        Icon(iconData, size: 24, color: Colors.blue),
        Text("Icons.$name"),
      ],
    ));
  }
}
