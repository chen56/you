import 'package:flutter/material.dart';
import 'package:flutter_web/routes.g.dart';
import 'package:you_flutter/better_ui.dart';
import 'package:you_flutter/router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:you_flutter/state.dart';

final routes = Routes();

class App extends StatefulWidget {
  final YouRouter router;
  final SharedPreferences sharedPreferences;

  const App({super.key, required this.router, required this.sharedPreferences});

  static AppState of(BuildContext context) {
    return context.findAncestorStateOfType<AppState>()!;
  }

  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  final Value<ThemeMode> themeMode = ThemeMode.system.signal();
  final Value<Color> seedColor = ColorSeed.m3baseline.color.signal();

  @override
  Widget build(BuildContext context) {
    debugPrint("App: Uri.base: ${Uri.base}");
    return Watch(builder:(context) {
      return MaterialApp.router(
        title: "flutter note",
        themeMode: themeMode.value,
        theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: seedColor.value, brightness: Brightness.light), useMaterial3: true),
        darkTheme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: seedColor.value, brightness: Brightness.dark), useMaterial3: true),
        routerConfig: widget.router.config,
      );
    });
  }
}

extension ContextExt on BuildContext {
  DesignTokens get designTokens$ => DesignTokens.of(this);

  RouteContext get route$ => YouRouter.of(this);
}
