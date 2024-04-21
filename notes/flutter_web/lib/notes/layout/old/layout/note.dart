import 'package:flutter/widgets.dart';
import 'package:you_note_dart/note.dart';

void build(BuildContext context, CellPrint print) {
  print.markdown(r'''

# 布局

## 约束

LayoutBuilder

## 弹性布局

- Flex <https://api.flutter-io.cn/flutter/widgets/Flex-class.html>
  - Row
  - Column

## 布局故障处理：IntrinsicHeight
Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IntrinsicHeight(
            child: navigationRail,
          )
        ],
      )


## 布局问题

### Flex & Flexible

      // title 被Flexible包裹后，文本太长会自动换行
      // 但是Flexible要上面套一个Flex的子类
      var link_old = TextButton(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(iconExtend),
            Flexible(child: Text("🗓 ${node.shortTitle}")),
          ],
        ),
      );


### 填满空间


Column(
              children: [
                Expanded(child: Container(color: Colors.red,height: 100,)),
                Expanded(child: Container(color: Colors.green,height: 100,)),
                Flexible(
                    child: Container(
                  child: TextButton(onPressed: () {}, child: Text("ss s")),
                )),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity,25), // NEW
                    ),
                    child: Text("ElevatedButton.style.minimumSize.width")),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text('SizedBox.width'))),
                MaterialButton(
                    minWidth: double.infinity,
                    onPressed: () {},
                    child: const Text('MaterialButton.minWidth')),
                ConstrainedBox(
                    constraints: const BoxConstraints(
                        minWidth: double.infinity, minHeight: 70),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('ConstrainedBox.constraints.minWidth'),
                    )),
                const Spacer(),
              ],
            )

  ''');
}
