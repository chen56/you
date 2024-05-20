import 'dart:collection';
import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:_you_dart_internal/core.dart';
import 'package:you_dart/src/state.dart';

/// [Store] 的编解码器，为[Store]对象赋予json等的能力, 目前支持
/// - [✅]json
/// - []yaml
///
/// 这里可能会有各类支持，比如yaml等

/// [jsonDecode] 的第二个参数reviver真的有人在用吗？多层级解析完全搞不懂。
@experimental
RESULT jsonDecodeBetter<RESULT, JSON>(String source, {required RESULT Function(JSON source)? fromJson}) {
  Object jsonObject = jsonDecode(source);
  if (fromJson == null) {
    return jsonObject as RESULT;
  }
  return fromJson(jsonObject as JSON);
}

/// json map   对 Map<String, dynamic>
/// json array 对 List<dynamic>
class JsonConverts {
  late final List<JsonConvert> _converts;

  // Jsons({required List<Json> jsons}) : _jsons = [...jsons];

  JsonConverts([List<JsonConvert>? converts]) {
    _converts = converts ?? [];

    // default supported type
    _converts.add(
      JsonConvert<String, DateTime>(toJson: (o) => o.toIso8601String(), toObj: (j) => DateTime.parse(j)),
    );
  }

  T loadJsonString<T extends Store>(String source, T to) {
    var from = jsonDecode(source);
    loadJson(from, to);
    return to;
  }

  T loadJson<T extends Store>(Map<String, dynamic> from, T to) {
    for (var MapEntry(key: fieldName, value: nextTo) in to.fields.entries) {
      // 字段未发现数据则跳过
      if (!from.containsKey(fieldName)) {
        continue;
      }
      var nextFrom = from[fieldName];
      _loadField(to, fieldName, nextFrom, nextTo);
    }
    return to;
  }

  void _loadField(Store parent, String fieldName, Object? from, Signal to) {
    loadCollection(void Function(Object) addCallback) {
      if (from is! List) {
        return;
      }
      if (from.isEmpty) {
        return;
      }
      var elementType = to.typeArgs[0];
      for (var element in from) {
        //有转换器，先转再塞集合
        JsonConvert? json = _findToObj(element, elementType);
        if (json != null) {
          addCallback(json.toObj(element));
          return;
        }

        // 托底方案，没有转换器就直接塞集合，但事先匹配类型，因为json谁知道哪里来的合不合法
        if (elementType.isTypeOf(element)) {
          addCallback(element);
        }
      }
    }

    switch (to) {
      case Store(fields: var fields):
        if (from is! Map) {
          return;
        }

        for (var MapEntry(key: fieldName, value: nextTo) in fields.entries) {
          // 字段未发现数据则跳过
          if (!from.containsKey(fieldName)) {
            continue;
          }
          var nextFrom = from[fieldName];
          _loadField(to, fieldName, nextFrom, nextTo);
        }
      case Value to:
        var elementType = to.typeArgs[0];
        // 数据为空时：
        //   - 字段能放nullable值的，才能设null
        if (from == null) {
          if (elementType.isNullable()) {
            to.value = null;
          }
          return;
        }
        // 有转换器先转再塞
        JsonConvert? json = _findToObj(from, elementType);
        if (json != null) {
          to.value = json.toObj(from);
          return;
        }

        // 托底方案，没有转换器就直接塞，但事先匹配类型，因为json谁知道哪里来的合不合法
        if (elementType.isTypeOf(from)) {
          to.value = from;
          return;
        }

        assert(false,
            "loadJson未处理, 请检查是没注册转换器还是json源有问题: fromJson【(jsonType:${from.runtimeType}) , jsonValue:$from】, load to field【storeType:${parent.runtimeType}  fieldType:${to.runtimeType} fieldName: $fieldName fieldValue:$to】");
      case List to:
        loadCollection((element) => to.add(element));
      case Set to:
        loadCollection((element) => to.add(element));
      case Queue to:
        loadCollection((element) => to.add(element));
      case Map to:
        if (from is! Map || from.isEmpty) {
          return;
        }
        var [keyType, valueType] = (to as Signal).typeArgs;
        for (var MapEntry(key: key, value: value) in from.entries) {
          JsonConvert? keyConvert = _findToObj(key, keyType);
          JsonConvert? valueConvert = _findToObj(value, valueType);
          var convertedKey = keyConvert == null ? key : keyConvert.toObj(key);
          var convertedValue = valueConvert == null ? value : valueConvert.toObj(value);

          // 匹配类型，因为json谁知道哪里来的合不合法
          if (keyType.isTypeOf(convertedKey) && valueType.isTypeOf(convertedValue)) {
            to[convertedKey] = convertedValue;
          }
        }
      case _:
        assert(false,
            "内部bug，loadJson未处理: fromJson【(jsonType:${from.runtimeType}) , jsonValue:$from】, load to field【storeType:${parent.runtimeType}  fieldType:${to.runtimeType} fieldName: $fieldName fieldValue:$to】");
    }
  }

  JsonConvert? _findToObj(Object from, TypeHook toType) {
    for (var json in _converts) {
      if (json.isCanToObj(from, toType)) {
        return json;
      }
    }
    return null;
  }
  JsonConvert? _findToJson(Object from) {
    for (var json in _converts) {
      if (json.isCanToJson(from)) {
        return json;
      }
    }
    return null;
  }

  String toJsonString(Store from, {JsonEncoder encoder = const JsonEncoder()}) {
    return encoder.convert(_deepToJson(from));
  }

  Map<String, dynamic> toJson(Store from) {
    return _deepToJson(from) as Map<String, dynamic>;
  }

  Object? _deepToJson(Object? input) {
    if (input == null) {
      return null;
    }
    if (input is List) {
      return input.map((e) => _deepToJson(e)).toList();
    }
    if (input is Set) {
      return input.map((e) => _deepToJson(e)).toList();
    }
    if (input is Map) {
      return input.map((k, v) => MapEntry(_deepToJson(k), _deepToJson(v)));
    }
    if (input is Queue) {
      return input.map((e) => _deepToJson(e)).toList();
    }
    if (input is Value) {
      if (input.value==null) {
        return null;
      }
      JsonConvert? json = _findToJson(input.value);
      if (json != null) {
        return json.toJson(input.value);
      }
      return _deepToJson(input.value);
    }
    if (input is Store) {
      return input.fields.map((name, field) {
        return MapEntry(name, _deepToJson(field));
      });
    }
    return input;
  }
}

class JsonConvert<JSON, OBJ> {
  JsonConvert({required Convert<OBJ, JSON> toJson, required Convert<JSON, OBJ> toObj})
      : _toJson = toJson,
        _toObj = toObj;

  final Convert<OBJ, JSON> _toJson;

  final Convert<JSON, OBJ> _toObj;

  toJson(OBJ from) {
    return _toJson(from);
  }

  toObj(JSON from) {
    return _toObj(from);
  }

  bool isCanToObj(Object from, TypeHook toType) {
    return from is JSON && toType.isType<OBJ>();
  }

  bool isCanToJson(Object from) {
    return from is OBJ;
  }
}
