import 'package:flutter/material.dart';
import 'package:note/mate.dart';
import 'package:note/page_core.dart';

// [   +4 ms] Font asset "MaterialIcons-Regular.otf" was tree-shaken,
// reducing it from 1645184 to 10272 bytes (99.4% reduction).
// Tree-shaking can be disabled by providing the --no-tree-shake-icons flag
// import 'package:note_mate_flutter/mate_icons.g.dart' deferred as deferred_icons;

import 'package:note_mate_flutter/material.dart';

NoteConfPart page = NoteConfPart(
  shortTitle: "Icon",
  builder: build,
);

Set<String> iconTypes = {"sharp", "rounded", "outlined"};

build(BuildContext context, Pen print) {
  print.markdown('''
# Material Icon

官方图标库：package:flutter/material/icons.dart

## 基本用法

  ''');

  print.$____________________________________________________________________();
  // ignore: constant_identifier_names
  var sampleIcons = {
    "access_time": Icons.access_time,
    "access_time_outlined": Icons.access_time_outlined,
    "access_time_sharp": Icons.access_time_sharp,
    "access_time_filled": Icons.access_time_filled
  };
  for (var entry in sampleIcons.entries) {
    var (name, iconData) = (entry.key, entry.value);
    print(MateSample(Row$Mate(
      children: [
        Icon$Mate(iconData, size: 24, color: Colors.blue),
        Text$Mate("Icons.$name"),
      ],
    )));
  }
// 暂时放弃此范例，因为图标库太大
//   print.$____________________________________________________________________();
//   print.markdown('''
// ## 图标浏览
//
// 主图标及扩展图标的范例：
//
// - Icons.delete  (主图标)
// - Icons.delete_sharp (加后缀的扩展图标)
// - Icons.delete_rounded (加后缀的扩展图标)
// - Icons.delete_outlined (加后缀的扩展图标)
//
// 下面加载所有图标库，需要几秒钟，请耐心等待：
//   ''');
//   // 按此规律，共有 ${mainIconNames.length}组， 不符合此规律的图标暂未收录.
//   // package:flutter/material/icons.dart 图标库，共图标 ${icons.length}个，大多命名为以下规律：
//   print.$____________________________________________________________________();
//   // why wait 3 seconds? because load library will stuck the ui thread.
//   var iconsFutrue = Future.delayed(const Duration(seconds: 3)).then((value) =>
//       deferred_icons
//           .loadLibrary()
//           .then((value) => deferred_icons.registerIcon()));
//   print(FutureBuilder(
//       future: iconsFutrue,
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           if (snapshot.hasError) {
//             return Text(
//                 'icons load error :${snapshot.error} \n ${snapshot.stackTrace} ');
//           }
//           var result = iconsWidget(snapshot.data!);
//           return result;
//         }
//         return const CircularProgressIndicator();
//       }));
}

Widget iconsWidget(IconRegister iconRegister) {
  ValueNotifier<Set<String>> currentSelect = ValueNotifier({""});
  Map<String, IconData> icons =
      iconRegister.icons.map((key, value) => MapEntry(value, key));
  List<String> mainIconNames = icons.keys
      .where((name) => iconTypes.every((iconExt) => !name.endsWith(iconExt)))
      .toList()
    ..sort((a, b) => a.compareTo(b));

  return ValueListenableBuilder(
      valueListenable: currentSelect,
      builder: (context, value, child) {
        // 扩展后缀选择器
        var iconSelect = Row(children: [
          SegmentedButton(
            segments: const [
              ButtonSegment(
                value: '',
                icon: Icon(Icons.work_history),
                label: Text('主图标'),
              ),
              ButtonSegment(
                value: '_outlined',
                icon: Icon(Icons.work_history_outlined),
                label: Text('outlined'),
              ),
              ButtonSegment(
                value: '_rounded',
                icon: Icon(Icons.work_history_rounded),
                label: Text('rounded'),
              ),
              ButtonSegment(
                value: '_sharp',
                icon: Icon(Icons.work_history_sharp),
                label: Text('sharp'),
              ),
            ],
            selected: currentSelect.value,
            onSelectionChanged: (Set<String> extSuffixs) {
              currentSelect.value = extSuffixs;
            },
            multiSelectionEnabled: true,
          )
        ]);
        var selectedResult = Wrap(
          children: [
            ...mainIconNames
                .expand((mainName) =>
                    currentSelect.value.map((suffix) => "$mainName$suffix"))
                .where((name) => icons.containsKey(name))
                .map((name) {
              assert(icons.containsKey(name), "icon $name should be exists");
              var icon = icons[name];
              var iconWithTip = Tooltip(
                message: name,
                child: Icon(icon),
              );
              return iconWithTip;
            }),
          ],
        );
        return Column(
          children: [
            iconSelect,
            selectedResult,
          ],
        );
      });
}
