import 'package:flutter/material.dart';
import 'package:note/page_core.dart';
import 'package:note_mate_flutter/material.dart';

PageMeta page = PageMeta(
  shortTitle: "工具栏",
  builder: build,
);

build(BuildContext context, Pen pen, MainCell print) {
  pen.markdown(r'''
# bar

## ButtonBar 

按钮的布局容器，可以按内容的实际宽度在行或列之间调整，您把下面范例中父容器Container.width调小些看看：

  ''');

  pen.cell((context, print) {
    print(
      SampleNote(Container$Mate(
        width: 800,
        color: Colors.blueAccent.shade100,
        child: ButtonBar$Mate(
          children: [
            ElevatedButton$Mate(onPressed: () {}, child: Text$Mate("ElevatedButton")),
            OutlinedButton$Mate(onPressed: () {}, child: Text$Mate('OutlinedButton')),
            CheckboxMenuButton$Mate(
                value: true, onChanged: (bool? value) {}, child: Text$Mate('CheckboxMenuButton')),
          ],
        ),
      )),
    );
  });
}
