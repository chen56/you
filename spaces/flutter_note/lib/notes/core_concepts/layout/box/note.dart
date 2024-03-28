// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note/note.dart';
build(BuildContext context, Pen print) {
  print.markdown('''
# box layout
s
## 常用

垂直&水平排列的组件
- Flex: Flexbox布局模型,Flex(子类Row、Column)和Flexible（子类Expanded）组合
  - **Spacer**：
    - Spacer组件内部包装了一个Expanded，在`Row`或`Column`布局中占位，可以根据主轴方向自动拉伸占据剩余空间，辅助调整布局间距。
- **LayoutBuilder**：
  - 它根据父组件提供的布局约束来动态构建其子组件，使子组件能够适应不同尺寸的屏幕或容器。
- **填充大小相关**：
  - **FittedBox**：
    `FittedBox`是一个用于调整其子组件尺寸以适应可用空间的小部件。保证内容按比例适应容器。FittedBox提供了几种不同的`fit`模式，例如`BoxFit.contain`、`BoxFit.cover`、`BoxFit.fill`等，每种模式决定了内容如何适应容器的尺寸。
    - `FittedBox`主要作用在于调整内部子组件的尺寸，保证内容按比例适应容器，涉及内容的可视化展示。
  - **Placeholder**：
    `Placeholder`小部件通常用于占位，在加载数据或资源尚未准备就绪时显示临时内容。它可以作为一个视觉提示，提醒用户该位置的内容随后会被填充。它不具有自适应尺寸的功能，但可以设置默认尺寸，并且常与异步数据加载结合使用，确保即使在真实内容加载前也有良好的用户体验。
  - **Spacer**：
    上面已在Flex提到，主要用于分配布局中的空白空间。通常用于`Row`、`Column`或Flex布局中，作为填充空间的占位符。当希望某个方向上的剩余空间被均匀分配时，可以放置一个或多个Spacer。它没有自身的尺寸，而是根据Flex布局规则来决定占用的空间大小。
- **Stack**：Stack允许子组件堆叠展示，支持定位（alignment）和z轴排序（index），可以用于制作悬浮按钮、叠加图片、标签页指示器等效果。
  - **Positioned**: 在Stack中结合Positioned使用，可以更精确地控制子组件在Stack中的绝对位置。
  - **IndexedStack**: 允许在一组子组件中切换显示，类似TabView效果，通过索引值控制显示指定子组件。
- **Align**：Align组件可以用来对齐其子组件，根据alignment参数调整子组件在父组件中的位置。
   - **Center**：Align子类，Center组件将子组件居中显示，无论父容器大小如何变化，子组件始终保持居中。
- Wrap 组件用于包装多个子组件，当一行空间不足时自动换行，常见于创建标签列表、商品陈列等。
- **Wrap**：Wrap组件用于包装多个子组件，当一行空间不足时自动换行，常见于创建标签列表、商品陈列等。
- **ConstrainedBox**：为子组件添加额外的大小限制，常用于在自定义布局中施加特定的宽高约束。
  - **UnconstrainedBox**: 取消对其子组件的所有约束，使得子组件能自由根据其内容大小进行布局。
- **Container**: 虽然本身不是一个布局组件，但它提供了装饰、边距、填充等功能，结合其子组件可以实现复杂的布局效果。
- **Padding**：Padding组件用于在子组件周围添加内边距，可以在不影响子组件本身尺寸的前提下调整其在父容器中的位置。
- Table 和 DataTable：Table用于创建表格布局，可以灵活定义行和列的数量及内容。
  - **DataTable**： Table的增强版，为表格提供了更丰富的样式和交互功能，适合展示具有表头、索引列和操作列的数据。
- **FractionallySizedBox**：可以根据父容器尺寸按比例调整子组件的尺寸。
- IntrinsicHeight 和 IntrinsicWidth：这两个组件会使子组件的高度或宽度与其内容匹配，而不是依赖于外部约束。
- Flow：Flow组件允许子组件在二维平面上进行布局，可以实现一些自定义的复杂布局效果。
- CustomSingleChildLayout与CustomMultiChildLayout： 实现SingleChildLayoutDelegate/MultiChildLayoutDelegate自定义子组件的布局。
- LayoutId 和 CustomScrollView：在CustomScrollView中结合使用，可以实现自定义的滚动视图布局，如多个不同滚动速度的列表视图。
- 滚动类
  - ScrollView
    - ListView 可滚动的、单列数据的组件，支持垂直或水平滚动，结合ListView.builder可以高效地展示大量数据。
      - **ListView.separated**：与ListView类似，但提供了item之间插入分割线的功能。
    - GridView 网格布局，可以创建类似表格或卡片列表的效果，支持横向或纵向滚动。
    - **BoxScrollView**
    - **CustomScrollView**
  - NestedScrollView：在同一滚动视图中嵌套其他滚动视图，如顶部有一个固定的AppBar和底部有一个可滚动的列表。
- **Opacity**: 是一种可以改变其子组件透明度的布局组件。它并不会影响子组件的实际尺寸和布局，而是控制子组件的内容可视性。
- **PageView**
  - 用于实现滑动页面效果，常见于幻灯片、轮播图或页面间的滑动切换。
- **Hero动画**
  - 虽非布局组件，但与布局转换相关。它在不同路由或页面间实现元素共享及动画过渡，常用于Material Design中的共享元素过渡效果。
- **OverflowBox**
  - 允许其子组件的尺寸超出自身约束范围，适用于实现部分组件溢出父容器的情况。
- **Transform**
  - 提供对子组件的旋转、缩放和平移变换功能，在特定布局场景中也有应用。
- **ClipRect** 和 **ClipRRect**
  - 用于裁剪其子组件的绘制区域，尽管主要用于图形效果，但在实现特定布局和视觉效果时也会使用。
- **Layer** 类组件
  - 如 `RepaintBoundary`、`PhysicalModel`、`Opacity` 等，它们在Flutter渲染架构层面对布局和绘制产生影响，可用于优化性能或实现特殊视觉效果。
- **Sliver系列组件**
  - 如 `SliverAppBar`、`SliverList`、`SliverGrid` 等，专为`CustomScrollView`设计，用于高效实现滚动视图布局。
- **SafeArea**：
  - SafeArea组件用于确保其子组件避开屏幕边缘的不安全区域，如手机的刘海屏、摄像头孔位或底部的虚拟按键区域，确保内容布局在可视且不受遮挡的安全区域内。
- **AspectRatio**：
  - 此组件强制其子组件保持特定的宽高比，确保内容在不同屏幕尺寸下都能保持一致的比例关系。
- **Card**：
  - Card组件虽然不是纯粹的布局组件，但因其提供了统一的矩形框样式和阴影效果，常用于构建卡片式的布局单元，特别是在列表和网格布局中。
- **Baseline**：
  - Baseline组件用于基于文本基线对齐其子组件，尤其在处理多行文本或混合文本与其他元素时，可以确保文本行间的基线一致性。
- **CustomPainter**：
  - 虽然CustomPainter主要用于自定义绘画，但在实现复杂自定义布局时也发挥着重要作用，可以通过`Canvas` API实现精确的像素级布局。
- **FittedBox**：
  - FittedBox组件会调整其子组件的大小，使其适应自己的尺寸，常用于图标、文本等内容的自适应缩放。
当然，还有一些其它值得注意的布局相关组件和技术：


- **AnimatedContainer**：
  - AnimatedContainer组件在更改其尺寸、颜色、边距等属性时，会为其变化提供平滑的动画效果，非常适合构建动态布局变化的场景。

- **Scaffold**：
  - Scaffold是Material Design风格应用的基础布局组件，包含了app bar、body、bottomNavigationBar、drawer等常见布局元素，有助于快速构建标准的Material应用界面。

- **ShrinkWrappingViewport**：
  - 类似于ListView，但它的大小可以根据其子组件的大小进行收缩，而不是根据父容器的大小进行填充。

- **RenderObjectWidget** 和 **RenderBox**：
  - 虽然它们不是直接的布局组件，但理解和使用RenderObjectWidget和RenderBox对于自定义布局逻辑至关重要。通过继承和自定义这些底层渲染对象，可以创建高度自定义的布局效果。


- 布局相关动画
  - **AlignTransition** 和 **PositionedTransition**：
    - 这两个组件是对`Align`和`Positioned`组件的动画版本，可以为子组件的对齐或定位提供平滑过渡动画。







  ''');

  print(WindowContent()(LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
    return ColoredBox(
      color: Colors.red,
      child: Text(" $constraints"),
    );
  })));
  print(WindowContent()(LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
    return Text(" $constraints");
  })));

  print(WindowContent(
    width: 100000,
  )(LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
    return SizedBox.square(
      dimension: 10000,
      child: Text("$constraints"),
    );
  })));
  print(WindowContent(
    height: 100,
    width: 10000,
  )(LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
    return ListView(

      children: [
        // Expanded(child: Icon(Icons.add, size: 100)),
        // Expanded(child: Icon(Icons.add, size: 100)),
        LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
          return Text(" $constraints");
        }),
        Align(alignment:Alignment.bottomRight ,child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
          return Text(" $constraints");
        }),),
        Align(alignment:Alignment.bottomRight ,child: Icon(Icons.add, size: 100),),
        Icon(Icons.add, size: 100),
        Icon(Icons.add, size: 100),
        LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
          return Text(" $constraints");
        }),
        // Container(height: double.infinity,width: 100, color: Colors.red,)
      ],
    );
  })));
}
