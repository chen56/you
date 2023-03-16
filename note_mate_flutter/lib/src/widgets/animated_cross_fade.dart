// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/widgets/animated_cross_fade.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/animation/curves.dart';
import 'package:flutter/src/painting/alignment.dart';
import 'dart:core';
import 'package:note/mate.dart';

/// class AnimatedCrossFade extends StatefulWidget
class AnimatedCrossFade$Mate extends AnimatedCrossFade with WidgetMate<AnimatedCrossFade$Mate> {
  /// AnimatedCrossFade AnimatedCrossFade({Key? key, required Widget firstChild, required Widget secondChild, Curve firstCurve = Curves.linear, Curve secondCurve = Curves.linear, Curve sizeCurve = Curves.linear, AlignmentGeometry alignment = Alignment.topCenter, required CrossFadeState crossFadeState, required Duration duration, Duration? reverseDuration, Widget Function(Widget, Key, Widget, Key) layoutBuilder = defaultLayoutBuilder, bool excludeBottomFocus = true})
  AnimatedCrossFade$Mate({
    /// optionalParameters: {Key? key} , hasDefaultValue:false, defaultValueCode:null
    Key? key,

    /// optionalParameters: {required Widget firstChild} , hasDefaultValue:false, defaultValueCode:null
    required Widget firstChild,

    /// optionalParameters: {required Widget secondChild} , hasDefaultValue:false, defaultValueCode:null
    required Widget secondChild,

    /// optionalParameters: {Curve firstCurve = Curves.linear} , hasDefaultValue:true, defaultValueCode:Curves.linear
    required Curve firstCurve,

    /// optionalParameters: {Curve secondCurve = Curves.linear} , hasDefaultValue:true, defaultValueCode:Curves.linear
    required Curve secondCurve,

    /// optionalParameters: {Curve sizeCurve = Curves.linear} , hasDefaultValue:true, defaultValueCode:Curves.linear
    required Curve sizeCurve,

    /// optionalParameters: {AlignmentGeometry alignment = Alignment.topCenter} , hasDefaultValue:true, defaultValueCode:Alignment.topCenter
    required AlignmentGeometry alignment,

    /// optionalParameters: {required CrossFadeState crossFadeState} , hasDefaultValue:false, defaultValueCode:null
    required CrossFadeState crossFadeState,

    /// optionalParameters: {required Duration duration} , hasDefaultValue:false, defaultValueCode:null
    required Duration duration,

    /// optionalParameters: {Duration? reverseDuration} , hasDefaultValue:false, defaultValueCode:null
    Duration? reverseDuration,

    /// optionalParameters: {Widget Function(Widget, Key, Widget, Key) layoutBuilder = defaultLayoutBuilder} , hasDefaultValue:true, defaultValueCode:defaultLayoutBuilder
    required AnimatedCrossFadeBuilder layoutBuilder,

    /// optionalParameters: {bool excludeBottomFocus = true} , hasDefaultValue:true, defaultValueCode:true
    required bool excludeBottomFocus,
  }) : super(
          key: key,
          firstChild: firstChild,
          secondChild: secondChild,
          firstCurve: firstCurve,
          secondCurve: secondCurve,
          sizeCurve: sizeCurve,
          alignment: alignment,
          crossFadeState: crossFadeState,
          duration: duration,
          reverseDuration: reverseDuration,
          layoutBuilder: layoutBuilder,
          excludeBottomFocus: excludeBottomFocus,
        ) {
    mateParams = ObjectParam(
      init: this,
      builder: (p) => AnimatedCrossFade$Mate(
        key: p.get('key').value,
        firstChild: p.get('firstChild').value,
        secondChild: p.get('secondChild').value,
        firstCurve: p.get('firstCurve').value,
        secondCurve: p.get('secondCurve').value,
        sizeCurve: p.get('sizeCurve').value,
        alignment: p.get('alignment').value,
        crossFadeState: p.get('crossFadeState').value,
        duration: p.get('duration').value,
        reverseDuration: p.get('reverseDuration').value,
        layoutBuilder: p.get('layoutBuilder').value,
        excludeBottomFocus: p.get('excludeBottomFocus').value,
      ),
    );
    mateParams.put('key', key);
    mateParams.put('firstChild', firstChild);
    mateParams.put('secondChild', secondChild);
    mateParams.put('firstCurve', firstCurve);
    mateParams.put('secondCurve', secondCurve);
    mateParams.put('sizeCurve', sizeCurve);
    mateParams.put('alignment', alignment);
    mateParams.put('crossFadeState', crossFadeState);
    mateParams.put('duration', duration);
    mateParams.put('reverseDuration', reverseDuration);
    mateParams.put('layoutBuilder', layoutBuilder);
    mateParams.put('excludeBottomFocus', excludeBottomFocus);
  }
}
