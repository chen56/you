import 'package:flutter/material.dart';
import 'package:flutter/painting.dart' as painting;
import 'package:you_note_dart/note.dart';

void build(BuildContext context, Note print) {
  print(const MD(r'''
## AppBar

一般放在[Scaffold.appBar].
a
b

> ref: <https://api.dev/flutter/material/AppBar-class.html>
'''));

  print=print.next(title:const Text("new cell-----------------"));
  print(
    AppBar(
      title: const Text('AppBar Title'),
      leading: const DrawerButton(),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.access_alarm),
          onPressed: () {},
        ),
        CheckboxMenuButton(
          value: true,
          onChanged: (b) {},
          child: const Text('CheckboxMenuButton'),
        ),
        FilledButton(
          onPressed: () {},
          child: const Text('FilledButton'),
        ),
      ],
    ),
  );

  print=print.next(title:const Text("new cell-----------------"));
  print(const MD(r'''
## BottomAppBar

一般放在[Scaffold.bottomNavigationBar].

> ref <https://api.dev/flutter/material/BottomAppBar-class.html>

'''));
  //

  print=print.next(title:const Text("new cell-----------------"));
  print(
    BottomAppBar(
      // shape: CircularNotchedRectangle(),
      child: Row(
        children: <Widget>[
          IconButton(
            tooltip: 'Open navigation menu',
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
          const Spacer(),
          IconButton(
            tooltip: 'Search',
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            tooltip: 'Favorite',
            icon: const Icon(Icons.favorite),
            onPressed: () {},
          ),
        ],
      ),
    ),
  );

  print=print.next(title:const Text("new cell-----------------"));
  print(const MD(r'''

## ~~BottomNavigationBar~~

~~BottomNavigationBar~~ 不建议使用，被[NavigationBar]替换

## NavigationBar

> 📣Material 3 Navigation Bar component. replacing BottomNavigationBar.

一般放在[Scaffold.bottomNavigationBar], 但按flutter的调性，当然是哪都能放。

> ref <https://api.dev/flutter/material/BottomAppBar-class.html>


先看看不加逻辑时NavigationBar的长相：
'''));

  print=print.next(title:const Text("new cell-----------------"));
  print(
    Column(
      children: [
        const SizedBox(
          height: 100,
          // color: Colors.lime,
          child: Text("main content body"),
        ),
        NavigationBar(
          onDestinationSelected: (_) {},
          selectedIndex: 1,
          destinations: const <Widget>[
            NavigationDestination(icon: Icon(Icons.explore), label: 'Explore'),
            NavigationDestination(icon: Icon(Icons.commute), label: 'Commute'),
          ],
        )
      ],
    ),
  );

  print=print.next(title:const Text("new cell-----------------"));
  print(const MD(r'''
NavigationBar 的主要用途类似TabBar，加上[NavigationBar.onDestinationSelected]的事件，就能在不同页面切换，如下：
'''));

  print=print.next(title:const Text("new cell-----------------"));
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
    builder: buildNavigationBar,
  ));

  print=print.next(title:const Text("new cell-----------------"));
  print(const MD(r'''
## NavigationRail

主要用在Pad或桌面应用上。

> <https://api.dev/flutter/material/NavigationRail-class.html>
> The navigation rail is meant for layouts with wide viewports, such as a desktop web
> or tablet landscape layout. For smaller layouts, like mobile portrait,
> a BottomNavigationBar should be used instead.
'''));

  print=print.next(title:const Text("new cell-----------------"));

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
            onDestinationSelected: (_) {},
            labelType: NavigationRailLabelType.all,
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.access_time),
              tooltip: "NavigationRail.leading",
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.exit_to_app),
              tooltip: "NavigationRail.trailing",
            ),
            destinations: const <NavigationRailDestination>[
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

  print=print.next(title:const Text("new cell-----------------"));
  print(const MD(r'''
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
'''));

  print=print.next(title:const Text("new cell-----------------"));
  print(const DefaultTabController(
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

  print=print.next(title:const Text("new cell-----------------"));
  print(const MD(r'''
再来看看加了TabView的完整体，即TabBar实际使用模式：
'''));

  print=print.next(title:const Text("new cell-----------------"));
  print(const DefaultTabController(
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
        SizedBox(
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

  print=print.next(title:const Text("new cell-----------------"));
  print(const MD("""
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
"""));

  print=print.next(title:const Text("new cell-----------------"));
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
      onPressed: onPressed,
      child: const Text('Show Snack bar'),
    ),
  ));

  print=print.next(title:const Text("new cell-----------------"));
  print(const MD(r'''
## ButtonBar

> <https://api.flutter-io.cn/flutter/material/ButtonBar-class.html>
> An end-aligned row of buttons, laying out into a column if there is not enough horizontal space.
> Used by Dialog to arrange the actions at the bottom of the dialog.

按钮的布局容器，可以按内容的实际宽度在行或列之间调整，其横向还是纵向排列，取决于其宽度：
  '''));

  print=print.next(title:const Text("new cell-----------------"));
  print(
    Container(
      width: 600,
      color: Colors.lime.shade50,
      child: ButtonBar(
        children: [
          ElevatedButton(
            onPressed: () {},
            child: const Text("ElevatedButton2"),
          ),
          OutlinedButton(
            onPressed: () {},
            child: const Text('OutlinedButton'),
          ),
        ],
      ),
    ),
  );

  print=print.next(title:const Text("new cell-----------------"));
  print(const MD(r'''
## OverflowBar

> <https://api.flutter-io.cn/flutter/material/ButtonBar-class.html>

OverflowBar常用场景是Dialog的按钮组容器，children宽度够(未溢出)，横着排，不够（溢出），就竖着排，修改下面最外层Container.width看看：
  '''));

  print=print.next(title:const Text("new cell-----------------"));
  print(
    SizedBox(
      width: 300,
      child: Column(
        children: [
          const Placeholder(fallbackHeight: 100, color: Colors.deepPurple),
          OverflowBar(
            alignment: MainAxisAlignment.end,
            textDirection: TextDirection.ltr,
            overflowSpacing: 5.0,
            overflowAlignment: OverflowBarAlignment.end,
            overflowDirection: VerticalDirection.down,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text("Cancel横排还是竖排取决于width"),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Ok对齐方式取决于排列"),
              ),
            ],
          )
        ],
      ),
    ),
  );

  print=print.next(title:const Text("new cell-----------------"));
  print(const MD(r'''
## PlatformMenuBar

> <https://api.flutter-io.cn/flutter/widgets/PlatformMenuBar-class.html>

PlatformMenuBar 目前之支持macOS（2023-04），不玩了。

## MenuBar

> <https://api.flutter-io.cn/flutter/widgets/MenuBar-class.html>

MenuBar相关组件：

- MenuAnchor, a widget that creates a region with a submenu and shows it when requested.
- SubmenuButton, a menu item which manages a submenu.
- MenuItemButton, a leaf menu item which displays the label, an optional shortcut label, and optional leading and trailing icons.
  '''));

  print=print.next(title:const Text("new cell-----------------"));
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
          onPressed: () {},
          child: const MenuAcceleratorLabel(
            '&Exit',
            builder: MenuAcceleratorLabel.defaultLabelBuilder,
          ),
        ),
        SubmenuButton(
          menuChildren: [
            MenuItemButton(
              onPressed: click,
              child: const MenuAcceleratorLabel(
                '&flutter_web github',
                builder: MenuAcceleratorLabel.defaultLabelBuilder,
              ),
            )
          ],
          child: const MenuAcceleratorLabel(
            '&Help',
            builder: MenuAcceleratorLabel.defaultLabelBuilder,
          ),
        ),
      ],
    ),
  );
}
