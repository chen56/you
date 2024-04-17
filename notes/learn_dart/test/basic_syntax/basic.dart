import 'package:test/test.dart';

main() {
  group("??", () {
    test("description", () {
      Map<String, dynamic> map = {"a": "1"};
      XX(msg: map["sss"]??"s");
    });
  });
}

class XX {
  late String msg;

  XX({this.msg = "defalut"}) {
    print("hahaha:$msg");
  }
}
