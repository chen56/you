import 'package:flutter/material.dart';
import 'package:flutter_web/app.dart';
import 'package:you_flutter/better_ui.dart';
import 'package:you_flutter/note.dart';
import 'package:you_flutter/router.dart';
import 'package:you_flutter/state.dart';
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
              SingleChildScrollView(
                // children: [widget.child.align$(alignment: Alignment.topLeft)],
                child: widget.child,
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
    return Watch((context) {
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
              Watch((context) {
                return NoteTreeView(
                  view: view,
                  noteRoot: routes.routes_notes,
                ).offstage$(offstage: view.value != "note_tree_view");
              }),
              Watch((context) {
                return _ThemeView(view: view).offstage$(offstage: view.value != "theme_view");
              }),
              const VerticalDivider(width: 1),
            ],
          ));
    });
  }
}

class _ThemeView extends StatefulWidget {
  const _ThemeView({required this.view});

  final Value<String> view;

  @override
  State<StatefulWidget> createState() {
    return _ThemeViewState();
  }
}

class _ThemeViewState extends State<_ThemeView> {
  final Value<bool> includeDraft = false.signal();

  @override
  Widget build(BuildContext context) {
    final route = YouRouter.of(context);
    final colors = Theme.of(context).colorScheme;

    List<Color> getChildrenColors(MaterialColor e) {
      return [
        e.shade50,
        e.shade100,
        e.shade200,
        e.shade300,
        e.shade400,
        e.shade500,
        e.shade600,
        e.shade700,
        e.shade800,
        e.shade900,
      ];
    }

    return Column(
      children: [
        Container(
          color: colors.surfaceContainer,
          child: OverflowBar(alignment: MainAxisAlignment.end, children: [
            IconButton(tooltip: "Hidden", icon: const Icon(Icons.horizontal_rule), iconSize: 24, onPressed: () => widget.view.value = ""),
          ]),
        ),
        const Divider(),
        const SizedBox(
          height: 20,
        ),
        const Text("Theme mode"),
        Card(
          child: Watch((context) {
            final app = App.of(context);
            return SegmentedButton<ThemeMode>(
              segments: const <ButtonSegment<ThemeMode>>[
                ButtonSegment<ThemeMode>(value: ThemeMode.light, label: Text('Light'), icon: Icon(Icons.light_mode_outlined)),
                ButtonSegment<ThemeMode>(value: ThemeMode.system, label: Text('Sys'), icon: Icon(Icons.brightness_auto_outlined)),
                ButtonSegment<ThemeMode>(value: ThemeMode.dark, label: Text('Dark'), icon: Icon(Icons.dark_mode_outlined)),
              ],
              selected: <ThemeMode>{app.themeMode.value},
              onSelectionChanged: (Set<ThemeMode> newSelection) {
                app.themeMode.value = newSelection.first;
              },
            );
          }),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text("Theme color seed"),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ...Colors.primaries.map((e) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: getChildrenColors(e).map((color) => ColorBlock(color: color)).toList(),
              );
            }),
          ],
        ).paddingAll$(10),
        FilledButton(
            onPressed: () {
              route.to(routes.routes_notes_material3_color_roles.toUri());
            },
            child: const Text("open Material 3 color roles page")),
      ],
    ).constrainedBox$(
      constraints: const BoxConstraints.tightFor(width: 280),
    );
  }
}

// color block
class ColorBlock extends StatelessWidget {
  final Color color;

  const ColorBlock({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    final app = App.of(context);
    Widget colorWidget = Container(width: 20, height: 20, color: color);
    return InkWell(
      onTap: () {
        app.seedColor.value = color;
      },
      child: Watch((context) {
        return app.seedColor.value == color ? colorWidget.borderAll$() : colorWidget;
      }),
    );
  }
}
