// /// Generated by mate_flutter, please don't edit!

import 'package:flutter/src/foundation/key.dart';
import 'package:note/mate.dart';

/// class ValueKey<T> extends LocalKey
class ValueKey$Mate<T> extends ValueKey<T> with Mate<ValueKey$Mate> {
  /// ValueKey<T> ValueKey(T value)
  ValueKey$Mate(

      /// param: T value
      T value)
      : super(value) {
    mateParams = Params(
      init: this,
      builder: (p) => ValueKey$Mate(p.getValue('value')),
    );
    mateParams.set(name: 'value', init: value);
  }
}
