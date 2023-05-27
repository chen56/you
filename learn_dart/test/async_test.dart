import 'package:flutter_test/flutter_test.dart';

void main() {
  group("async", () {
    test('error handle', () async {
      var x = Future.error("ss")
          .then((value) => "ok", onError: (e, s) => "onError:$e");
      var z = Future.delayed(const Duration(seconds: 3)).then((value) => x);

      var y = await z;
      print(y);
    });
  });
}
