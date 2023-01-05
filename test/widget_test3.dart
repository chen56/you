// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Counter', () {
    testWidgets('Counter increments smoke test', (WidgetTester tester) async {
      var t = TextMate.of();

      expect(t.maxLines, null);
    });
  });
}

class TextMate {
  static Text of() {
    return const Text("test");
  }

  static Text from() {
    return const Text("test");
  }

  static Text ofRich() {
    return const Text.rich(TextSpan(text: 'Hello'));
  }
}
