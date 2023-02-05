import 'package:learn_flutter/navigator.dart';
import 'package:learn_flutter/screens/screen_404.dart';
import 'screen_main.dart';

class Paths {
  static final List<Path> _list = List.empty(growable: true);

  final root = _rule<void, void>("/", (_) => HomeScreen());
  final home = _rule<void, void>("/home", (_) => HomeScreen());

  // final help = _rule<String, String>("/help", (uri) => HelpScreen.parse(uri));
  final notFound = _rule<void, void>("/404", (uri) => NotFoundScreen(unknown: uri));

  List<Path> get list => List.unmodifiable(_list);

  Paths._();

  static Path<A, R> _rule<A, R>(String name, Screen<A, R>? Function(Uri a) parse) {
    var result = Path<A, R>(path: name, parse: parse);
    _list.add(result);
    return result;
  }
}

// 单例
Paths rules = Paths._();
