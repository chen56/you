// ignore_for_file: unnecessary_type_check

import 'package:test/test.dart';

void main() {
  test('analyzer', () {
    void xxx(int panelIndex, bool isExpanded) {
      print("s");
    }

    print(xxx.toString());
    expect(["1"].sublist(0, 1), ["1"]);
  });
}
