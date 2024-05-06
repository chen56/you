import 'package:flutter/material.dart';
import 'package:flutter_web/app.dart';
import 'package:you_flutter/better_ui.dart';
import 'package:you_flutter/router.dart';
import 'package:you_flutter/state.dart';

/// [PageLayoutBuilder]
Widget layout(BuildContext context, Widget child) {
  // ignore: unnecessary_type_check
  assert(layout is PageLayoutBuilder);
  return RootLayout(child: child);
}

class RootLayout extends StatelessWidget {
  RootLayout({super.key, required this.child});

  final Widget child;
  final Value<int> navigationRail = 0.signal();

  @override
  Widget build(BuildContext context) {
    final route = context.route$;
    final tokens = context.designTokens$;
    final colors = Theme.of(context).colorScheme;
    NavigationRailDestination rail({required String title, required IconData icon}) {
      return NavigationRailDestination(
        icon: Tooltip(message: title, child: Icon(icon)),
        label: Text(title),
      );
    }

    return Scaffold(
      primary: true,
      appBar: AppBar(toolbarHeight: 38, title: Text("location: ${route.uri}"), foregroundColor: colors.onInverseSurface, backgroundColor: tokens.colors.inverseSurface),
      body: SafeArea(
        child: SelectionArea(
          child: Column(
            children: [
              Row(
                children: [
                  Watch((context) {
                    return NavigationRail(
                      backgroundColor: tokens.colors.surfaceContainer,
                      useIndicator: true,
                      extended: false,
                      onDestinationSelected: (index) => navigationRail.value = index,
                      minWidth: 24,
                      minExtendedWidth: 24,
                      selectedIndex: navigationRail.value,
                      groupAlignment: -1,
                      labelType: NavigationRailLabelType.all,
                      destinations: <NavigationRailDestination>[
                        rail(title: "导航", icon: Icons.folder_outlined),
                        rail(title: "主题", icon: Icons.color_lens_outlined),
                      ],
                      trailing: Column(
                        children: [
                          const Spacer(flex: 1),
                          IconButton(onPressed: () {}, icon: const Icon(Icons.info_outline)),
                        ],
                      ).expanded$(),
                    );
                  }),
                  _RouteTree().flexible$(),
                  Expanded(child: child),
                ],
              ).expanded$(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 30,
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
        child: Row(
          children: [
            Text("${route.uri}"),
          ],
        ),
      ),
    );
  }
}

class _RouteTree extends StatelessWidget {
  _RouteTree();

  final Value<bool> includeDraft = false.signal();

  @override
  Widget build(BuildContext context) {
    final route = context.route$;
    final colors = Theme.of(context).colorScheme;

    return Watch((context) {
      return Column(
        children: [
          Container(
            color: colors.surfaceContainer,
            child: OverflowBar(alignment: MainAxisAlignment.end, children: [
              IconButton(tooltip: "Expand all", icon: const Icon(Icons.expand, size: 24), iconSize: 24, onPressed: () {}),
              IconButton(tooltip: "Collapse all", icon: const Icon(Icons.compress), iconSize: 24, onPressed: () {}),
              IconButton(tooltip: "Include draft", icon: const Icon(Icons.drafts_outlined), iconSize: 24, selectedIcon: const Icon(Icons.drafts), isSelected: includeDraft.value, onPressed: () => includeDraft.value = !includeDraft.value),
            ]),
          ),
          ListView(
            children: _notes(route, includeDraft.value).toList(),
          ).expanded$(),
        ],
      ).constrainedBox$(
        constraints: const BoxConstraints.tightFor(width: 350),
      );
    });
  }

  static Iterable<Widget> _notes(RouteContext route, bool includeDraft) {
    var notes = routes.routes_notes.toList(includeThis: false).where((e) => e.hasPage || e.isNonLeaf);
    return notes.map((node) {
      String title = "▼ ${node.part}";
      title = title.padLeft((node.level * 3) + title.length);

      click() {
        route.to(node.toUri());
      }

      return Align(
        alignment: Alignment.centerLeft,
        child: TextButton(onPressed: node.hasPage ? click : null, child: Text(title)),
      );
    });
  }
}
