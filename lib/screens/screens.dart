import 'package:learn_flutter/navigator.dart';
import 'package:learn_flutter/screens/screen_404.dart';
import 'screen_main.dart';

class Paths {
  static final List<Path> _list = List.empty(growable: true);

  final root = _rule<void, void>("/", (_) => HomeScreen());
  final home = _rule<void, void>("/home", (_) => HomeScreen());
  final notFound = _rule<void, void>("/404", (uri) => NotFoundScreen(unknown: uri));
  final note = _rule<void, void>("/note", (uri) => NotFoundScreen(unknown: uri));
  late final x = print(note.path);

  List<Path> get list => List.unmodifiable(_list);

  Paths._();

  static Path<A, R> _rule<A, R>(String name, Screen<A, R>? Function(Uri a) parse) {
    var result = Path<A, R>(path: name, parse: parse);
    _list.add(result);
    return result;
  }
}
class Note{

}
// 单例
Paths rules = Paths._();
main(){
  print(rules);
}