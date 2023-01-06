import 'package:flutter/material.dart';
import 'package:learn_flutter/mate/text.dart';
import 'package:test/test.dart';

void main() {
  test('String.split() splits the string on the delimiter', () {
    TextMate text = TextMate.rich(WidgetSpan());
    var string = 'foo,bar,baz';
    expect(string.split(','), equals(['foo', 'bar', 'baz']));
  });

  test('String.trim() removes surrounding whitespace', () {
    var string = '  foo ';
    expect(string.trim(), equals('foo'));
  });
}
