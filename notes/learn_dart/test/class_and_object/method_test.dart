import 'package:test/test.dart';
import 'package:checks/checks.dart';

main(){
  group("getter setter", () {
    test("set = no get", () => (){
      GetSet x=GetSet();
      x.value="aaa";
      check(x.log).equals("set:aaa;");

      x.value+="bbb";
      check(x.log).equals("set:aaa;get;set:bbb;");

    });
    test("set +=, 先get，再set", () => (){
      GetSet x=GetSet();
      x.value+="aaa";
      check(x.log).equals("get:;set:aaa;");

    });
  });
}

class GetSet{
  String log="";
  String _value="";

  String get value {
    log+="get:$_value";
    return _value;
  }
  set value(String newValue) {
    log+="set:$newValue;";
    _value = newValue;
  }

}