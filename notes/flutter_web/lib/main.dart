import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_web/app.dart';
import 'package:you_flutter/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(App(
    sharedPreferences: await SharedPreferences.getInstance(),
    router: YouRouter(
      root: routes.root,
      initial: routes.routes_notes.toUri(),
      // initial: Uri.base,
      navigatorKey: GlobalKey<NavigatorState>(debugLabel: "mainNavigator"),
    ),
  ));
}
