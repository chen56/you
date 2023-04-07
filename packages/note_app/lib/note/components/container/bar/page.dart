import 'package:flutter/material.dart';
import 'package:note/page_core.dart';
import 'package:note_mate_flutter/material.dart';

PageMeta page = PageMeta(
  shortTitle: "Bars",
  builder: build,
);

build(Pen pen, BuildContext context) {
  pen.markdown(r'''
## AppBar

一般放在[Scaffold.appBar].

> ref: <https://api.flutter.dev/flutter/material/AppBar-class.html>
''');

  pen.sampleMate(AppBar$Mate(
    title: Text$Mate('AppBar Title'),
    leading: DrawerButton$Mate(),
    actions: <Widget>[
      IconButton$Mate(icon: Icon$Mate(Icons.add), onPressed: () {}),
      IconButton$Mate(icon: Icon$Mate(Icons.access_alarm), onPressed: () {}),
      CheckboxMenuButton$Mate(
        value: true,
        onChanged: (b) {},
        child: Text$Mate('CheckboxMenuButton'),
      ),
      FilledButton$Mate(onPressed: () {}, child: Text$Mate('FilledButton')),
    ],
    notificationPredicate: defaultScrollNotificationPredicate,
  ));

  pen.markdown(r'''
## BottomAppBar

一般放在[Scaffold.bottomNavigationBar].

> ref <https://api.flutter.dev/flutter/material/BottomAppBar-class.html>

''');
  //
  pen.sampleMate(BottomAppBar$Mate(
    // shape: CircularNotchedRectangle(),
    child: Row$Mate(
      children: <Widget>[
        IconButton$Mate(
          tooltip: 'Open navigation menu',
          icon: Icon$Mate(Icons.menu),
          onPressed: () {},
        ),
        Spacer$Mate(),
        IconButton$Mate(
          tooltip: 'Search',
          icon: Icon$Mate(Icons.search),
          onPressed: () {},
        ),
        IconButton$Mate(
          tooltip: 'Favorite',
          icon: Icon$Mate(Icons.favorite),
          onPressed: () {},
        ),
      ],
    ),
  ));

  pen.markdown(r'''
## NavigationBar

> 📣Material 3 Navigation Bar component. replacing BottomNavigationBar.

一般放在[Scaffold.bottomNavigationBar], 但按flutter的调性，当然是哪都能放。

> ref <https://api.flutter.dev/flutter/material/BottomAppBar-class.html>

''');

  pen.sampleMate(Column$Mate(
    children: [
      Container$Mate(
        height: 100,
        // color: Colors.lime,
        child: Text$Mate("main content body"),
      ),
      NavigationBar$Mate(
        onDestinationSelected: (int index) {},
        selectedIndex: 1,
        destinations: <Widget>[
          NavigationDestination$Mate(icon: Icon$Mate(Icons.explore), label: 'Explore'),
          NavigationDestination$Mate(icon: Icon$Mate(Icons.commute), label: 'Commute'),
        ],
      )
    ],
  ));
  pen.markdown(r'''
NavigationBar 的主要用途类似Tab，加上[NavigationBar.onDestinationSelected]的事件，就能在不同页面切换，如下：
''');

  pen.sampleBlock(
    title: "TODO Sample中包含复杂函数代码，暂不支持生成相关代码",
    (root) {
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
                NavigationDestination(
                    icon: Icon(Icons.explore, color: Colors.lime), label: 'lime page'),
                NavigationDestination(
                    icon: Icon(Icons.explore, color: Colors.purple), label: 'purple page'),
              ],
            )
          ],
        );
      }

      return StatefulBuilder(
        builder: buildNavigationBar,
      );
    },
  );

  pen.markdown(r'''
## NavigationRail

主要用在Pad或桌面应用上。

> <https://api.flutter.dev/flutter/material/NavigationRail-class.html>
> The navigation rail is meant for layouts with wide viewports, such as a desktop web or tablet landscape layout. For smaller layouts, like mobile portrait, a BottomNavigationBar should be used instead.



''');

  var navigationRail$Mate = NavigationRail$Mate(
    // minWidth: 10,
    minExtendedWidth: 50,
    // extended: true,
    selectedIndex: 0,
    groupAlignment: 1,
    onDestinationSelected: (int index) {},
    labelType: NavigationRailLabelType.all,
    leading: IconButton$Mate(
      onPressed: () {},
      icon: Icon$Mate(Icons.access_time),
      tooltip: "NavigationRail.leading",
    ),
    trailing: IconButton$Mate(
      onPressed: () {},
      icon: Icon$Mate(Icons.exit_to_app),
      tooltip: "NavigationRail.trailing",
    ),
    destinations: <NavigationRailDestination>[
      NavigationRailDestination$Mate(icon: Icon$Mate(Icons.sanitizer), label: Text$Mate('First')),
      NavigationRailDestination$Mate(icon: Icon$Mate(Icons.accessible), label: Text$Mate('Second')),
    ],
  );

  pen.sampleMate(
    Row$Mate(
      children: [
        Container$Mate(
          height: 300,
          child: navigationRail$Mate,
        ),
        Expanded(
            child: Container$Mate(
          height: 300,
          color: Colors.amber.shade50,
          child: const Text("main content area"),
        )),
      ],
    ),
  );
}
