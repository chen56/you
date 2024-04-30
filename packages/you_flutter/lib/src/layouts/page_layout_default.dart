import 'package:flutter/material.dart';
import 'package:you_flutter/src/router.dart';

class PageLayoutDefault extends StatelessWidget {
  final PageBuilder builder;
  final ToUri uri;

  PageLayoutDefault({required this.builder, required this.uri});

  @override
  Widget build(BuildContext context) {
    var child = builder(context);

    NavigationRailDestination rail({required String title, required IconData icon}) {
      return NavigationRailDestination(
        icon: Tooltip(message: title, child: Icon(icon)),
        label: Text(title),
      );
    }

    return Scaffold(
      primary: true,
      // content...
      appBar: AppBar(toolbarHeight: 38, title: Text("location: $uri"), actions: [
        IconButton(iconSize: 24, icon: const Icon(Icons.color_lens_outlined), onPressed: () {}),
        IconButton(iconSize: 24, icon: const Icon(Icons.settings), onPressed: () {}),
      ]),
      floatingActionButton: FloatingActionButton(onPressed: () {}, tooltip: 'Increment', child: const Icon(Icons.add)),
      body: SafeArea(
        child: SelectionArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              NavigationRail(onDestinationSelected: (index) {}, minWidth: 24, minExtendedWidth: 24, selectedIndex: null, groupAlignment: -1, labelType: NavigationRailLabelType.none, destinations: <NavigationRailDestination>[
                rail(title: "文件夹", icon: Icons.folder_outlined),
                rail(title: "文件夹2", icon: Icons.folder_outlined),
              ]),
              Drawer(
                width: 200,
                child: _RouteTree(),
              ),
              Expanded(child: child),
            ],
          ),
        ),
      ),
    );
  }
}

class _RouteTree extends StatelessWidget {
  const _RouteTree();

  @override
  Widget build(BuildContext context) {
    final router = YouRouter.of(context);

    var validRoutes = router.root.toList();
    var routeWidgets = validRoutes.map((node) {
      String title = "▼ ${node.part}";
      title = title.padLeft((node.level * 3) + title.length);

      var click = () {
        router.to(node.toUri());
      };
      return Align(
        alignment: Alignment.centerLeft,
        child: TextButton(onPressed: click, child: Text(title)),
      );
    });
    return ConstrainedBox(
        constraints: BoxConstraints.tightFor(width: 350),
        child: ListView(
          children: [
            ...routeWidgets,
          ],
        ));
  }
}
