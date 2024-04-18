import 'package:flutter/material.dart';
import 'package:note_dart/note.dart';

build(BuildContext context, Pen print) {
  print.markdown(r'''
# Remote flutter view

设想：

 web or desktop flutter client   --------->  remote linux flutter app process

能否通过拦截Canvas的绘制，实时同步绘制操作到client，以做到操作client,实际是在操作远程flutter app
的效果？

备选参考信息：

- Canvas
- PaintingContext
- SceneBuilder Scene
- Layer
- RenderView
- PipelineOwner
- RenderView.compositeFrame Actually causes the output of the rendering pipeline to appear on screen
- RendererBinding
- Window

Canvas是PaintingContext创建的，而PaintingContext是在PaintingContext._repaintCompositedChild
static方法中创建的：
```dart
static PaintingContext._repaintCompositedChild(){
  childContext ??= PaintingContext(childLayer, child.paintBounds)
}
```

我们来追一下，如何能插入自定义的PaintingContext
第一条路：不通
```dart
WidgetInspectorService.instance.screenshot() //最外层了
  -> static _ScreenshotPaintingContext.toImage()
    -> PaintingContext.debugInstrumentRepaintCompositedChild(_ScreenshotPaintingContext()) //关键,但此路不通！
       ->  PaintingContext._repaintCompositedChild(/*PaintingContext*/ childContext: customContext)
         -> childContext ??= PaintingContext(childLayer, child.paintBounds)  //我们想自定义这个实例
```

入口是screenshot，不是主流程对我们没啥用。

第二条路：
```dart
-> RendererBinding.initInstances() //最外层了
  -> addPersistentFrameCallback(_handlePersistentFrameCallback);
    -> /*RendererBinding*/this._handlePersistentFrameCallback()
      -> this.drawFrame(); //in RendererBinding
        -> pipelineOwner.flushPaint();
          -> PaintingContext.repaintCompositedChild(node as RenderObject,/*注意这个函数没有PaintingContext参数*/) // 关键
            -> PaintingContext._repaintCompositedChild(childContext: null)
              -> childContext ??= PaintingContext(childLayer, child.paintBounds) //我们想自定义这个实例
```
由于在PaintingContext.repaintCompositedChild没有PaintingContext参数，打断了我们想传递自定义PaintingContext的企图。
但如果把pipelineOwner.flushPaint()替换掉，让它改调用PaintingContext.debugInstrumentRepaintCompositedChild(PaintingContext)
可能是可行的。

  ''');
}
