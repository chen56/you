import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:you_flutter/router.dart';

/// ref: [PageLayoutBuilder]
Widget layout(BuildContext context, PageBuilder builder) {
  // ignore: unnecessary_type_check
  return RootLayout(
    builder: builder,
  );
}

@immutable
final class RootLayout extends StatelessWidget {
  final PageBuilder builder;

  const RootLayout({super.key, required this.builder});

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
      appBar: AppBar(toolbarHeight: 38, title: const Text("widget.title"), actions: [
        IconButton(iconSize: 24, icon: const Icon(Icons.color_lens_outlined), onPressed: () {}),
        IconButton(iconSize: 24, icon: const Icon(Icons.settings), onPressed: () {}),
        if (kDebugMode) const Text("debug模式"),
      ]),
      floatingActionButton: FloatingActionButton(onPressed: () {}, tooltip: 'Increment', child: const Icon(Icons.add)),
      body: SafeArea(
        child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          NavigationRail(onDestinationSelected: (index) {}, minWidth: 24, minExtendedWidth: 24, selectedIndex: null, groupAlignment: -1, labelType: NavigationRailLabelType.none, destinations: <NavigationRailDestination>[
            rail(title: "文件夹", icon: Icons.folder_outlined),
          ]),
          Drawer(
              width: 200,
              child: ListView(scrollDirection: Axis.vertical, children: [
                const Divider(),
                ListTile(title: const Text('根页面'), subtitle: const Text("xxx"), onTap: () {}),
                const Divider(),
              ])),
          Expanded(child: child),
        ]),
      ),
    );
  }
}
