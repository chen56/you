import 'dart:collection';

import 'package:checks/checks.dart';
import 'package:test/test.dart';

void main() {
  group("dynamic", () {
    test('dynamic <> int', () {
      dynamic x = 1;
      int i = x;

      expect(x == i, isTrue);
      expect(x.runtimeType, equals(1.runtimeType));

      x = null;
      expect(x == null, isTrue);
      expect(x.runtimeType, Null);
    });
  });

  group("Symbol", () {
    bool isNullableOf<T>(T t) {
      return null is T;
    }

    test('Symbol 入门', () {
      const Symbol symbol = #ssss;
      expect(symbol, equals(Symbol("ssss")));
      expect(symbol.toString(), 'Symbol("ssss")');
    });
    test('Symbol', () {
      Symbol? s = #a;
      expect(isNullableOf(s), false);
      expect(isNullableOf<Symbol?>(s), true);

      dynamic x = s;
      expect(isNullableOf<Symbol?>(x), true);
      expect(isNullableOf(x), true);
    });
    test('Symbol', () {
      Symbol? a = #a;
      Symbol? a2 = #a;
      check(a).equals(a2);

    });
    test('Object equals', () {
      check(const Object()==const Object()).equals(true);
      check(  Object()!=const  Object()).equals(true);
      check(  Object()!=   Object()).equals(true);

    });
  });
  group("Enum", () {
    test('cast', () {
      bool isEnum<T>(T x) {
        return x is Enum;
      }

      Enum e = InjectMode.embed;
      InjectMode? c = InjectMode.embed;
      expect(isEnum<InjectMode>(InjectMode.embed), true);
      expect(isEnum(e), true);
      // ignore: unnecessary_type_check
      expect(e is Enum, true);
      // ignore: unnecessary_type_check
      expect(c is Enum, true);
      expect(isEnum(c), true);
    });
  });
  group("Function", () {
    test('SpecificTypeFuncInject扩展Function后可在里面加点料，方便mate模型生成代码', () {
      void myFunc<String>(Set<String> selected) {}
      var x = SegmentedButton$Mate<String>(
        onSelectionChanged: myFunc..inject(func: "myFunc"),
      );
      expect(x.injectInfo, "myFunc");
    });
  });
  group("runtimeType 关系？", () {
    test('SpecificTypeFuncInject扩展Function后可在里面加点料，方便mate模型生成代码', () {
      // 2s多
      for(int i=0;i<1000*1000*1000;i++){
        // ignore: unused_local_variable
        var x =[] is ListBase;
        // check([] is ListBase).equals(true);
      }
    });

  });
  group("Unique", () {
    test(' x', () {
      Uniquely x = Uniquely(name: "x") ;
       check(x==x).equals(false);
    });
  });
}

class SegmentedButton$Mate<T> {
  String injectInfo;
  SegmentedButton$Mate({this.onSelectionChanged}) : injectInfo = "${onSelectionChanged?.name}";
  void Function<T>(Set<T>)? onSelectionChanged;
}

extension SpecificTypeFuncInject<T> on void Function<T>(Set<T> selected) {
  static final _name = Expando<String>();
  String get name => _name[this] ?? "";
  set name(String v) => _name[this] = v;
  inject({
    required String func,
  }) {
    _name[this] = func;
  }
}
class Uniquely {
  final String name;

  Uniquely({required this.name});

  @override
  bool operator ==(Object other) {
    // 即使两个对象的id相同，我们也返回false，表示它们在逻辑上不相等
    return false;
  }

  @override
  int get hashCode => name.hashCode; // 这里假设我们还是希望hashCode基于id生成
}

/// for https://github.com/chen56/note/issues/61
/// Additional information can be provided for Functions to help Mate code generation
extension FuncCodeInject on Function {
  static final _from = Expando<String>();
  static final _mode = Expando<InjectMode>();
  String get from => _from[this] ?? "";
  InjectMode get mode => _mode[this] ?? InjectMode.embed;
  set name(String v) => _from[this] = v;
  inject(
    /// the Mate field Referenced function name
    String func, {
    /// expected inject code mode
    InjectMode mode = InjectMode.refer,

    /// is copy function context code
    bool copyContext = true,
  }) {
    _from[this] = func;
    _mode[this] = mode;
  }
}

enum InjectMode {
  /// 嵌入模式：会把函数体抽取出来塞到Mate代码生成的构造器中
  /// void onclick(){}
  /// Button(onTap:onclick);
  ///      生成-> Button(onTap:onclick(){});
  /// 因为会复制外围的变量和函数，所以比较安全，不易出错
  embed,

  /// 引用模式：会把Mate代码生成的构造器中，只引用函数名
  /// void onclick(){}
  /// Button(onTap:onclick);
  ///      生成-> void onclick(){}
  ///            Button(onTap:onclick);
  /// 因为会复制外围的变量和函数，所以比较安全，不易出错
  refer
}
