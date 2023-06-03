import 'package:flutter_test/flutter_test.dart';
import 'package:stack_trace/stack_trace.dart';
import 'cell_test_sample.dart';

void main() {
  group("Space.json", () {
    test("to json", () {
      try {
        findMe();
      } catch (e, st) {
        print(Trace.format(st));
        print("--");
        print(st.runtimeType);
      }
    });
  });
}
