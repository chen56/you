import 'package:learn_flutter/navigator.dart';
import 'package:learn_flutter/screens/screen_404.dart';
import 'screen_main.dart';

class Paths {
  static final List<PegImpl> _list = List.empty(growable: true);

  final root = _rule<void>("/", (_) => HomeScreen());
  final home = _rule<void>("/home", (_) => HomeScreen());
  final notFound = _rule<void>("/404", (uri) => NotFoundScreen(unknown: uri));
  final note = _rule<void>("/note", (uri) => NotFoundScreen(unknown: uri));
  late final x = print(note.path);

  List<PegImpl> get list => List.unmodifiable(_list);

  Paths._();

  static PegImpl<R> _rule<R>(String name, Screen<R>? Function(Uri a) parse) {
    var result = PegImpl<R>(path: name, parse: parse);
    _list.add(result);
    return result;
  }
}

class Note {}

// 单例
Paths rules = Paths._();

main() {
  print(rules);
}
