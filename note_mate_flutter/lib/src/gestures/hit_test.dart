// /// Generated by mate_flutter, please don't edit!

import 'package:flutter/src/gestures/hit_test.dart';
import 'package:note/mate.dart';
export 'dart:ui' show Offset;
export 'package:vector_math/vector_math_64.dart' show Matrix4;
export 'events.dart' show PointerEvent;

/// class HitTestEntry<T extends HitTestTarget>
class HitTestEntry$Mate<T extends HitTestTarget> extends HitTestEntry<T> with Mate<HitTestEntry$Mate> {
  /// HitTestEntry<T> HitTestEntry(T target)
  HitTestEntry$Mate(

      /// param: T target
      T target)
      : super(target) {
    mateParams = Params(
      init: this,
      builder: (p) => HitTestEntry$Mate(p.getValue('target')),
    );
    mateParams.set(name: 'target', init: target);
  }
}

/// class HitTestResult
class HitTestResult$Mate extends HitTestResult with Mate<HitTestResult$Mate> {
  /// HitTestResult HitTestResult.wrap(HitTestResult result)
  HitTestResult$Mate.wrap(

      /// param: HitTestResult result
      HitTestResult result)
      : super.wrap(result) {
    mateParams = Params(
      init: this,
      builder: (p) => HitTestResult$Mate.wrap(p.getValue('result')),
    );
    mateParams.set(name: 'result', init: result);
  }
}
