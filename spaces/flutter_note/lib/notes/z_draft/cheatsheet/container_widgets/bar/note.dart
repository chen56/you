import 'package:flutter/material.dart';
import 'package:note/note.dart';

build(BuildContext context, Pen print) {
  print.markdown(r'''
# bar

## ButtonBar

按钮的布局容器，可以按内容的实际宽度在行或列之间调整，您把下面范例中父容器Container.width调小些看看：

  ''');

  print.$____________________________________________________________________();
  print(
    WidgetContent(Container(
      width: 800,
      color: Colors.blueAccent.shade100,
      child: ButtonBar(
        children: [
          ElevatedButton(
              onPressed: () {}, child: Text("ElevatedButton")),
          OutlinedButton(
              onPressed: () {}, child: Text('OutlinedButton')),
          CheckboxMenuButton(
              value: true,
              onChanged: (bool? value) {},
              child: Text('CheckboxMenuButton')),
        ],
      ),
    )),
  );
}
