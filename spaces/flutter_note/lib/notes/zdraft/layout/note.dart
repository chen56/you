import 'package:flutter/widgets.dart';
import 'package:note/note.dart';

build(BuildContext context, Pen print) {
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
  ''');
}
