// /// Generated by mat_flutter, please don't edit! Created time: 2023-03-09 00:16:00.862883

library;

import 'dart:core';
import 'package:flutter/src/services/text_formatter.dart';
export 'package:flutter/foundation.dart' show TargetPlatform;
export 'text_input.dart' show TextEditingValue;

/// abstract class TextInputFormatter
abstract class TextInputFormatterMate {
  /// TextInputFormatter TextInputFormatter()
  TextInputFormatterMate() {}
}

/// class FilteringTextInputFormatter extends TextInputFormatter
class FilteringTextInputFormatterMate {
  /// FilteringTextInputFormatter FilteringTextInputFormatter(Pattern filterPattern, {required bool allow, String replacementString = ''})
  FilteringTextInputFormatterMate(
// param: Pattern filterPattern
    Pattern filterPattern, {
// param: {required bool allow}
    required bool allow,
// param: {String replacementString = ''}
    required String replacementString,
  }) {}

  /// FilteringTextInputFormatter FilteringTextInputFormatter.allow(Pattern filterPattern, {String replacementString = ''})
  FilteringTextInputFormatterMate.allow(
// param: Pattern filterPattern
    Pattern filterPattern, {
// param: {String replacementString = ''}
    required String replacementString,
  }) {}

  /// FilteringTextInputFormatter FilteringTextInputFormatter.deny(Pattern filterPattern, {String replacementString = ''})
  FilteringTextInputFormatterMate.deny(
// param: Pattern filterPattern
    Pattern filterPattern, {
// param: {String replacementString = ''}
    required String replacementString,
  }) {}
}

/// class LengthLimitingTextInputFormatter extends TextInputFormatter
class LengthLimitingTextInputFormatterMate {
  /// LengthLimitingTextInputFormatter LengthLimitingTextInputFormatter(int? maxLength, {MaxLengthEnforcement? maxLengthEnforcement})
  LengthLimitingTextInputFormatterMate(
// param: int? maxLength
    int? maxLength, {
// param: {MaxLengthEnforcement? maxLengthEnforcement}
    MaxLengthEnforcement? maxLengthEnforcement,
  }) {}
}
