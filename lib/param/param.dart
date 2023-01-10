import 'dart:collection';
import 'dart:core';
import 'dart:developer' as developer;

import 'package:flutter/material.dart';

/// 当前未考虑线程安全问题，包内的代码线程不安全

class Params {
  final Map<String, Param> _editors = HashMap();
  late final _EmptyParam _empty = _EmptyParam(this)..notNull("Empty");
  Params();
  StringParam ofString(String path) {
    return _initOnce(path, () => StringParam(this));
  }

  TextAlignParam ofTextAlign<T extends Enum>(String path) {
    return _initOnce(path, () => TextAlignParam(this));
  }

// TODO 这个还要不要？
  Param path(String path) {
    if (!_editors.containsKey(path)) {
      return _empty;
    }
    return _editors[path]!;
  }

  T _initOnce<T extends Param>(String path, T Function() create) {
    return _editors.putIfAbsent(path, create) as T;
  }
}

class _EmptyParam extends Param<String> {
  _EmptyParam(super.params);

  @override
  StatefulBuilder builder() {
    throw UnimplementedError("_EmptyParam not support this method");
  }
}

abstract class Param<T> {
  T? value;
  bool isNullable = true;
  Params params;
  bool _initialized = false;

  Param(this.params, {this.value});

  get isEmpty => this is _EmptyParam;

  T notNull(T defaultValue) {
    if (!_initialized) {
      value = defaultValue;
      isNullable = false;
      _initialized=true;
    }
    return value??defaultValue;
  }

  T? nullable(T? defaultValue) {
    if (!_initialized) {
      value = defaultValue;
      isNullable = true;
      _initialized=true;
    }
    return value;
  }

  StatefulBuilder builder();
}

class StringParam extends Param<String> {
  StringParam(super.params);

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

abstract class EnumParam<T extends Enum> extends Param<T> {
  final List<T> values;

  EnumParam(
    super.params, {
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

class TextAlignParam extends EnumParam<TextAlign> {
  TextAlignParam(super.params) : super(values: TextAlign.values);
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
