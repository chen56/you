// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const App());
// }
//
// class App extends StatefulWidget {
//   const App({super.key});
//
//   @override
//   State<StatefulWidget> createState() {
//     return AppState();
//   }
// }
//
// class AppState extends State<App> {
//   final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
//   final List<RouteInformation> _history = List.empty(growable: true);
//
//   @override
//   Widget build(BuildContext context) {
//     var drawer = Drawer(
//       child: ListView(
//         children: [
//           ListTile(title: const Text("Home"), onTap: () => {}),
//           ListTile(title: const Text("ABout"), onTap: () => {}),
//         ],
//       ),
//     );
//     var pages = _history.map((e) {
//       String location = e.location!;
//       return MaterialPage(
//         // key: ValueKey(i),
//         name: location,
//         child: Builder(
//           builder: (context) {
//             var drawer = Drawer(
//               child: ListView(
//                 children: [
//                   ListTile(title: const Text("Home"), onTap: () => onTap("/")),
//                   ListTile(title: const Text("About"), onTap: () => onTap("/about")),
//                   ListTile(title: const Text("Help "), onTap: () => onTap("/help")),
//                 ],
//               ),
//             );
//             var scaffold = Scaffold(
//               // drawer: drawer,
//               appBar: AppBar(title: const Text(' Samples')),
//               body: Row(children: <Widget>[
//                 drawer,
//                 Expanded(child: routeRule.builder(context)),
//               ]),
//             );
//             return scaffold;
//           },
//         ),
//       );
//     });
//     Navigator(
//       key: navigatorKey,
//       onPopPage: (Route<dynamic> route, dynamic result) {
//         log('build.onPopPage: route:${route.settings.name}');
//         if (_history.isEmpty) {
//           return false;
//         }
//         if(!route.didPop(result)){
//           return false;
//         }
//         setState(() {
//           _history.removeLast();
//         });
//         return true;
//       },
//       pages: pages.toList(),
//     );
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: const Text("Drawer Sample")),
//         body: Row(children: [
//           drawer,
//           const Text("Drawer 既可以弹出、收起，还可以直接放到body里"),
//         ]),
//       ),
//     );
//   }
//
//   void log(Object? message) {
//     if (kDebugMode) {
//       print("$runtimeType(id:${identityHashCode(this)}) - $message ");
//     }
//   }
// }
