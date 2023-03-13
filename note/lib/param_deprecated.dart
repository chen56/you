import 'dart:collection';
import 'dart:core';
import 'dart:developer' as developer;

import 'package:flutter/material.dart';

@Deprecated("已完全被mate库取代")
class ParamNode {
  final Map<String, Editor> _editors = HashMap();
  late final _EmptyEditor _empty = _EmptyEditor()..notNull("Empty");

  OfString ofString(String path) {
    return _initOnce(path, () => OfString());
  }

  OfDouble ofDouble(String path) {
    return _initOnce(path, () => OfDouble());
  }

  OfTextAlign ofTextAlign<T extends Enum>(String path) {
    return _initOnce(path, () => OfTextAlign());
  }

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
    param.value = value;
    _editors[path] = param;
    return value;
  }

  T? insert_<T>(String path, T? value, [Editor<T>? editor]) {
    editor ??= OfObject<T>();
    editor.value = value;
    _editors[path] = editor;
    return value;
  }
}

@Deprecated("已完全被mate库取代")
class _EmptyEditor extends Editor<String> {
  _EmptyEditor();

  @override
  StatefulBuilder builder() {
    return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
      return const Text("error:_EmptyParam",
          style: TextStyle(
            color: Colors.red,
            backgroundColor: Colors.yellow,
          ));
    });
  }
}

@Deprecated("已完全被mate库取代")
abstract class Editor<T> {
  T? value;
  bool isNullable = true;
  late final ParamNode params;
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

@Deprecated("已完全被mate库取代")
class OfString extends Editor<String> {
  OfString();

  StatefulBuilder builder() {
    return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
      return TextField(
        autofocus: true,
        decoration: const InputDecoration(
          labelText: "Text#data",
          hintText: "Text#data",
          prefixIcon: Icon(Icons.ac_unit),
        ),
        onChanged: (value) {
          setState(() {
            developer.log("text.data:$value", name: 'note_app');
            this.value = value;
          });
        },
      );
    });
  }
}

@Deprecated("已完全被mate库取代")
class OfDouble extends Editor<double> {
  OfDouble();

  @override
  StatefulBuilder builder() {
    return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
      return TextField(
        autofocus: true,
        decoration: const InputDecoration(
          labelText: "double",
          hintText: "double",
          prefixIcon: Icon(Icons.ac_unit),
        ),
        onChanged: (value) {
          setState(() {
            developer.log("double:$value", name: 'note_app');
            this.value = double.tryParse(value);
          });
        },
      );
    });
  }
}

@Deprecated("已完全被mate库取代")
class OfObject<T> extends Editor<T> {
  OfObject();

  @override
  StatefulBuilder builder() {
    return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
      return Text("TODO ObjectEditor.builder");
    });
  }
}

@Deprecated("已完全被mate库取代")
abstract class EnumEditor<T extends Enum> extends Editor<T> {
  final List<T> values;

  EnumEditor({
    required this.values,
  });

  @override
  StatefulBuilder builder() {
    return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
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

@Deprecated("已完全被mate库取代")
class OfTextAlign extends EnumEditor<TextAlign> {
  OfTextAlign() : super(values: TextAlign.values);
}
