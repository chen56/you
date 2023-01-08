import 'dart:collection';
import 'dart:core';
import 'dart:ui';

/// 当前未考虑线程安全问题，包内的代码线程不安全

class Params {
  final Map<String, NullableEditor> _editors = HashMap();
  final Map<String, NullableParam> _params = HashMap();

  StringEditor ofString(
    String path, {
    String? value,
  }) {
    return _initOnce(path, () => StringEditor(value: value));
  }

  TextAlignEditor ofTextAlign<T extends Enum>(
    String path, {
    TextAlign? value,
  }) {
    return _initOnce(path, () => TextAlignEditor());
  }

  // TODO 这个还要不要？
  NullableEditor path(String path) {
    if (!_editors.containsKey(path)) {
      return _EmptyParam.empty;
    }
    return _editors[path]!;
  }

  T _initOnce<T extends NullableEditor>(String path, T Function() create) {
    return _editors.putIfAbsent(path, create) as T;
  }
}

abstract class NullableEditor<T> {
  T? value;

  // T? get value;
  // set value(T? value);
  NullableEditor({this.value});

  get isEmpty => this is _EmptyParam;
  Param<T> notNull();
}

class NullableParam<T> extends Param<T?> {
  T defaultValue;
  NullableParam({
    super.value,
    required this.defaultValue,
  });
}

class _EmptyParam extends NullableEditor<String> {
  static _EmptyParam empty = _EmptyParam();

  _EmptyParam() : super(value: "Empty");

  @override
  Param<String> notNull() {
    return Param(value: "Empty");
  }
}

class Param<T> {
  T value;

  Param({
    required this.value,
  });
}

class StringEditor extends NullableEditor<String> {
  // @override
  // String? value;

  StringEditor({
    super.value,
  });

  @override
  Param<String> notNull() => Param(value: value ?? "");
}

abstract class EnumEditor<T> extends NullableEditor<T?> {
  EnumEditor({
    super.value,
  });
}

class TextAlignEditor extends EnumEditor<TextAlign?> {
  @override
  Param<TextAlign> notNull() => Param(value: value ?? TextAlign.center);
}

// class TreeParamTemp<T> {
//   final Map<String, TreeParamTemp> _children = HashMap();

//   static const String separator = ".";

//   T value;
//   String name;
//   String? help;

//   // TODO how to private new func
//   TreeParamTemp(this.name, {required this.value, this.help});

//   TreeParamTemp _child(String name) {
//     if (!_children.containsKey(name)) {
//       TreeParamTemp empty = TreeParamTemp(name, value: "empty value", help: "");
//       return empty;
//     }
//     return _children[name]!;
//   }

//   TreeParamTemp<C> path<C>(String path) {
//     return path.split(".").fold<TreeParamTemp>(this, (previous, item) => previous._child(item)) as TreeParamTemp<C>;
//   }

//   TreeParamTemp<C> define<C>(
//     String path, {
//     required C value,
//     String? help,
//   }) {
//     var paths = path.split(separator);
//     assert(paths.isNotEmpty, "empty!what? path:$path");

//     var last = paths[paths.length - 1];
//     var parents = paths.sublist(0, paths.length - 1);

//     // ensure all parent node
//     TreeParamTemp current = this;
//     for (var name in parents) {
//       var child = current._children[name];
//       if (!current._children.containsKey(name)) {
//         child = TreeParamTemp(name, value: null, help: "");
//         current._children[name] = child;
//       }
//       current = child!;
//     }

//     // 只能define一次，已定义过的直接返回
//     if (current._children.containsKey(last)) {
//       return current._children[last] as TreeParamTemp<C>;
//     }

//     var result = TreeParamTemp(last, value: value, help: help);
//     current._children[last] = result;
//     return result;
//   }

//   static TreeParamTemp root() {
//     return TreeParamTemp("root", value: "root", help: "");
//   }
// }
