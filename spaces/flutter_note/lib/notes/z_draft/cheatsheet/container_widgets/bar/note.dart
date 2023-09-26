import 'package:flutter/material.dart';
import 'package:mate/mate_note.dart';
import 'package:note/note.dart';
import 'package:mate_flutter/material.dart';

build(BuildContext context, Pen print) {
  print.markdown(r'''
# bar

## ButtonBar

按钮的布局容器，可以按内容的实际宽度在行或列之间调整，您把下面范例中父容器Container.width调小些看看：

  ''');

  print.$____________________________________________________________________();
  print(
    MateSampleContent(Container$Mate(
      width: 800,
      color: Colors.blueAccent.shade100,
      child: ButtonBar$Mate(
        children: [
          ElevatedButton$Mate(
              onPressed: () {}, child: Text$Mate("ElevatedButton")),
          OutlinedButton$Mate(
              onPressed: () {}, child: Text$Mate('OutlinedButton')),
          CheckboxMenuButton$Mate(
              value: true,
              onChanged: (bool? value) {},
              child: Text$Mate('CheckboxMenuButton')),
        ],
      ),
    )),
  );
}
