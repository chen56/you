// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/foundation/key.dart';
import 'package:note/mate.dart';

/// class ValueKey<T> extends LocalKey
class ValueKey$Mate<T> extends ValueKey<T> with Mate {
  /// ValueKey<T> ValueKey(T value)
  ValueKey$Mate(

      /// requiredParameters: T value
      T value)
      : super(value) {
    mateCreateName = 'ValueKey';
    matePackageUrl = 'package:flutter/foundation.dart';
    mateBuilder = (p) => ValueKey$Mate<T>(p.get('value').value);
    mateUse('value', value, isNamed: false);
  }
}
