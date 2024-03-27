// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note/note.dart';

build(BuildContext context, Pen print) {
  print.markdown(r'''
# box layout

## 常用

垂直&水平排列的组件
- Flex: Flexbox布局模型,Flex(子类Row、Column)和Flexible（子类Expanded）组合
- LayoutBuilder: 它可以获取当前布局约束，常用于根据父组件尺寸动态调整子组件布局。
- Stack: Stack允许子组件堆叠展示，支持定位（alignment）和z轴排序（index），可以用于制作悬浮按钮、叠加图片、标签页指示器等效果。
  - **Positioned**: 在Stack中结合Positioned使用，可以更精确地控制子组件在Stack中的绝对位置。
  - **IndexedStack**: 允许在一组子组件中切换显示，类似TabView效果，通过索引值控制显示指定子组件。
- Align（子类Center)，Align组件可以用来对齐其子组件，根据alignment参数调整子组件在父组件中的位置。
- Wrap 组件用于包装多个子组件，当一行空间不足时自动换行，常见于创建标签列表、商品陈列等。
- ConstrainedBox: 可以为子组件添加额外的大小限制，常用于在自定义布局中施加特定的宽高约束。
- Container: 虽然本身不是一个布局组件，但它提供了装饰、边距、填充等功能，结合其子组件可以实现复杂的布局效果。
- Padding：用于在子组件周围添加内边距，可以在不影响子组件本身尺寸的前提下调整其在父容器中的位置。
- AspectRatio：可以确保子组件保持特定的宽高比，这对于视频播放器、图像展示等场景非常重要。
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
- **UnconstrainedBox**
  - 取消对其子组件的所有约束，使得子组件能自由根据其内容大小进行布局。
- **Transform**
  - 提供对子组件的旋转、缩放和平移变换功能，在特定布局场景中也有应用。
- **ClipRect** 和 **ClipRRect**
  - 用于裁剪其子组件的绘制区域，尽管主要用于图形效果，但在实现特定布局和视觉效果时也会使用。
- **Layer** 类组件
  - 如 `RepaintBoundary`、`PhysicalModel`、`Opacity` 等，它们在Flutter渲染架构层面对布局和绘制产生影响，可用于优化性能或实现特殊视觉效果。
- **Sliver系列组件**
  - 如 `SliverAppBar`、`SliverList`、`SliverGrid` 等，专为`CustomScrollView`设计，用于高效实现滚动视图布局。

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
