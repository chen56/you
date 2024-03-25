import 'package:code_builder/code_builder.dart';
import 'package:flutter/material.dart';
import 'package:mate/mate_note.dart';
import 'package:flutter/painting.dart' as painting;
import 'package:note/note.dart';

build(BuildContext context, Pen print) {
  print.markdown(r'''
## AppBar

一般放在[Scaffold.appBar].

> ref: <https://api.dev/flutter/material/AppBar-class.html>
''');

  print.$____________________________________________________________________();
  print(
    AppBar(
      title: const Text('AppBar Title'),
      leading: const DrawerButton(),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {}..sampleCodeStr = "(){}",
        ),
        IconButton(
          icon: const Icon(Icons.access_alarm),
          onPressed: () {}..sampleCodeStr = "(){}",
        ),
        CheckboxMenuButton(
          value: true,
          onChanged: (b) {}..sampleCodeStr = "(b){}",
          child: const Text('CheckboxMenuButton'),
        ),
        FilledButton(
          onPressed: () {}..sampleCodeStr = "(){}",
          child: const Text('FilledButton'),
        ),
      ],
    ),
  );

  print.$____________________________________________________________________();
  print.markdown(r'''
## BottomAppBar

一般放在[Scaffold.bottomNavigationBar].

> ref <https://api.dev/flutter/material/BottomAppBar-class.html>

''');
  //

  print.$____________________________________________________________________();
  print(
    BottomAppBar(
      // shape: CircularNotchedRectangle(),
      child: Row(
        children: <Widget>[
          IconButton(
            tooltip: 'Open navigation menu',
            icon: Icon(Icons.menu),
            onPressed: () {}..sampleCodeStr = "(){}",
          ),
          Spacer(),
          IconButton(
            tooltip: 'Search',
            icon: Icon(Icons.search),
            onPressed: () {}..sampleCodeStr = "(){}",
          ),
          IconButton(
            tooltip: 'Favorite',
            icon: Icon(Icons.favorite),
            onPressed: () {}..sampleCodeStr = "(){}",
          ),
        ],
      ),
    ),
  );

  print.$____________________________________________________________________();
  print.markdown(r'''

## ~~BottomNavigationBar~~

~~BottomNavigationBar~~ 不建议使用，被[NavigationBar]替换

## NavigationBar

> 📣Material 3 Navigation Bar component. replacing BottomNavigationBar.

一般放在[Scaffold.bottomNavigationBar], 但按flutter的调性，当然是哪都能放。

> ref <https://api.dev/flutter/material/BottomAppBar-class.html>


先看看不加逻辑时NavigationBar的长相：
''');

  print.$____________________________________________________________________();
  print(
    Column(
      children: [
        Container(
          height: 100,
          // color: Colors.lime,
          child: Text("main content body"),
        ),
        NavigationBar(
          onDestinationSelected: (_) {}..sampleCodeStr = "(_){}",
          selectedIndex: 1,
          destinations: <Widget>[
            NavigationDestination(icon: Icon(Icons.explore), label: 'Explore'),
            NavigationDestination(icon: Icon(Icons.commute), label: 'Commute'),
          ],
        )
      ],
    ),
  );

  print.$____________________________________________________________________();
  print.markdown(r'''
NavigationBar 的主要用途类似TabBar，加上[NavigationBar.onDestinationSelected]的事件，就能在不同页面切换，如下：
''');

  print.$____________________________________________________________________();
  var currentPageIndex = 0;
  Widget buildNavigationBar(context, setState) {
    var views = [
      Container(height: 100, color: Colors.lime),
      Container(height: 100, color: Colors.purple),
    ];
    return Column(
      children: [
        views[currentPageIndex],
        NavigationBar(
          onDestinationSelected: (int index) {
            setState(() => currentPageIndex = index);
          },
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(icon: Icon(Icons.explore, color: Colors.lime), label: 'lime page'),
            NavigationDestination(icon: Icon(Icons.explore, color: Colors.purple), label: 'purple page'),
          ],
        )
      ],
    );
  }

  print(StatefulBuilder(
    builder: buildNavigationBar..sampleCode = refer("buildNavigationBar"),
  ));

  print.$____________________________________________________________________();
  print.markdown(r'''
## NavigationRail

主要用在Pad或桌面应用上。

> <https://api.dev/flutter/material/NavigationRail-class.html>
> The navigation rail is meant for layouts with wide viewports, such as a desktop web
> or tablet landscape layout. For smaller layouts, like mobile portrait,
> a BottomNavigationBar should be used instead.
''');

  print.$____________________________________________________________________();

  print(
    Row(
      children: [
        SizedBox(
          height: 300,
          child: NavigationRail(
            // minWidth: 10,
            minExtendedWidth: 50,
            // extended: true,
            selectedIndex: 0,
            groupAlignment: 1,
            onDestinationSelected: (_) {}..sampleCodeStr = "(_){}",
            labelType: NavigationRailLabelType.all,
            leading: IconButton(
              onPressed: () {}..sampleCodeStr = "(){}",
              icon: Icon(Icons.access_time),
              tooltip: "NavigationRail.leading",
            ),
            trailing: IconButton(
              onPressed: () {}..sampleCodeStr = "(){}",
              icon: Icon(Icons.exit_to_app),
              tooltip: "NavigationRail.trailing",
            ),
            destinations: <NavigationRailDestination>[
              NavigationRailDestination(icon: Icon(Icons.sanitizer), label: Text('First')),
              NavigationRailDestination(icon: Icon(Icons.accessible), label: Text('Second')),
            ],
          ),
        ),
        Expanded(
            child: Container(
          height: 300,
          color: Colors.amber.shade50,
          child: const Text("main content area"),
        )),
      ],
    ),
  );

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
  print(DefaultTabController(
    length: 3,
    child: TabBar(
      tabs: <Widget>[
        Tab(
          icon: Icon(Icons.cloud_outlined),
          iconMargin: painting.EdgeInsets.all(10),
        ),
        Tab(
          icon: Icon(Icons.beach_access_sharp),
          iconMargin: painting.EdgeInsets.all(10),
        ),
        Tab(
          icon: Icon(Icons.brightness_5_sharp),
          iconMargin: painting.EdgeInsets.all(10),
        ),
      ],
    ),
  ));

  print.$____________________________________________________________________();
  print.markdown(r'''
再来看看加了TabView的完整体，即TabBar实际使用模式：
''');

  print.$____________________________________________________________________();
  print(DefaultTabController(
    initialIndex: 1,
    length: 3,
    child: Column(
      children: [
        TabBar(
          tabs: <Widget>[
            Tab(icon: Icon(Icons.cloud_outlined), iconMargin: painting.EdgeInsets.all(10)),
            Tab(icon: Icon(Icons.beach_access_sharp), iconMargin: painting.EdgeInsets.all(10)),
            Tab(icon: Icon(Icons.brightness_5_sharp), iconMargin: painting.EdgeInsets.all(10)),
          ],
        ),
        Container(
          height: 200,
          child: TabBarView(
            children: <Widget>[
              Center(child: Text("It's cloudy here")),
              Center(child: Text("It's rainy here")),
              Center(child: Text("It's sunny here")),
            ],
          ),
        )
      ],
    ),
  ));

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
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.deepPurpleAccent.shade100,
        content: Column(
          children: [
            const Text("Show Snackbar 6 seconds"),
            IconButton(icon: const Icon(Icons.add), onPressed: () {}),
            IconButton(icon: const Icon(Icons.access_alarm), onPressed: () {}),
          ],
        ),
        action: SnackBarAction(
          label: 'Some Action',
          onPressed: () {},
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  print(SizedBox(
    height: 100,
    child: FilledButton(
      onPressed: onPressed..sampleCode = refer("onPressed"),
      child: const Text('Show Snack bar'),
    ),
  ));

  print.$____________________________________________________________________();
  print.markdown(r'''
## ButtonBar

> <https://api.flutter-io.cn/flutter/material/ButtonBar-class.html>
> An end-aligned row of buttons, laying out into a column if there is not enough horizontal space.
> Used by Dialog to arrange the actions at the bottom of the dialog.

按钮的布局容器，可以按内容的实际宽度在行或列之间调整，其横向还是纵向排列，取决于其宽度：
  ''');

  print.$____________________________________________________________________();
  print(
    Container(
      width: 600,
      color: Colors.lime.shade50,
      child: ButtonBar(
        children: [
          ElevatedButton(
            onPressed: () {}..sampleCodeStr = "(){}",
            child: Text("ElevatedButton2"),
          ),
          OutlinedButton(
            onPressed: () {}..sampleCodeStr = "(){}",
            child: Text('OutlinedButton'),
          ),
        ],
      ),
    ),
  );

  print.$____________________________________________________________________();
  print.markdown(r'''
## OverflowBar

> <https://api.flutter-io.cn/flutter/material/ButtonBar-class.html>

OverflowBar常用场景是Dialog的按钮组容器，children宽度够(未溢出)，横着排，不够（溢出），就竖着排，修改下面最外层Container.width看看：
  ''');

  print.$____________________________________________________________________();
  print(
    Container(
      width: 300,
      child: Column(
        children: [
          Placeholder(fallbackHeight: 100, color: Colors.deepPurple),
          OverflowBar(
            alignment: MainAxisAlignment.end,
            textDirection: TextDirection.ltr,
            overflowSpacing: 5.0,
            overflowAlignment: OverflowBarAlignment.end,
            overflowDirection: VerticalDirection.down,
            children: [
              ElevatedButton(
                onPressed: () {}..sampleCodeStr = "(){}",
                child: Text("Cancel横排还是竖排取决于width"),
              ),
              ElevatedButton(
                onPressed: () {}..sampleCodeStr = "(){}",
                child: Text("Ok对齐方式取决于排列"),
              ),
            ],
          )
        ],
      ),
    ),
  );

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
  click() {
    showAboutDialog(
      context: context,
      applicationName: 'MenuBar Sample',
      applicationVersion: '1.0.0',
    );
  }

  print(
    MenuBar(
      children: [
        MenuItemButton(
          onPressed: () {}..sampleCodeStr = "(){}",
          child: MenuAcceleratorLabel(
            '&Exit',
            builder: MenuAcceleratorLabel.defaultLabelBuilder..sampleCodeStr = "MenuAcceleratorLabel.defaultLabelBuilder",
          ),
        ),
        SubmenuButton(
          menuChildren: [
            MenuItemButton(
              onPressed: click..sampleCodeStr = "click",
              child: MenuAcceleratorLabel(
                '&flutter_note github',
                builder: MenuAcceleratorLabel.defaultLabelBuilder..sampleCodeStr = "MenuAcceleratorLabel.defaultLabelBuilder",
              ),
            )
          ],
          child: MenuAcceleratorLabel(
            '&Help',
            builder: MenuAcceleratorLabel.defaultLabelBuilder..sampleCodeStr = "MenuAcceleratorLabel.defaultLabelBuilder",
          ),
        ),
      ],
    ),
  );
}
