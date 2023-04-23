import 'package:flutter/material.dart' as flutter;
import 'package:flutter/material.dart';
import 'package:note_mate_flutter/material.dart';
import 'package:note_mate_flutter/painting.dart' as painting;
import 'package:note/page_core.dart';

PageMeta page = PageMeta(
  shortTitle: "Bars",
  builder: build,
);

build(BuildContext context, Pen print) {
  print.markdown(r'''
## AppBar

一般放在[Scaffold.appBar].

> ref: <https://api.flutter.dev/flutter/material/AppBar-class.html>
''');

  print.$____________________________________________________________________();
  print(MateSample(AppBar$Mate(
    title: Text$Mate('AppBar Title'),
    leading: DrawerButton$Mate(),
    actions: <flutter.Widget>[
      IconButton$Mate(icon: Icon$Mate(flutter.Icons.add), onPressed: () {}),
      IconButton$Mate(
          icon: Icon$Mate(flutter.Icons.access_alarm), onPressed: () {}),
      CheckboxMenuButton$Mate(
        value: true,
        onChanged: (b) {},
        child: Text$Mate('CheckboxMenuButton'),
      ),
      FilledButton$Mate(onPressed: () {}, child: Text$Mate('FilledButton')),
    ],
    notificationPredicate: flutter.defaultScrollNotificationPredicate,
  )));

  print.$____________________________________________________________________();
  print.markdown(r'''
## BottomAppBar

一般放在[Scaffold.bottomNavigationBar].

> ref <https://api.flutter.dev/flutter/material/BottomAppBar-class.html>

''');
  //

  print.$____________________________________________________________________();
  print(MateSample(BottomAppBar$Mate(
    // shape: CircularNotchedRectangle(),
    child: Row$Mate(
      children: <flutter.Widget>[
        IconButton$Mate(
          tooltip: 'Open navigation menu',
          icon: Icon$Mate(flutter.Icons.menu),
          onPressed: () {},
        ),
        Spacer$Mate(),
        IconButton$Mate(
          tooltip: 'Search',
          icon: Icon$Mate(flutter.Icons.search),
          onPressed: () {},
        ),
        IconButton$Mate(
          tooltip: 'Favorite',
          icon: Icon$Mate(flutter.Icons.favorite),
          onPressed: () {},
        ),
      ],
    ),
  )));

  print.$____________________________________________________________________();
  print.markdown(r'''
  
## ~~BottomNavigationBar~~

~~BottomNavigationBar~~ 不建议使用，被[NavigationBar]替换
 
## NavigationBar

> 📣Material 3 Navigation Bar component. replacing BottomNavigationBar.

一般放在[Scaffold.bottomNavigationBar], 但按flutter的调性，当然是哪都能放。

> ref <https://api.flutter.dev/flutter/material/BottomAppBar-class.html>


先看看不加逻辑时NavigationBar的长相：
''');

  print.$____________________________________________________________________();
  print(MateSample(Column$Mate(
    children: [
      Container$Mate(
        height: 100,
        // color: Colors.lime,
        child: Text$Mate("main content body"),
      ),
      NavigationBar$Mate(
        onDestinationSelected: (int index) {},
        selectedIndex: 1,
        destinations: <flutter.Widget>[
          NavigationDestination$Mate(
              icon: Icon$Mate(flutter.Icons.explore), label: 'Explore'),
          NavigationDestination$Mate(
              icon: Icon$Mate(flutter.Icons.commute), label: 'Commute'),
        ],
      )
    ],
  )));

  print.$____________________________________________________________________();
  print.markdown(r'''
NavigationBar 的主要用途类似TabBar，加上[NavigationBar.onDestinationSelected]的事件，就能在不同页面切换，如下：
''');

  print.$____________________________________________________________________();
  var currentPageIndex = 0;

  flutter.Widget buildNavigationBar(context, setState) {
    var views = [
      flutter.Container(height: 100, color: flutter.Colors.lime),
      flutter.Container(height: 100, color: flutter.Colors.purple),
    ];
    return flutter.Column(
      children: [
        views[currentPageIndex],
        flutter.NavigationBar(
          onDestinationSelected: (int index) {
            setState(() => currentPageIndex = index);
          },
          selectedIndex: currentPageIndex,
          destinations: const <flutter.Widget>[
            flutter.NavigationDestination(
                icon: flutter.Icon(flutter.Icons.explore,
                    color: flutter.Colors.lime),
                label: 'lime page'),
            flutter.NavigationDestination(
                icon: flutter.Icon(flutter.Icons.explore,
                    color: flutter.Colors.purple),
                label: 'purple page'),
          ],
        )
      ],
    );
  }

  print(MateSample(StatefulBuilder$Mate(
    builder: buildNavigationBar,
  )));

  print.$____________________________________________________________________();
  print.markdown(r'''
## NavigationRail

主要用在Pad或桌面应用上。

> <https://api.flutter.dev/flutter/material/NavigationRail-class.html>
> The navigation rail is meant for layouts with wide viewports, such as a desktop web 
> or tablet landscape layout. For smaller layouts, like mobile portrait, 
> a BottomNavigationBar should be used instead.
''');

  print.$____________________________________________________________________();
  var navigationRail$Mate = NavigationRail$Mate(
    // minWidth: 10,
    minExtendedWidth: 50,
    // extended: true,
    selectedIndex: 0,
    groupAlignment: 1,
    onDestinationSelected: (int index) {},
    labelType: flutter.NavigationRailLabelType.all,
    leading: IconButton$Mate(
      onPressed: () {},
      icon: Icon$Mate(flutter.Icons.access_time),
      tooltip: "NavigationRail.leading",
    ),
    trailing: IconButton$Mate(
      onPressed: () {},
      icon: Icon$Mate(flutter.Icons.exit_to_app),
      tooltip: "NavigationRail.trailing",
    ),
    destinations: <flutter.NavigationRailDestination>[
      NavigationRailDestination$Mate(
          icon: Icon$Mate(flutter.Icons.sanitizer), label: Text$Mate('First')),
      NavigationRailDestination$Mate(
          icon: Icon$Mate(flutter.Icons.accessible),
          label: Text$Mate('Second')),
    ],
  );

  print(MateSample(Row$Mate(
    children: [
      Container$Mate(
        height: 300,
        child: navigationRail$Mate,
      ),
      Expanded$Mate(
          child: Container$Mate(
        height: 300,
        color: flutter.Colors.amber.shade50,
        child: Text$Mate("main content area"),
      )),
    ],
  )));

  print.$____________________________________________________________________();
  print.markdown(r'''
## TabBar

> <https://api.flutter-io.cn/flutter/material/TabBar-class.html>
> A Material Design widget that displays a horizontal row of tabs.
> Typically created as the AppBar.bottom part of an AppBar and in conjunction with a TabBarView.

TabBar 很好理解就是Tab栏切换的组件。一般放在[Scaffold.appBar.bottom]之类的地方，要求是

- 要么外面套个DefaultTabController
- 要么外面套个要么设置[TabBar.controller]

如果两者都不提供，会报错：No TabController for TabBar。
TabController主要是为了协调Tab和TabView的切换关系。

TabBar不加TabView长这样：
''');

  print.$____________________________________________________________________();
  print(MateSample(DefaultTabController$Mate(
    length: 3,
    child: TabBar$Mate(
      tabs: <flutter.Widget>[
        Tab$Mate(
          icon: Icon$Mate(flutter.Icons.cloud_outlined),
          iconMargin: painting.EdgeInsets$Mate.all(10),
        ),
        Tab$Mate(
          icon: Icon$Mate(flutter.Icons.beach_access_sharp),
          iconMargin: painting.EdgeInsets$Mate.all(10),
        ),
        Tab$Mate(
          icon: Icon$Mate(flutter.Icons.brightness_5_sharp),
          iconMargin: painting.EdgeInsets$Mate.all(10),
        ),
      ],
    ),
  )));

  print.$____________________________________________________________________();
  print.markdown(r'''
再来看看加了TabView的完整体，即TabBar实际使用模式：
''');

  print.$____________________________________________________________________();
  print(MateSample(DefaultTabController$Mate(
    initialIndex: 1,
    length: 3,
    child: Column$Mate(
      children: [
        TabBar$Mate(
          tabs: <flutter.Widget>[
            Tab$Mate(
              icon: Icon$Mate(flutter.Icons.cloud_outlined),
              iconMargin: painting.EdgeInsets$Mate.all(10),
            ),
            Tab$Mate(
              icon: Icon$Mate(flutter.Icons.beach_access_sharp),
              iconMargin: painting.EdgeInsets$Mate.all(10),
            ),
            Tab$Mate(
              icon: Icon$Mate(flutter.Icons.brightness_5_sharp),
              iconMargin: painting.EdgeInsets$Mate.all(10),
            ),
          ],
        ),
        Container$Mate(
          height: 200,
          child: TabBarView$Mate(
            children: <flutter.Widget>[
              Center$Mate(child: Text$Mate("It's cloudy here")),
              Center$Mate(child: Text$Mate("It's rainy here")),
              Center$Mate(child: Text$Mate("It's sunny here")),
            ],
          ),
        )
      ],
    ),
  )));

  print.$____________________________________________________________________();
  print.markdown("""
上面用法和[NavigationBar]很像，主要就是在多个页面间切换，好处在，连事件逻辑都不需要，组件树如下结构即可：

DefaultTabController
  - TabBar
    - Tab 1
    - Tab 2
    - Tab 3
  - TabBarView
    -children
      - Widget View 1
      - Widget View 2
      - Widget View 3

  ## SnackBar
""");

  print.$____________________________________________________________________();
  onPressed() {
    flutter.ScaffoldMessenger.of(context).showSnackBar(
      flutter.SnackBar(
        backgroundColor: flutter.Colors.deepPurpleAccent.shade100,
        content: flutter.Column(
          children: [
            const flutter.Text("Show Snackbar 6 seconds"),
            flutter.IconButton(
                icon: const flutter.Icon(flutter.Icons.add), onPressed: () {}),
            flutter.IconButton(
                icon: const flutter.Icon(flutter.Icons.access_alarm),
                onPressed: () {}),
          ],
        ),
        action: flutter.SnackBarAction(
          label: 'Some Action',
          onPressed: () {},
        ),
        duration: Duration(seconds: 3),
      ),
    );
  }

  print(MateSample(SizedBox$Mate(
    height: 100,
    child: flutter.FilledButton(
      onPressed: onPressed,
      child: const flutter.Text('Show Snackbar 6 seconds'),
    ),
  )));

  print.$____________________________________________________________________();
  print.markdown(r'''
## ButtonBar 

> <https://api.flutter-io.cn/flutter/material/ButtonBar-class.html>
> An end-aligned row of buttons, laying out into a column if there is not enough horizontal space.
> Used by Dialog to arrange the actions at the bottom of the dialog.

按钮的布局容器，可以按内容的实际宽度在行或列之间调整，其横向还是纵向排列，取决于其宽度：
  ''');

  print.$____________________________________________________________________();
  print(MateSample(Container$Mate(
    width: 600,
    color: flutter.Colors.lime.shade50,
    child: ButtonBar$Mate(
      children: [
        ElevatedButton$Mate(
            onPressed: () {}, child: Text$Mate("ElevatedButton2")),
        OutlinedButton$Mate(
            onPressed: () {}, child: Text$Mate('OutlinedButton')),
      ],
    ),
  )));

  print.$____________________________________________________________________();
  print.markdown(r'''
## OverflowBar

> <https://api.flutter-io.cn/flutter/material/ButtonBar-class.html>

OverflowBar常用场景是Dialog的按钮组容器，children宽度够(未溢出)，横着排，不够（溢出），就竖着排，修改下面最外层Container.width看看：
  ''');

  print.$____________________________________________________________________();
  print(MateSample(Container$Mate(
    width: 300,
    child: Column$Mate(
      children: [
        Placeholder$Mate(fallbackHeight: 100, color: flutter.Colors.deepPurple),
        OverflowBar$Mate(
          alignment: flutter.MainAxisAlignment.end,
          // 未溢出时的对齐方式
          spacing: 10.0,
          // 未溢出时 水平方向 间距
          textDirection: TextDirection.ltr,
          // 未溢出时 水平方向子组件的布局顺序(是从左往右还是从右往左)
          overflowSpacing: 5.0,
          // 溢出时 垂直方向 间距
          overflowAlignment: flutter.OverflowBarAlignment.end,
          // 溢出时 垂直方向 对齐方式
          overflowDirection: VerticalDirection.down,
          // 溢出时 垂直方向子组件的布局顺序(是从上往下还是从右下往上)
          clipBehavior: Clip.hardEdge,
          // 超出时 裁剪方式
          // 子组件
          children: [
            ElevatedButton$Mate(
                onPressed: () {}, child: Text$Mate("Cancel横排还是竖排取决于width")),
            ElevatedButton$Mate(
                onPressed: () {}, child: Text$Mate("Ok对齐方式取决于排列")),
          ],
        )
      ],
    ),
  )));

  print.$____________________________________________________________________();
  print.markdown(r'''
## PlatformMenuBar

> <https://api.flutter-io.cn/flutter/widgets/PlatformMenuBar-class.html>

PlatformMenuBar 目前之支持macOS（2023-04），不玩了。

## MenuBar

> <https://api.flutter-io.cn/flutter/widgets/MenuBar-class.html>

MenuBar相关组件：

- MenuAnchor, a widget that creates a region with a submenu and shows it when requested.
- SubmenuButton, a menu item which manages a submenu.
- MenuItemButton, a leaf menu item which displays the label, an optional shortcut label, and optional leading and trailing icons.
  ''');

  print.$____________________________________________________________________();
  var click = () {
    flutter.showAboutDialog(
      context: context,
      applicationName: 'MenuBar Sample',
      applicationVersion: '1.0.0',
    );
  };
  print(MateSample(MenuBar$Mate(
    children: [
      MenuItemButton$Mate(
        onPressed: () {},
        child: MenuAcceleratorLabel$Mate(
          '&Exit',
          builder: flutter.MenuAcceleratorLabel.defaultLabelBuilder,
        ),
      ),
      SubmenuButton$Mate(
        menuChildren: [
          MenuItemButton$Mate(
            onPressed: click,
            child: MenuAcceleratorLabel$Mate('&flutter_note github',
                builder: flutter.MenuAcceleratorLabel.defaultLabelBuilder),
          )
        ],
        child: MenuAcceleratorLabel$Mate('&Help',
            builder: flutter.MenuAcceleratorLabel.defaultLabelBuilder),
      ),
    ],
  )));
}
