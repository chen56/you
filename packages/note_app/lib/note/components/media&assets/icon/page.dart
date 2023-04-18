import 'package:flutter/material.dart';
import 'package:note/mate.dart';
import 'package:note/page_core.dart';
import 'package:note_mate_flutter/mate_icons.g.dart' as mate_icons;
import 'package:note_mate_flutter/material.dart';

PageMeta page = PageMeta(
  shortTitle: "Icon",
  builder: build,
);

Set<String> iconExts = {"sharp", "rounded", "outlined"};
IconRegister materialIconRegister = mate_icons.registerIcon();
Map<String, IconData> icons = materialIconRegister.icons.map((key, value) => MapEntry(value, key));
List<String> mainIconNames = icons.keys
    .where((name) => iconExts.every((iconExt) => !name.endsWith(iconExt)))
    .toList()
  ..sort((a, b) => a.compareTo(b));

build(BuildContext context, Pen print) {
  print.markdown('''
# Material Icon

官方图标库：package:flutter/material/icons.dart

## 基本用法

  ''');

  print.nextCell___________________________();
  // ignore: constant_identifier_names
  const access_time__icons = {
    "access_time",
    "access_time_outlined",
    "access_time_sharp",
    "access_time_filled"
  };
  for (var name in access_time__icons) {
    print(SampleContent(Row$Mate(
      children: [
        Icon$Mate(
          icons[name],
          size: 24,
          color: Colors.blue,
        ),
        Text("Icons.$name"),
      ],
    )));
  }

  print.nextCell___________________________();
  print.markdown('''
## 图标浏览

package:flutter/material/icons.dart 图标库，共图标 ${icons.length}个，大多命名为以下规律：

- Icons.delete  (主图标)
- Icons.delete_sharp (加后缀的扩展图标)
- Icons.delete_rounded (加后缀的扩展图标)
- Icons.delete_outlined (加后缀的扩展图标)

按此规律，共有 ${mainIconNames.length}组， 不符合此规律的图标暂未收录.
  ''');

  print.nextCell___________________________();
  ValueNotifier<Set<String>> currentSelect = ValueNotifier({""});
  print(ValueListenableBuilder(
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
                .expand((mainName) => currentSelect.value.map((suffix) => "$mainName$suffix"))
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
      }));
}
