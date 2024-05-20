# flutter速查

>  **📣Tip:**
> Components are interactive building blocks for creating a user interface.
> They can be organized into five categories based on their purpose: Action, containment,
> navigation, selection, and text input.
> <https://m3.material.io/components>
> <https://api.flutter.dev/flutter/material/ThemeData/useMaterial3.html>
> [catalog of layout widgets : https://flutter.dev/widgets/layout/ ](https://flutter.dev/widgets/layout/)

## 布局

### 基础布局组件


- ref: <https://docs.flutter.dev/ui/widgets/layout>
- **AspectRatio**:此组件强制其子组件保持特定的宽高比，确保内容在不同屏幕尺寸下都能保持一致的比例关系。
- **Container**: 虽然本身不是一个布局组件，但它提供了装饰、边距、填充等功能，结合其子组件可以实现复杂的布局效果。
- **ConstrainedBox**:
  - **ConstrainedBox**:为子组件添加额外的大小限制，常用于在自定义布局中施加特定的宽高约束。
    - 【场景】当你需要对子Widget施加尺寸上的约束，但允许其在一定范围内自适应时，使用ConstrainedBox
  - **UnconstrainedBox**: 取消对其子组件的所有约束，使得子组件能自由根据其内容大小进行布局。
- **FittedBox**:`FittedBox`可调整其子组件大小以适应自己的尺寸。保证内容按比例适应容器，常用于图标、文本等内容的自适应缩放。FittedBox提供了几种不同的`fit`模式，例如`BoxFit.contain`、`BoxFit.cover`、`BoxFit.fill`等，每种模式决定了内容如何适应容器的尺寸。
- **Flex**: Flexbox布局模型,Flex(子类Row、Column)和Flexible（子类Expanded）组合
  - **Flexible**:它不会强制填满所有剩余空间，而是根据子Widget的实际需求和可用空间来调整大小。这意味着，如果子Widget不需要那么多空间，它不会撑满，可以比分配的最小空间小。
    - 【场景】当你希望子Widget能够根据内容自适应大小，同时允许它们在必要时伸展以填充额外空间时，使用Flexible。这种情况下，子Widget的大小会更加动态，根据实际内容和可用空间来调整。
    - 【原理】Flexible的fit属性默认为FlexFit.loose，Flexible的fit属性默认为FlexFit.loose，允许子Widget在满足其最小尺寸的前提下可以不填满所有分配的空间
  - **Expanded**:Expanded 会强制填充父布局中剩余的所有可用空间。这意味着，如果你在一个Row或Column中有多个Expanded子Widget，它们会按照各自的flex属性分配剩余空间，并且至少会填满分配给它们的空间。
    - 【场景】当你需要确保某一部分总是占据剩余的所有空间时，使用Expanded。这在实现如分栏布局、列表项中标题和详细信息的自适应布局时很有用。
    - 【原理】Flexible的子类，Expanded的fit属性固定为FlexFit.tight，指示它必须填满分配的空间
  - **Spacer**:可以根据主轴方向自动拉伸占据剩余空间，辅助调整布局间距。
    - 【原理】Spacer组件内部包装了一个Expanded，在`Row`或`Column`布局中占位
- **FractionallySizedBox**:用于根据父Widget的尺寸按比例设置子Widget的大小。它是基于父Widget尺寸的百分比来决定子Widget的宽度和高度，而不是绝对值。
  通过widthFactor和heightFactor属性设置宽度和高度的比例因子，这两个值是0到1之间的浮点数，分别代表宽度和高度占父Widget相应维度的比例。这对于创建响应式布局非常有用，特别是在你希望子Widget始终占据父Widget一定比例空间的场景。
  - 【场景】当你需要按比例设置子Widget尺寸，尤其适合响应式设计，确保子Widget能够随父Widget尺寸变化而按比例缩放。
- **LayoutBuilder**:它根据父组件提供的布局约束来动态构建其子组件，使子组件能够适应不同尺寸的屏幕或容器。
  - 【场景】
    - 响应式设计: 当需要根据屏幕尺寸（如手机横竖屏切换）改变布局时，LayoutBuilder可以轻松实现UI的自适应。
    - 流式布局: 在列表项或网格布局中，根据父容器的可用空间动态决定每行显示的子项数量。
    - 分栏布局: 根据屏幕宽度决定是否采用单列或双列（或多列）布局，常见于新闻阅读应用或商品展示页面。
    - 自定义滚动区域: 确定特定Widget的尺寸，以便创建精确的滚动效果，例如在图片查看器中根据图片大小自动调整滚动视图。
  - 【原理】
    - 获取约束信息: 它提供了一个BuildContext和一个BoxConstraints对象。BoxConstraints包含了当前Widget在布局过程中可以使用的空间限制，比如最大宽度、最小高度等，这让开发者能够做出智能的布局决策。
    - 动态布局: LayoutBuilder可以在运行时根据可用空间动态调整子Widget的尺寸和位置。这意味着开发者可以根据屏幕尺寸、方向变化或其他父Widget的约束来定制布局。
- **LimitedBox**:LimitedBox 类似于 ConstrainedBox，但它主要用来限制最大尺寸，特别是当子Widget可能无限增长时（例如，因为文字溢出）。它允许你设置最大宽度和高度。主要是用来限制极端情况下的尺寸，防止过度膨胀导致的布局问题，而不是直接控制尺寸，因此它更偏向于防御性布局策略
  - 【场景】当你担心子Widget尺寸无限制增长，需要设定一个最大尺寸限制时，使用LimitedBox。
- **IntrinsicHeight & IntrinsicWidth**:这两个组件会使子组件的高度或宽度与其内容匹配，而不是依赖于外部约束。
  - 【场景】当你需要让一个Widget的高度由其内部子Widget的最高高度决定时使用。换句话说，它会使整个Widget的高度等于其最高子Widget的高度，而宽度则根据正常布局规则确定。
  - 【原理】它会遍历所有子Widget，找到最高的那个，然后将自己的高度设置为该高度。这样，即使外部容器有其他高度约束，IntrinsicHeight 内部也会优先满足最高子Widget的需求。
- **SizedBox**:SizedBox 是最简单的尺寸限制类容器，它强制其子Widget具有固定的宽度和高度。提供width和height参数来直接指定大小，适用于静态布局，不考虑子Widget本身的大小请求。
  -  【场景】当你需要一个确切大小的Widget时，使用SizedBox。
- **Wrap**:Wrap组件用于包装多个子组件，当一行空间不足时自动换行，常见于创建标签列表、商品陈列等。
- **PreferredSizeWidget** 为 Widget 设置一个固定的首选尺寸，这包括宽度和高度。被指定的尺寸作为该 Widget 在布局过程中的首选尺寸，即使其内部内容或外部约束可能暗示着不同的尺寸。
  -  【场景】AppBar之类需要固定宽高时。
- **GridView** 网格布局，可以创建类似表格或卡片列表的效果，支持横向或纵向滚动。
- **Table**:表格布局，可以灵活定义行和列的数量及内容。
  - **DataTable**: Table的增强版，为表格提供了更丰富的样式和交互功能，适合展示具有表头、索引列和操作列的数据。
- **Stack**:Stack允许子组件堆叠展示，支持定位（alignment）和z轴排序（index），可以用于制作悬浮按钮、叠加图片、标签页指示器等效果。
  - **Positioned**: 在Stack中结合Positioned使用，可以更精确地控制子组件在Stack中的绝对位置。
  - **IndexedStack**: 内部包了个Stack，允许在一组子组件中切换显示，类似TabView效果，通过索引值控制显示指定子组件。
    - 【场景】适合于页面数量相对较少且需要快速切换、同时保持页面状态（比如滚动位置）的场景，它不包含任何动画效果，页面切换是瞬间完成的。
    - 【原理】IndexedStack是一个能够记住其子Widget状态的Stack。当你改变索引时，它不会销毁和重建未显示的子Widget，而是简单地改变可见性，从而保留之前页面的状态。
- **列表**:可在 ListView 的头部或尾部使用 ListBody 来渲染一些固定的内容,这样可以充分利用两者的优势。
  - **ListBody**: 列表容器，不支持滚动、懒加载等高级特性。
    - 【原理】通过 Flex 布局算法来决定子 Widget 的位置。它只负责布局,不提供滚动功能。
    - 【场景】适用于列表项数量较少、不需要滚动功能的场景,比如简单的菜单列表。
  - **ListView**: 列表容器，还支持滚动、懒加载、头尾部件等丰富的功能。
    - 【原理】内部使用 Sliver 技术来实现滚动效果。它不仅提供列表布局,还支持滚动、懒加载等功能。
    - 【场景】适用于需要处理大量列表项、支持滚动和懒加载的场景,比如新闻列表、电商列表等。
- **旋转**
  - **RotatedBox**
  - **Transform**:提供对子组件的旋转、缩放和平移变换功能，在特定布局场景中也有应用。
- **Padding**:Padding组件用于在子组件周围添加内边距，可以在不影响子组件本身尺寸的前提下调整其在父容器中的位置。

### Sliver系列布局

- **介绍**
  - 如 `SliverAppBar`、`SliverList`、`SliverGrid` 等，专为`CustomScrollView`设计，用于高效实现滚动视图布局。
- **ShrinkWrappingViewport**:类似于ListView，但它的大小可以根据其子组件的大小进行收缩，而不是根据父容器的大小进行填充。

### 自定义布局

- **CustomSingleChildLayout**: 实现SingleChildLayoutDelegate自定义子组件的布局。
- **CustomMultiChildLayout**:  实现MultiChildLayoutDelegate自定义子组件的布局。
- **CustomPainter**: 虽然主要用于自定义绘画，但在实现复杂自定义布局时也发挥着重要作用，可以通过`Canvas` API实现精确的像素级布局。
- **Flow**: 可以指定`FlowDelegate`实现自己的绘制逻辑，你可以根据子 Widget 的大小和位置来动态调整子 Widget 的位置和大小。这个 Widget 非常适合用于实现复杂的布局需求,例如文本编辑器、绘图工具等。
- **RenderObjectWidget** 和 **RenderBox**:虽然它们不是直接的布局组件，但理解和使用RenderObjectWidget和RenderBox对于自定义布局逻辑至关重要。通过继承和自定义这些底层渲染对象，可以创建高度自定义的布局效果。
- **已提及的其他可自定义的组件**
  - CustomClipper
  - CustomScrollView

### 溢出处理

- **OverflowBox**:允许其子组件的尺寸超出自身约束范围，适用于实现部分组件溢出父容器的情况。
  - 【原理】
    - 忽略约束: OverflowBox 会忽略传递给它的大小限制（constraints），转而使用子 Widget 自身的大小需求（size request）来确定最终的大小。这意味着，如果子 Widget 想要占用比父 Widget 允许的更大的空间，OverflowBox 将允许这种情况发生，即使这会导致溢出（overflow）或被父级剪裁（clipping）。
    - 溢出处理: 默认情况下，溢出的内容会被剪裁，但是，通过设置父级或兄弟 Widget 的 clipBehavior，可以改变这一行为，比如允许溢出内容可见。
  - 【场景】
    - 临时展示: 当需要短暂展示一些内容，而这些内容的大小可能暂时超过其容器时，例如弹出提示、气泡对话等。
    - 精确控制: 在某些特定的布局中，你可能需要精确控制某个元素的位置和尺寸，即使这会导致溢出，OverflowBox 可以帮助实现这样的布局效果。
    - 调试辅助: 在调试布局问题时，使用 OverflowBox 可以帮助你直观地看到子 Widget 实际需要的尺寸，从而调整布局逻辑。
- **SizedOverflowBox**:SizedOverflowBox 允许你为子 Widget 指定一个特定的尺寸，即使这个尺寸超出了其正常约束范围而溢出
  - 【原理】
    - 指定尺寸: 不同于 OverflowBox 直接使用子 Widget 的尺寸需求，SizedOverflowBox 允许你显式地设置一个尺寸（宽度和高度），这个尺寸可以独立于子 Widget 自身的尺寸请求。这意味着，无论子 Widget 实际需要多少空间，你都可以强制它按照你指定的尺寸来渲染。
    - 溢出处理: 和 OverflowBox 一样，SizedOverflowBox 中超出其指定尺寸的内容默认会被剪裁。这意味着，如果你指定的尺寸小于子 Widget 所需的尺寸，超出部分将不可见。同样，也可以通过外部容器的 clipBehavior 来调整是否剪裁。
- **剪裁**:用于裁剪其子组件的绘制区域，尽管主要用于图形效果，但在实现特定布局和视觉效果时也会使用
  - **ClipRect**:for more efficient clips without rounded corners
  - **ClipOval**:for an elliptical clip
  - **ClipRRect**:for a clip with rounded corners
  - **ClipPath**:for an arbitrarily shaped clip
  - **CustomClipper**:custom clips

### 对齐

- **Baseline**:Baseline组件用于基于文本基线对齐其子组件，尤其在处理多行文本或混合文本与其他元素时，可以确保文本行间的基线一致性。
- **Align**:Align组件可以用来对齐其子组件，根据alignment参数调整子组件在父组件中的位置。
  - **Center**:Align子类，Center组件将子组件居中显示，无论父容器大小如何变化，子组件始终保持居中。

### 布局&动画

- **AlignTransition** 和 **PositionedTransition**:
  - 这两个组件是对`Align`和`Positioned`组件的动画版本，可以为子组件的对齐或定位提供平滑过渡动画。
- **Hero动画**:虽非布局组件，但与布局转换相关。它在不同路由或页面间实现元素共享及动画过渡，常用于Material Design中的共享元素过渡效果。
- **AnimatedContainer**:AnimatedContainer组件在更改其尺寸、颜色、边距等属性时，会为其变化提供平滑的动画效果，非常适合构建动态布局变化的场景。

### 获取尺寸的方法

- StatefulWidget在最外层会随着屏幕大小变化自动build
- 自适应尺寸：/flutter/examples/api/lib/widgets/framework/build_owner.0.dart
- 组件尺寸：WidgetsBinding.instance.addPostFrameCallback中： (context.findRenderObject() as RenderBox).size
- 屏幕宽度：`double screenWidth = MediaQuery.of(context).size.width;`

## 展示性组件

### 高级模版容器

- App
  - **WidgetsApp**
  - **MaterialApp**
- Dialogs: Dialog, AlertDialog
- **Scaffold**:Scaffold是Material Design风格应用的基础布局模版，包含了app bar、body、bottomNavigationBar、drawer等常见元素，有助于快速构建标准的Material应用界面。
- 可展开容器
  - ExpansionPanelList
  - ExpansionTile
- Stepper
- Drawer 抽屉
  - Drawer 不导航
  - NavigationDrawer 可导航
- BottomSheet

### 装饰器

- 增强
  - **简介**: 装饰器指外观样式或特性增强
  - **BoxDecoration**:指定颜色、背景图片、边框`BoxBorder`
  - **PhysicalModel**:用于给其子 Widget 添加物理外观属性，如阴影、边界和背景色等，从而使得 UI 具有更加丰富的视觉效果和质感。它主要用于实现Material设计中的“ elevation”（即阴影效果）和颜色叠加效果。
    - 与 Card 相比，PhysicalModel 提供了更多的自定义选项，比如可以自定义阴影颜色，而不仅仅是依赖主题。
    - 与 Container 结合 BoxShadow 使用相比，PhysicalModel 更简洁，直接通过 elevation 参数就能实现阴影效果。
    - 与 ClipRRect 或 ClipOval 结合使用时，PhysicalModel 可以同时提供剪辑和物理外观效果，但直接设置 borderRadius 可以简化代码。
  - **RepaintBoundary**:
  - **SafeArea**:SafeArea组件用于确保其子组件避开屏幕边缘的不安全区域，如手机的刘海屏、摄像头孔位或底部的虚拟按键区域，确保内容布局在可视且不受遮挡的安全区域内。
  - **Material特效**
    - **Material**
    - **InkResponse**
      - **InkWell**
  - **Card**: 虽然不是纯粹的布局组件，但因其提供了统一的矩形框样式和阴影效果，常用于构建卡片式的布局单元，特别是在列表和网格布局中。
    - 【原理】内部包了个`Material`

- 隐藏&可见性
  - **Opacity**: 是一种可以改变其子组件透明度的布局组件。它并不会影响子组件的实际尺寸和布局，而是控制子组件的内容可视性。
  - **Offstage**:用于控制其子Widget是否参与布局和绘制过程，也是用来控制子Widget是否可见的，但与 Visibility 不同，当子Widget被标记为 offstage: true 时，它不仅不可见，而且不会占用任何布局空间。这意味着，使用 Offstage 隐藏的Widget就像从未添加到树中一样，对于性能优化很有帮助，特别是隐藏复杂或者大量Widget时。
    - 【原理】
      - offstage: 一个布尔型属性，默认值为false。当设置为true时，表示子Widget将不会被布局或绘制，即该子Widget会被“隐藏”起来，但仍然保持在Widget树中，保持状态并且继续接收生命周期方法调用（如build）。当设置为false时，子Widget则正常参与布局和绘制，可见于屏幕上。
      - performLayout: 另一个布尔型属性，默认与offstage属性值相同。这个属性控制是否执行子Widget的布局过程，即使offstage为true时，也可以通过设置performLayout为false来完全跳过布局步骤，这在某些性能敏感场景下可能有帮助。
    - 【场景】
      - 动画切换: 当需要在两个Widget之间进行切换显示时，可以使用Offstage配合AnimatedCrossFade或其他动画Widget，避免不必要的重建和初始化，提高性能。
      - 条件渲染: 类似于 Visibility Widget，但更适用于那些需要保持状态不变或避免重建成本较高的Widget。例如，在分页组件中，可以利用Offstage隐藏当前未显示的页面内容，同时保持它们的状态。
      - 预加载: 如果你希望预先加载一些复杂的Widget但初始时不显示它们，可以使用Offstage将其“隐藏”，这样当需要显示时能迅速切换，提升用户体验。
      - 性能优化: 对于昂贵的渲染操作（如大量数据的列表），可以在滚动到可视区域外时使用Offstage隐藏它们，减少不必要的计算和渲染负担。
    - **SliverOffstage**: the sliver version of `Offstage` widget。
  - **Visibility** Visibility Widget 允许你根据条件控制其子Widget的可见性，并且提供了是否保留子Widget所占空间的选项。api doc上说：which can hide a child more efficiently (albeit less subtly).
    -【原理】
    - if (!maintainSize&&maintainState)时内部包一个Offstage，即等同于Offstage
    - visible bool属性，为 true 时，子Widget会被正常渲染；设为 false 时，子Widget会被隐藏。
    - maintainState bool属性，当设为 true（默认值）时，即使Widget不可见，其状态也会被维护；设为 false 则会销毁Widget的状态。
    - replaceWith 属性可以指定一个Widget来替换隐藏时的内容。
    - 【场景】当你需要动态地显示或隐藏界面元素，同时可能需要保留隐藏元素所占布局空间时。在实现加载更多、错误提示等动态UI变化时，可以在数据加载失败时显示错误提示，而保留原本列表的空间布局。
  - **其他相关手段**
    - **Expanded & Flexible**: 这两个Widget在布局组件提及，用于在Row、Column等Flex布局中分配空间。通过调整它们的flex属性或使用Expanded的flex属性为0，可以在不同屏幕尺寸或条件下改变Widget所占空间，间接影响“视觉上的重要性”或是否“实质上可见”。
    - **Stack & Positioned**: 可以通过调整Positioned的位置属性将子Widget移出屏幕可视范围，或者堆叠顺序（z-index）来控制覆盖关系，间接达到隐藏或显示的效果。
    - **SizedBox.shrink**: 可以用于替代某个Widget并将其大小“缩小”至零，从而在视觉上隐藏，但注意它仍然会参与布局过程。
    - **CustomSingleChildLayout/CustomMultiChildLayout**：通过自定义布局逻辑，可以更加灵活地控制子Widget的布局和可见性，比如在特定条件下改变子Widget的位置使其超出视口范围。
    - **TickerMode** 可控制其子树内的动画ticker是否启用。ticker是Flutter中驱动动画的核心机制。api doc: which can be used to disable animations in a subtree.
      - 【原理】
        - enabled 属性，你可以决定子树内的动画是否应该运行。当 enabled 为 false 时，所有依赖于Ticker的动画（如AnimationController）都会暂停。
      - 【场景】
        - 当应用进入后台或者某个页面不需要动画效果以节省资源时，可以通过 TickerMode 禁用该页面的动画ticker。
        - 在复杂的布局或长列表中，为了优化性能，可以对非可视区域的动画使用 TickerMode 禁用ticker，以减少不必要的计算和渲染负担。

### 导航与页面

- **Menu类**
  - **MenuBar**
  - **DropdownMenu**
- **Bar类**
  - **AppBar** 水平bar，一般放在`Scaffold.appBar`
  - **BottomAppBar**:水平bar 一般放在`Scaffold.bottomNavigationBar`
  - **~~BottomNavigationBar~~**：水平bar，不建议使用，被`NavigationBar`替换
  - **NavigationBar** 水平bar，一般放在[Scaffold.bottomNavigationBar], 但按flutter的调性，当然是哪都能放. Material 3 Navigation Bar component. replacing BottomNavigationBar.
    - 【场景】NavigationBar 的主要用途类似TabBar，加上`NavigationBar.onDestinationSelected`的事件，就能用页面的概念在不同页面间切换
  - **NavigationRail** 垂直bar，The navigation rail is meant for layouts with wide viewports, such as a desktop web or tablet landscape layout. For smaller layouts, like mobile portrait, a BottomNavigationBar should be used instead
  - **TabBar** 水平Bar，Tab栏的切换组件。一般放在[Scaffold.appBar.bottom]之类的地方
    - 【原理】
      - 要求：要么外面套个DefaultTabController，要么外面套个要么设置[TabBar.controller]，TabController主要是为了协调Tab和TabView的切换关系，如果两者都不提供，会报错：No TabController for TabBar
      - TabBar.secondary：for a secondary tab bar.
  - **OverflowBar**
    - 【场景】Dialog的按钮组容器，children宽度够(未溢出)，横着排，不够（溢出），就竖着排。
  - **MenuBar**
  - **PlatformMenuBar**
  - **NavigationToolbar** is a layout helper to position 3 widgets or groups of widgets along a horizontal axis，正常应该使用带主题的Material AppBar or the iOS CupertinoNavigationBar
  - **Sliver相关Bar**
    - **SliverAppBar** 水平Bar，动画、可收缩的Bar
    - **FlexibleSpaceBar**
- **堆叠&可切换**
  - **PageView**:用于实现滑动页面效果。
    - 【场景】幻灯片、相册浏览、引导页、广告轮播、仪表盘切换
  - **TabView**: 是一个用于实现带标签页导航的Widget，常与TabBar配合使用，提供平滑的页面切换动画。提供了丰富的自定义选项，比如页面切换动画、指示器样式等。
    - 【原理】当用户在不同的tab之间切换时，TabView默认会销毁离开的页面并重建进入的页面，这意味着页面状态不会被保留（除非额外采取措施，比如使用AutomaticKeepAliveClientMixin）。
    - 【场景】更适用于有多个固定分类内容展示的场景，比如应用的主页有新闻、视频、我的等几个固定的tab。

### 分割填充留白

- **分割线**
  - **Divider** 水平分割线
  - **VerticalDivider** 垂直分割线 which is the vertical analog of this widget.
  - **ListTile.divideTiles** another approach to dividing widgets in a list.
  - **PopupMenuDivider** which is the equivalent but for popup menus.
- **Placeholder**:常用于占位，在加载数据或资源尚未准备就绪时显示临时内容。它可以作为一个视觉提示，提醒用户该位置的内容随后会被填充。它不具有自适应尺寸的功能，但可以设置默认尺寸，并且常与异步数据加载结合使用，确保即使在真实内容加载前也有良好的用户体验。
- **Spacer**:已在`Flex`中提到，主要用于分配布局中的空白空间。通常用于`Row`、`Column`或`Flex`布局中，作为填充空间的占位符。当希望某个方向上的剩余空间被均匀分配时，可以放置一个或多个`Spacer`。它没有自身的尺寸，而是根据`Flex`布局规则来决定占用的空间大小。


### 图标&图片

- **Icon** 图标
- Image

### button&input&form

- **Button**
  - **ButtonStyleButton**
    - **ElevatedButton**, a filled overview whose material elevates when pressed.
    - **FilledButton**
      1. **FilledButton**, a filled overview variant that uses a secondary fill color.
      2.  **FilledButton.tonal**, a filled overview variant that uses a secondary fill color.
    - **OutlinedButton**, an overview with an outlined border and no fill color.
    - **TextButton**, an overview with no outline or fill color.
  - **IconButton**
  - **FloatingActionButton**: 浮动按钮，常见于[Scaffold]右下角的浮动按钮。
    1. **FloatingActionButton** 固定大小
    2. **FloatingActionButton.small** 小一点
    3. **FloatingActionButton.large** 大一点
    4. **FloatingActionButton.extended** icon + label
  - **Ink系列**
    - **InkResponse**: 可以包裹任何不具有点击事件处理能力的 Widget，并为其添加点击效果。比如裹上InkResponse的Text,具有按钮效果。
      - 【场景】当你需要对点击效果有更多控制，比如应用于不规则形状的Widget上，或者需要自定义水波纹效果时。
    - **InkWell**: 是InkResponse  的一个具体实现。通常用于文本或者带明确边界的Widget上
      - 【场景】当你需要快速简单地为矩形或有固定边界元素添加点击效果时。
      - 【原理】继承InkResponse。
- **Slider**
- TextField
- Checkbox、CheckboxListTile
- Switch、SwitchListTile
- Chips：Chip、ActionChip、FilterChip、ChoiceChip、InputChip
  - **RawChip** 自定义
- Radio button: Radio、RadioListTile
- Slider：Used to select from a range of values.
  - ref: <https://m3.material.io/components/sliders/overview>
- CalendarDatePicker

### Text&信息&提示

- **Text**
  - **Text.rich**
  - RichText
- **TextSelectionToolbar**
- Markdown
- SelectionArea 可选择界面一整个区域的文本
- DefaultTextStyle
- 进度条Progress indicators
  - CircularProgressIndicator
  - LinearProgressIndicator
- Badges [api-Badges](https://api.flutter.dev/flutter/material/Badge-class.html)
- **Tooltip**
- **SnackBar**
  - 【原理】ScaffoldMessenger.of(context).showSnackBar()

### 滚动scrolling

- **ScrollView**:
  - **SingleChildScrollView**:
  - 【原理】
    - SingleChildScrollView 本身不提供任何布局能力,需要手动包裹一个布局 Widget(如 Column、Row 等)
    - 简单，性能好
  - 【场景】SingleChildScrollView 适用于需要滚动的单个 Widget,比如表单、简单的列表等。
  - **BoxScrollView**:
  - 【原理】
    - 基于 Viewport 和 RenderBox 技术实现,内部会直接处理滚动逻辑。
    - 其父类是ScrollView 而ListView和GridView是BoxScrollView子类。
  - 【场景】
    - 适用于普通的列表或网格滚动场景,如新闻列表、商品列表等。
  - **CustomScrollView**:LayoutId 和CustomScrollView结合使用，可以实现自定义的滚动视图布局，如多个不同滚动速度的列表视图。
    - 【原理】
      - 基于 Sliver 技术实现,内部使用多个 Sliver 组件来共同完成滚动效果。可以自由组合各种 Sliver 组件来构建复杂的滚动界面。
    - 【场景】
      - 适用于需要实现复杂滚动效果的场景,如带有吸顶效果的应用栏、嵌套的列表/网格等。
  - **NestedScrollView**:在同一滚动视图中嵌套其他滚动视图，如顶部有一个固定的AppBar和底部有一个可滚动的列表。
- **滚动相关**
  - **ScrollNotification** and **NotificationListener**: which can be used to watch the scroll position without using a [ScrollController].
  - **ScrollController**: 记得dispose
  - **Viewport** 用于表示可视区域内的内容。Viewport 通常与可滚动组件配合使用,用于控制和管理可滚动内容的显示。
    - 【原理】
      - 确定可视区域:Viewport 负责计算和管理当前可视区域的大小和位置。 它会根据屏幕尺寸和滚动位置来确定可视区域的范围。
      - 管理可视内容:Viewport 会决定哪些子组件应该被渲染和显示在可视区域内。 它会根据可视区域的范围来选择需要渲染的子组件,以提高性能。
      - 处理滚动:Viewport 会监听用户的滚动输入,并根据滚动距离更新可视区域的位置。 它负责将滚动事件转化为对可视内容的适当调整。
      - 提供约束条件:Viewport 会将可视区域的大小作为约束条件传递给子组件。 子组件可以根据这些约束条件来决定自身的大小和布局。
    - 【场景】
      - ListView 和 GridView 都是基于 Viewport 实现的可滚动组件。 它们利用 Viewport 来确定当前可视区域内应该显示哪些子组件,从而实现高效的滚动体验。
      - CustomScrollView 基于 Viewport 和 Sliver 技术实现。Viewport 负责管理可视区域内的 Sliver 组件,如 SliverList、SliverGrid 等,从而构建出复杂的滚动界面。
      - SingleChildScrollView 也使用 Viewport 来管理其单个子组件的滚动。它可以确保子组件在可视区域内正确显示和滚动。
      - PageView 是一种基于 Viewport 实现的特殊可滚动组件,它用于实现页面级别的滚动和切换。Viewport 在这里负责管理当前可视的页面,并在用户滑动时切换到下一个页面。
      - Expanded 和 Flexible这两个布局组件也与 Viewport 相关,它们用于控制子组件在可用空间内的分布和增长。当子组件位于可滚动视图中时,Viewport 提供的约束条件会影响 Expanded 和 Flexible 的行为。

- **已提及的其他可滚动组件**
  - GridView
  - ListView
  - PageView
- **ScrollPhysics**
  - **简介**: 滚动物理模型
  - **BouncingScrollPhysics**: 用于实现类似 iOS 上的弹性滚动效果。
    - 弹性滚动:当用户滚动到列表的顶部或底部时,会出现一种"弹性"的感觉,给用户一种"拉伸"的体验。这种效果可以让滚动操作更加自然和生动。
    - 阻尼效果:当用户松开手指时,滚动会逐渐减速并停下来,而不是立即停止。这种阻尼效果让滚动操作更加顺滑自然。
    - 过度滚动:当用户滚动到列表的顶部或底部时,列表会稍微"超出"一点,然后再返回到正常位置。这种过度滚动也是 iOS 上常见的效果,增加了视觉上的连贯性。
  - **ClampingScrollPhysics**: 不允许过度滚动,列表滚动到顶部或底部时会立即停止。
  - **AlwaysScrollableScrollPhysics**: 始终允许滚动,即使列表项的总高度小于列表容器的高度。
  - **NeverScrollableScrollPhysics**: 禁用滚动功能,列表项无法滚动。

## 专题

### adaptive-responsive

- **参考** <https://docs.flutter.dev/ui/adaptive-responsive>
- OrientationBuilder 根据屏幕方向更新界面

### state 相关

- ValueListenableBuilder

### Style&Theme

- **MediaQuery**

### 国际化

### 调试和诊断

- diagnostics.dart

### 错误处理

- **ErrorWidget.builder** : [examples/api/lib/widgets/framework/error_widget.0.dart](https://github.com/flutter/flutter/blob/3.19.6/examples/api/lib/widgets/framework/error_widget.0.dart)

