import 'package:flutter/material.dart';
import 'package:flutter_web/routes.g.dart';
import 'package:you_flutter/better_ui.dart';
import 'package:you_flutter/router.dart';
import 'package:shared_preferences/shared_preferences.dart';

final routes = Routes();

class App extends StatelessWidget {
  final YouRouter router;
  final SharedPreferences sharedPreferences;

  // ignore: prefer_const_constructors_in_immutables
  App({super.key, required this.router, required this.sharedPreferences});

  @override
  Widget build(BuildContext context) {
    debugPrint("App: Uri.base: ${Uri.base}");
    return MaterialApp.router(
      title: "flutter note",
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.tealAccent.shade700, brightness: Brightness.light), useMaterial3: true),
      darkTheme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: ColorSeed.m3baseline.color, brightness: Brightness.dark), useMaterial3: true),
      routerConfig: router.config(),
    );
  }
}

extension ContextExt on BuildContext {
  DesignTokens get designTokens$ => DesignTokens(this);

  RouteContext get route$ => YouRouter.of(this);
}