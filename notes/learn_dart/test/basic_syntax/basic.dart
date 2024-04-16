import 'package:test/test.dart';

main() {
  group("??", () {
    test("description", () {
      void xx(String msg) {
        print("hahaha:$msg");
      }

      int? y;
      dynamic x=y;
      x == null ? Never : xx(" null");
      x = 1;
      x == null ? Never : xx("not null");
    });
  });
}
