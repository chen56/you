import 'dart:collection';
import 'dart:core';
import 'dart:developer' as developer;

import 'package:flutter/material.dart';

class Params {
  final Map<String, Editor> _editors = HashMap();
  late final _EmptyEditor _empty = _EmptyEditor()..notNull("Empty");

  Params();

  OfString ofString(String path) {
    return _initOnce(path, () => OfString());
  }

  OfDouble ofDouble(String path) {
    return _initOnce(path, () => OfDouble());
  }

  OfTextAlign ofTextAlign<T extends Enum>(String path) {
    return _initOnce(path, () => OfTextAlign());
  }

// TODO 这个还要不要？看来这个方法是多余的
  Editor path(String path) {
    if (!_editors.containsKey(path)) {
      return _empty;
    }
    return _editors[path]!;
  }

  T _initOnce<T extends Editor>(String path, T Function() create) {
    return _editors.putIfAbsent(path, () {
      var p = create();
      p.params = this;
      return p;
    }) as T;
  }

  T insert<T>(String path, T value, Editor<T> param) {
    param.value=value;
    _editors[path] = param;
    return value;
  }

  T? insert_<T>(String path, T? value,[Editor<T>? editor]) {
    editor ??= OfObject<T>();
    editor.value=value;
    _editors[path] = editor;
    return value;
  }
}

class _EmptyEditor extends Editor<String> {
  _EmptyEditor();

  @override
  StatefulBuilder builder() {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return const Text("error:_EmptyParam",
          style: TextStyle(
            color: Colors.red,
            backgroundColor: Colors.yellow,
          ));
    });
  }
}

abstract class Editor<T> {
  T? value;
  bool isNullable = true;
  late final Params params;
  bool _initialized = false;

  Editor();

  get isEmpty => this is _EmptyEditor;

  T notNull(T defaultValue) {
    if (!_initialized) {
      value = defaultValue;
      isNullable = false;
      _initialized = true;
    }
    return value ?? defaultValue;
  }

  T? nullable([T? defaultValue]) {
    if (!_initialized) {
      value = defaultValue;
      isNullable = true;
      _initialized = true;
    }
    return value;
  }

  StatefulBuilder builder();
}

class OfString extends Editor<String> {
  OfString();

  StatefulBuilder builder() {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return TextField(
        autofocus: true,
        decoration: const InputDecoration(
          labelText: "Text#data",
          hintText: "Text#data",
          prefixIcon: Icon(Icons.ac_unit),
        ),
        onChanged: (value) {
          setState(() {
            developer.log("text.data:$value", name: 'learn_flutter');
            this.value = value;
          });
        },
      );
    });
  }
}

class OfDouble extends Editor<double> {
  OfDouble();

  StatefulBuilder builder() {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return TextField(
        autofocus: true,
        decoration: const InputDecoration(
          labelText: "double",
          hintText: "double",
          prefixIcon: Icon(Icons.ac_unit),
        ),
        onChanged: (value) {
          setState(() {
            developer.log("double:$value", name: 'learn_flutter');
            this.value = double.tryParse(value);
          });
        },
      );
    });
  }
}

class OfObject<T> extends Editor<T> {
  OfObject();

  StatefulBuilder builder() {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Text("TODO ObjectEditor.builder");
    });
  }
}

abstract class EnumEditor<T extends Enum> extends Editor<T> {
  final List<T> values;

  EnumEditor({
    required this.values,
  });

  StatefulBuilder builder() {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      var chips = values.map((e) => ChoiceChip(
            label: Text(e.name),
            selected: value == e,
            onSelected: (bool selected) {
              setState(() {
                value = selected ? e : null;
              });
            },
          ));

      return Wrap(
        spacing: 8.0, // gap between adjacent chips
        runSpacing: 4.0, // gap between lines
        children: chips.toList(),
      );
    });
  }
}

class OfTextAlign extends EnumEditor<TextAlign> {
  OfTextAlign() : super(values: TextAlign.values);
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
