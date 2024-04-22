// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:collection';
import 'dart:convert';

import 'package:checks/checks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:you_dart/src/state_json.dart';
import 'package:you_dart/src/state.dart';

JsonConverts jsons = JsonConverts([
  /// 标注好Json<JSON,OBJ>范型，省事很多，减少dynamic/Object类型
  JsonConvert<Map<String, dynamic>, RootStore>(toJson: (o) => o.toJson(), toObj: (j) => jsons.loadJson(j, RootStore())),
  JsonConvert<Map<String, dynamic>, SubStore>(toJson: (o) => o.toJson(), toObj: (j) => jsons.loadJson(j, SubStore())),
  JsonConvert<String, NormalObject>(toJson: (o) => o.name, toObj: (j) => NormalObject(j)),
  JsonConvert<String, TestEnum>(toJson: (o) => o.toJson(), toObj: (j) => TestEnum.fromJson(j)),
]);

void main() {
  group("basic", () {
    test('toJson&loadJson', () {
      {
        RootStore testData = RootStore.testData();
        String source = testData.toJsonString();
        RootStore loaded = jsons.loadJsonString(source, RootStore());
        // debugPrint("sssssss1:${testData.toJsonString(encoder: const JsonEncoder.withIndent("  "))}");
        // debugPrint("sssssss2:${loaded.toJsonString(encoder: const JsonEncoder.withIndent("  "))}");

        check(loaded.toJsonString()).equals(testData.toJsonString());

        // ############################
        // # 简单场景：内置数据类型
        // ############################

        /// value
        check(loaded.str()).equals("str");
        check(loaded.int_()).equals(1);
        check(loaded.dateTime.toString()).equals(testData.dateTime.toString());

        /// collection
        check(loaded.list.toList()).deepEquals(["list.0", "list.1"]);
        check(loaded.set.toList()).deepEquals(["set.0", "set.1"]);
        check(loaded.queue.toList()).deepEquals(["queue.0", "queue.1"]);
        check(loaded.map).deepEquals({"map.0": "value0", "map.1": "value1"});

        // sub store
        check(loaded.subStore.str()).equals("subStore.str");
        check(loaded.subStore.int_()).equals(1);
        check(loaded.subStore.list.toList()).deepEquals(["subStore.list.0", "subStore.list.1"]);
        check(loaded.subStore.set.toList()).deepEquals(["subStore.set.0", "subStore.set.1"]);
        check(loaded.subStore.queue.toList()).deepEquals(["subStore.queue.0", "subStore.queue.1"]);
        check(loaded.subStore.map).deepEquals({"subStore.map.0": "value0", "subStore.map.1": "value1"});
        check(loaded.subStore.object.value.name).equals("subStore.object.name");

        // ############################
        // # 复杂场景：需指定loader的套娃
        // ############################

        // value signal: 自定义类型
        check(loaded.object.value.name).equals("object.name");

        // collection signal: collection套娃
        check(loaded.storeList.first.str()).equals("storeList.0.str");
        check(loaded.storeSet.first.str()).equals("storeSet.0.str");
        check(loaded.storeQueue.first.str()).equals("storeQueue.0.str");
        check(loaded.storeMap.keys).deepEquals(["storeMap.0"]);
        check(loaded.storeMap.values.first.str.value).equals("storeMap.0.str");
      }
    });
  });

  group("better api design", () {
    test('jsonDecodeBetter：一对一，集合对集合，map对map，简单点', () {
      var source = '["a","b"]';
      var x = jsonDecodeBetter('["a","b"]', fromJson: (List source) {
        return source.map((e) => TestEnum.fromJson(e)).toList();
      });
      check(jsonEncode(x)).equals(source);
    });
    test('jsonDecodeBetter：一对一，集合对集合，map对map，简单点', () {
      var source = '{"deep":{"enums":["a","b"]},"other":2}';
      var x = jsonDecodeBetter(source, fromJson: (Map source) {
        var deep = source["deep"];
        var list = deep["enums"];
        deep["enums"] = list.map((e) => TestEnum.fromJson(e)).toList();
        return source;
      });
      check(jsonEncode(x)).equals(source);
    });
    test('单独的store', () {
      // 单独的store
      var source = SubStore(str: "str").toJsonString();
      var x = jsonDecodeBetter(source, fromJson: (Map source) {
        return SubStore.fromJson(source);
      });
      check(x.toJsonString()).equals(source);
    });
    // TODO 这些嵌套Store的case 如何处理?
    // test('普通集合包Store', () {
    //   // 普通集合包Store
    //   var source = [SubStore(str: "str")].toJsonString();
    //   var x = jsonDecodeBetter(source, fromJson: (List source) {
    //     return source.map((e) => SubStore.fromJson(e));
    //   });
    //   check(x.toList().toJsonString()).equals(source);
    // });
    // test('Signal集合包Store', () {
    //   // Signal集合包Store
    //   var source = [SubStore(str: "str")].toJsonString();
    //   var rebuildSignal = jsonDecodeBetter(source, fromJson: (List source) {
    //     return source.map((e) => SubStore.fromJson(e)).toList().signal();
    //   });
    //   check(rebuildSignal.toJsonString()).equals(source);
    // });
  });
}

class FieldBuilder {
  final _fields = <String, Signal>{}; //<String, Signal>{};
  void field(String name, Signal value, {FromJson? fromJson}) {
    assert(!_fields.containsKey(name), "name:$name : value:$value");
    _fields[name] = value;
  }
}

base class TestStoreBase extends Store {
  String toJsonString({JsonEncoder encoder = const JsonEncoder()}) {
    return jsons.toJsonString(this, encoder: encoder);
  }

  Map<String, dynamic> toJson() {
    return jsons.toJson(this);
  }

  T loadJson<T>(dynamic from) {
    jsons.loadJson(from, this);
    return this as T;
  }
}

base class RootStore extends TestStoreBase {
  RootStore({
    String str = "",
    int int_ = 0,
    DateTime? dateTime,
    List<String> list = const [],
    Set<String> set = const {},
    Queue<String>? queue,
    Map<String, String> map = const {},
    SubStore? subStore,
    NormalObject object = const NormalObject(""),
    List<SubStore> storeList = const [],
    Set<SubStore> storeSet = const {},
    Queue<SubStore>? storeQueue,
    Map<String, SubStore> storeMap = const {},
  }) {
    // ############################
    // # 简单场景：内置数据类型
    // ############################

    // value signal: 内置支持的数据类型
    this.str = field("str", str.signal());
    this.int_ = field("int_", int_.signal());
    this.dateTime = field("dataTime", (dateTime ?? DateTime(0)).signal());

    // collection signal: 元素为内置数据类型
    this.list = field("list", list.signal());
    this.set = field("set", set.signal());
    this.queue = field("queue", (queue ?? Queue<String>()).signal());
    this.map = field("map", map.signal());

    // store signal: store 套 store, 最简单的内置支持结构，不需要loader
    this.subStore = field("subStore", (subStore ?? SubStore()).signal());

    // ############################
    // # 复杂场景：需指定loader的套娃
    // ############################

    // value signal: 自定义类型，要自己取toJson和Load，常见为枚举型，或简单数据结构Point,Size等
    this.object = field("object", object.signal());

    // collection signal: collection套娃, collection套Signal、套自定义类型，要自己取toJson和Load
    this.storeSet = field("storeSet", storeSet.signal());
    this.storeList = field("storeList", storeList.signal());
    this.storeQueue = field("storeQueue", (storeQueue ?? Queue()).signal());
    this.storeMap = field("storeMap", storeMap.signal());
  }

  RootStore.testData()
      : this(
          //####################
          // 简单类型
          //####################

          //简单类型: value
          str: "str",
          int_: 1,
          dateTime: DateTime(2000),
          // 简单类型: collection
          list: ["list.0", "list.1"],
          set: {"set.0", "set.1"},
          queue: Queue.from(["queue.0", "queue.1"]),
          map: {"map.0": "value0", "map.1": "value1"},
          // 简单类型: sub store
          subStore: SubStore(
            str: "subStore.str",
            int_: 1,
            set: {"subStore.set.0", "subStore.set.1"},
            list: ["subStore.list.0", "subStore.list.1"],
            queue: Queue.from(["subStore.queue.0", "subStore.queue.1"]),
            map: {"subStore.map.0": "value0", "subStore.map.1": "value1"},
            object: const NormalObject("subStore.object.name"),
            baseList: ["subStore.baseList.0", "subStore.baseList.1"],
          ),
          //####################
          // 复杂类型
          //####################
          // 复杂类型： value 自定义
          object: const NormalObject("object.name"),
          // 复杂类型： collection套娃
          storeSet: {SubStore(str: "storeSet.0.str")},
          storeList: [SubStore(str: "storeList.0.str")],
          storeQueue: Queue.from([SubStore(str: "storeQueue.0.str")]),
          storeMap: {"storeMap.0": SubStore(str: "storeMap.0.str")},
        );

  factory RootStore.fromJson(Map<String, dynamic> input) {
    return jsons.loadJson(input, RootStore());
  }

  // value
  late final Value<String> str; // = "".signal(field: "str", at: RootStore);
  late final Value<int> int_; // = 0.signal(field: "int_", at: RootStore);
  late final Value<DateTime> dateTime; //= DateTime(0).signal(field: "dataTime",at: RootStore);

  /// 集合
  late final List<String> list; //= <dynamic>[].signal(field: "list", at: RootStore);
  late final Set<String> set; //= <dynamic>{}.signal(field: "set", at: RootStore);
  late final Queue<String> queue; //= <dynamic>[].signal(field: "list", at: RootStore);
  late final Map<String, String> map; //= <String, dynamic>{}.signal(field: "map", at: RootStore);

  /// store
  late final SubStore subStore; //= SubStore().signal(field: "subStore", at: RootStore);

  /// 嵌套对象或Signal，都自定义了loader，因为都是框架无法自动创建的集合内的对象
  late final Value<NormalObject> object;
  late final List<SubStore> storeList;
  late final Set<SubStore> storeSet;
  late final Queue<SubStore> storeQueue;
  late final Map<String, SubStore> storeMap;
}

abstract base class SubStoreBase extends TestStoreBase {
  late final List<String> baseList; // = {"base"}.signal(field: "baseSet", at: SubStoreBase);

  SubStoreBase({
    List<String> baseList = const [],
  }) {
    this.baseList = field("baseList", baseList.signal());
  }
}

// duplicate fields
base class SubStore extends SubStoreBase {
  SubStore({
    String str = "",
    int int_ = 0,
    Set<String> set = const {},
    List<String> list = const [],
    Queue<String>? queue,
    Map<String, String> map = const {},
    NormalObject object = const NormalObject(""),
    super.baseList,
  }) {
    this.str = field("str", str.signal());
    this.int_ = field("int_", int_.signal());
    this.set = field("set", set.signal());
    this.list = field("list", list.signal());
    this.queue = field("queue", (queue ?? Queue()).signal());
    this.map = field("map", map.signal());
    this.object = field("object", object.signal(), fromJson: NormalObject.jsonDecode);
  }

  static SubStore load(Object input) => SubStore().loadJson(input);

  late final Value<String> str;
  late final Value<int> int_;
  late final Set<String> set;
  late final List<String> list;
  late final Queue<String> queue;
  late final Map<String, String> map;
  late final Value<NormalObject> object;

  factory SubStore.fromJson(Map source) {
    return SubStore().loadJson(source);
  }

//= NormalObject("sub.object").signal(field: "field:sub.object", at: SubStore);
// @override
// late final List<String> overrideField; // = <String>[].signal(field: "overrideField", at: SubStore);
}

class NormalObject {
  final String name;

  const NormalObject(this.name);

  toJson() {
    return name;
  }

  static NormalObject jsonDecode(input) {
    return NormalObject(input as String);
  }

  // FIXME 这里删掉toJson()，Field增加toJson和fromJson两个字段
  static jsonEncode(self) {
    return (self as NormalObject).toJson();
  }
}

enum TestEnum {
  a,
  b;

  static TestEnum fromJson(String value) {
    return TestEnum.values.firstWhere((e) => e.name == value);
  }

  String toJson() {
    return name;
  }
}
