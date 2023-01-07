import 'dart:collection';

/// 当前未考虑线程安全问题，此类线程不安全
class Param<T> {
  final Map<String, Param> _children = HashMap();

  bool _initialized = false;
  T value;
  String name;
  String? help;

  // TODO how to private new func
  Param(this.name, {required this.value, this.help});

  Param _child(String name) {
    if (!_children.containsKey(name)) {
      Param empty = Param(name, value: "empty value", help: "");
      return empty;
    }
    return _children[name]!;
  }

  Param<C> path<C>(String path) {
    return path.split(".").fold<Param>(this, (previous, item) => previous._child(item)) as Param<C>;
  }

  Param<C> define<C>(
    String path, {
    required C value,
    String? help,
  }) {
    var paths = path.split(".");
    assert(paths.isNotEmpty, "empty!what? path:$path");

    var last = paths[paths.length - 1];
    var parents = paths.sublist(0, paths.length - 1);

    // ensure all parent node
    Param current = this;
    for (var name in parents) {
      var child = current._children[name];
      if (!current._children.containsKey(name)) {
        child = Param(name, value: null, help: "");
        current._children[name] = child;
      }
      current = child!;
    }

    if (current._children.containsKey(last)) {
      return current._children[last] as Param<C>;
    }

    var result = Param(last, value: value, help: help);
    current._children[last] = result;
    return result;
  }

  static Param root() {
    return Param("root", value: "root", help: "");
  }
}
