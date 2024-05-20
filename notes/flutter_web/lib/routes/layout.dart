import 'package:flutter/material.dart';
import 'package:flutter_web/app.dart';
import 'package:you_flutter/better_ui.dart';
import 'package:you_flutter/router.dart';
import 'package:you_flutter/state.dart';
import 'package:you_flutter/ide_style.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

/// [LayoutBuilder]
Widget build(BuildContext context, Widget child) {
  // ignore: unnecessary_type_check
  assert(build is PageLayoutBuilder);
  return RootLayout(child: child);
}

class RootLayout extends StatefulWidget {
  const RootLayout({super.key, required this.child});

  final Widget child;

  @override
  State<StatefulWidget> createState() {
    return RootLayoutState();
  }
}

class RootLayoutState extends State<RootLayout> {
  @override
  Widget build(BuildContext context) {
    final route = context.route$;
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      primary: true,
      appBar: AppBar(toolbarHeight: 38, title: Text("location: ${route.uri}"), foregroundColor: colors.primaryFixed, backgroundColor: colors.onPrimaryFixed, actions: [
        TextButton.icon(
          onPressed: () => _launchUrl(Uri.parse("https://github.com/chen56/you")),
          icon: const Icon(Icons.link),
          label: const Text('github'),
        ),
      ]),
      body: SafeArea(
        child: SelectionArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ViewBar(),
              // widget.child内部自己包滚动条，根layout不管
              Expanded(child: widget.child),
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

Future<void> _launchUrl(Uri url) async {
  if (!await url_launcher.launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}

class ViewBar extends StatefulWidget {
  const ViewBar({super.key});

  @override
  State<StatefulWidget> createState() {
    return ViewBarState();
  }
}

class ViewBarState extends State<ViewBar> {
  final Value<String> view = "note_tree_view".signal();

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    return Watch(builder: (context) {
      return Container(
          color: colors.surfaceContainer,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  IntrinsicHeight(
                    child: Column(
                      children: [
                        IconButton(
                            icon: const Icon(Icons.folder_outlined),
                            isSelected: view.value == "note_tree_view",
                            selectedIcon: const Icon(Icons.folder_rounded),
                            onPressed: () {
                              view.value = view.value == "note_tree_view" ? "" : "note_tree_view";
                            }),
                        const Text("导航"),
                      ],
                    ),
                  ).flexible$(),
                  IntrinsicHeight(
                    child: Column(
                      children: [
                        IconButton(
                            icon: const Icon(Icons.color_lens_outlined),
                            isSelected: view.value == "theme_view",
                            selectedIcon: const Icon(Icons.color_lens_rounded),
                            onPressed: () {
                              view.value = view.value == "theme_view" ? "" : "theme_view";
                            }),
                        const Text("主题"),
                      ],
                    ),
                  ).flexible$(),
                ],
              ),
              const VerticalDivider(width: 1),
              Watch(builder: (context) {
                return NoteTreeView(
                  view: view,
                  noteRoot: routes.routes_notes,
                ).offstage$(offstage: view.value != "note_tree_view");
              }),
              Watch(builder: (context) {
                final app = App.of(context);
                final route = YouRouter.of(context);

                return ThemeView(view: view, themeMode: app.themeMode, seedColor: app.seedColor, extWidgets: [
                  FilledButton(
                    onPressed: () {
                      route.to(routes.routes_notes_material3_color_roles.toUri());
                    },
                    child: const Text("open Material 3 color roles page"),
                  ),
                ]).offstage$(offstage: view.value != "theme_view");
              }),
              // Watch(builder:(context) {
              //   return _ThemeView(view: view).offstage$(offstage: view.value != "theme_view");
              // }),
              const VerticalDivider(width: 1),
            ],
          ));
    });
  }
}
