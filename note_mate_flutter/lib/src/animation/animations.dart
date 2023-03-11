// /// Generated by mate_flutter, please don't edit!

import 'package:flutter/src/animation/animations.dart';
import 'package:note/mate.dart';
import 'package:flutter/src/animation/animation.dart';
import 'dart:core';
import 'package:flutter/src/animation/curves.dart';
import 'dart:ui';
export 'dart:ui' show VoidCallback;
export 'animation.dart' show Animation, AnimationStatus, AnimationStatusListener;
export 'curves.dart' show Curve;

/// class AlwaysStoppedAnimation<T> extends Animation<T>
class AlwaysStoppedAnimation$Mate<T> extends AlwaysStoppedAnimation<T> with Mate<AlwaysStoppedAnimation$Mate> {
  /// AlwaysStoppedAnimation<T> AlwaysStoppedAnimation(T value)
  AlwaysStoppedAnimation$Mate(

      /// param: T value
      T value)
      : super(value) {
    mateParams = Params(
      init: this,
      builder: (p) => AlwaysStoppedAnimation$Mate(p.getValue('value')),
    );
    mateParams.set(name: 'value', init: value);
  }
}

/// class ProxyAnimation extends Animation<double> with AnimationLazyListenerMixin, AnimationLocalListenersMixin, AnimationLocalStatusListenersMixin
class ProxyAnimation$Mate extends ProxyAnimation with Mate<ProxyAnimation$Mate> {
  /// ProxyAnimation ProxyAnimation([Animation<double>? animation])
  ProxyAnimation$Mate(

      /// param: [Animation<double>? animation]
      Animation<double>? animation)
      : super(animation) {
    mateParams = Params(
      init: this,
      builder: (p) => ProxyAnimation$Mate(p.getValue('animation')),
    );
    mateParams.set(name: 'animation', init: animation);
  }
}

/// class ReverseAnimation extends Animation<double> with AnimationLazyListenerMixin, AnimationLocalStatusListenersMixin
class ReverseAnimation$Mate extends ReverseAnimation with Mate<ReverseAnimation$Mate> {
  /// ReverseAnimation ReverseAnimation(Animation<double> parent)
  ReverseAnimation$Mate(

      /// param: Animation<double> parent
      Animation<double> parent)
      : super(parent) {
    mateParams = Params(
      init: this,
      builder: (p) => ReverseAnimation$Mate(p.getValue('parent')),
    );
    mateParams.set(name: 'parent', init: parent);
  }
}

/// class CurvedAnimation extends Animation<double> with AnimationWithParentMixin<double>
class CurvedAnimation$Mate extends CurvedAnimation with Mate<CurvedAnimation$Mate> {
  /// CurvedAnimation CurvedAnimation({required Animation<double> parent, required Curve curve, Curve? reverseCurve})
  CurvedAnimation$Mate({
    /// param: {required Animation<double> parent}
    required Animation<double> parent,

    /// param: {required Curve curve}
    required Curve curve,

    /// param: {Curve? reverseCurve}
    Curve? reverseCurve,
  }) : super(
          parent: parent,
          curve: curve,
          reverseCurve: reverseCurve,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => CurvedAnimation$Mate(
        parent: p.getValue('parent'),
        curve: p.getValue('curve'),
        reverseCurve: p.getValue('reverseCurve'),
      ),
    );
    mateParams.set(name: 'parent', init: parent);
    mateParams.set(name: 'curve', init: curve);
    mateParams.set(name: 'reverseCurve', init: reverseCurve);
  }
}

/// class TrainHoppingAnimation extends Animation<double> with AnimationEagerListenerMixin, AnimationLocalListenersMixin, AnimationLocalStatusListenersMixin
class TrainHoppingAnimation$Mate extends TrainHoppingAnimation with Mate<TrainHoppingAnimation$Mate> {
  /// TrainHoppingAnimation TrainHoppingAnimation(Animation<double> _currentTrain, Animation<double>? _nextTrain, {void Function()? onSwitchedTrain})
  TrainHoppingAnimation$Mate(
    /// param: Animation<double> _currentTrain
    Animation<double> _currentTrain,

    /// param: Animation<double>? _nextTrain
    Animation<double>? _nextTrain, {
    /// param: {void Function()? onSwitchedTrain}
    VoidCallback? onSwitchedTrain,
  }) : super(
          _currentTrain,
          _nextTrain,
          onSwitchedTrain: onSwitchedTrain,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => TrainHoppingAnimation$Mate(
        p.getValue('_currentTrain'),
        p.getValue('_nextTrain'),
        onSwitchedTrain: p.getValue('onSwitchedTrain'),
      ),
    );
    mateParams.set(name: '_currentTrain', init: _currentTrain);
    mateParams.set(name: '_nextTrain', init: _nextTrain);
    mateParams.set(name: 'onSwitchedTrain', init: onSwitchedTrain);
  }
}

/// class AnimationMean extends CompoundAnimation<double>
class AnimationMean$Mate extends AnimationMean with Mate<AnimationMean$Mate> {
  /// AnimationMean AnimationMean({required Animation<double> left, required Animation<double> right})
  AnimationMean$Mate({
    /// param: {required Animation<double> left}
    required Animation<double> left,

    /// param: {required Animation<double> right}
    required Animation<double> right,
  }) : super(
          left: left,
          right: right,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => AnimationMean$Mate(
        left: p.getValue('left'),
        right: p.getValue('right'),
      ),
    );
    mateParams.set(name: 'left', init: left);
    mateParams.set(name: 'right', init: right);
  }
}

/// class AnimationMax<T extends num> extends CompoundAnimation<T>
class AnimationMax$Mate<T extends num> extends AnimationMax<T> with Mate<AnimationMax$Mate> {
  /// AnimationMax<T> AnimationMax(Animation<T> first, Animation<T> next)
  AnimationMax$Mate(
    /// param: Animation<T> first
    Animation<T> first,

    /// param: Animation<T> next
    Animation<T> next,
  ) : super(
          first,
          next,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => AnimationMax$Mate(
        p.getValue('first'),
        p.getValue('next'),
      ),
    );
    mateParams.set(name: 'first', init: first);
    mateParams.set(name: 'next', init: next);
  }
}

/// class AnimationMin<T extends num> extends CompoundAnimation<T>
class AnimationMin$Mate<T extends num> extends AnimationMin<T> with Mate<AnimationMin$Mate> {
  /// AnimationMin<T> AnimationMin(Animation<T> first, Animation<T> next)
  AnimationMin$Mate(
    /// param: Animation<T> first
    Animation<T> first,

    /// param: Animation<T> next
    Animation<T> next,
  ) : super(
          first,
          next,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => AnimationMin$Mate(
        p.getValue('first'),
        p.getValue('next'),
      ),
    );
    mateParams.set(name: 'first', init: first);
    mateParams.set(name: 'next', init: next);
  }
}
