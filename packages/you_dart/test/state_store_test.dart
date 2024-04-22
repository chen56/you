// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:you_dart/src/state.dart';


void main() {
  group("basic", () {
    group("json test", () {
      test('test', () {
        // try{
        //   // assert(!this._fromJsons.containsKey(name),"Error duplicate field: ${this.runtimeType}.$name ");
        //
        //   store.field("str");
        //   fail("not here");
        // }catch(e){
        //   check(e.toString()).equals("other");
        // }
      });
    });
  });
}

// TODO ErrorDuplicateFieldStore 待测试
base class ErrorDuplicateField extends Store {
  final name = "define 1".signal(field: "name", at: ErrorDuplicateField);
  final name2 = "define 2".signal(field: "name", at: ErrorDuplicateField);
}

// inherit test use
base class InheritCaseBase extends Store   {
  late final Value<String> baseA; //= "Base.a".signal(field: "Base.a", at: InheritCaseBase);

  InheritCaseBase();
}

base class InheritCaseChild extends InheritCaseBase {
  late final Value<String> a;

  InheritCaseChild() {
    a = field("Child.a", "Child.a".signal());
  }
}
