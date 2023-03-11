// ignore_for_file: unnecessary_type_check

import 'package:test/test.dart';

void main() {
  test('analyzer', () {
    expect(["1"].sublist(0, 1), ["1"]);
  });
}
