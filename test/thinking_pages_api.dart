// ignore_for_file: unused_local_variable


import 'package:test/test.dart';

void main() {
  test('param api 实验 ，dart的范型和nullable难搞', () {
    print(rules.x);
  });
}

class Paths {
  static final List<Path> _list = List.empty(growable: true);

  final root = _rule<void, void>("/", (_) => "HomeScreen()");
  final home = _rule<void, void>("/home", (_) => "HomeScreen()");
  final notFound = _rule<void, void>("/404", (uri) => "NotFoundScreen(unknown: uri)");
  final note = _rule<void, void>("/note", (uri) => "NotFoundScreen(unknown: uri)");
  late final x = note.child(note.path, (uri) => "NotFoundScreen(unknown: uri)");

  List<Path> get list => List.unmodifiable(_list);

  Paths._();

  static Path<A, R> _rule<A, R>(String name, String Function(Uri a) parse) {
    var result = Path<A, R>(path: name, parse: parse);
    _list.add(result);
    return result;
  }
}

class Note {}

class Path<A, R> {
  Path({
    required this.path,
    required this.parse,
  });

  final String Function(Uri uri) parse;
  final String path;

  @override
  String toString() {
    return path;
  }

  Path child(String path, String Function(Uri a) parse) {
    print("ssss");
    return Path(path: path, parse: parse);
  }
}

// 单例
Paths rules = Paths._();
