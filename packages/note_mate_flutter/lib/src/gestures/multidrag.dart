// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/gestures/multidrag.dart';
import 'package:note/mate.dart';
import 'dart:core';
import 'dart:ui';
import 'package:flutter/src/gestures/recognizer.dart';

/// class ImmediateMultiDragGestureRecognizer extends MultiDragGestureRecognizer
class ImmediateMultiDragGestureRecognizer$Mate extends ImmediateMultiDragGestureRecognizer with Mate {
  /// ImmediateMultiDragGestureRecognizer ImmediateMultiDragGestureRecognizer({Object? debugOwner, Set<PointerDeviceKind>? supportedDevices, bool Function(int)? allowedButtonsFilter = _defaultButtonAcceptBehavior})
  ImmediateMultiDragGestureRecognizer$Mate({
    /// optionalParameters: {Object? debugOwner} , hasDefaultValue:false, defaultValueCode:null
    Object? debugOwner,

    /// optionalParameters: {Set<PointerDeviceKind>? supportedDevices} , hasDefaultValue:false, defaultValueCode:null
    Set<PointerDeviceKind>? supportedDevices,

    /// optionalParameters: {bool Function(int)? allowedButtonsFilter = _defaultButtonAcceptBehavior} , hasDefaultValue:true, defaultValueCode:_defaultButtonAcceptBehavior
    AllowedButtonsFilter? allowedButtonsFilter,
  }) : super(
          debugOwner: debugOwner,
          supportedDevices: supportedDevices,
          allowedButtonsFilter: allowedButtonsFilter,
        ) {
    mateBuilder = (p) => ImmediateMultiDragGestureRecognizer$Mate(
          debugOwner: p.get('debugOwner').build(),
          supportedDevices: p.get('supportedDevices').build(),
          allowedButtonsFilter: p.get('allowedButtonsFilter').build(),
        );
    matePut('debugOwner', debugOwner);
    matePut('supportedDevices', supportedDevices);
    matePut('allowedButtonsFilter', allowedButtonsFilter);
  }
}

/// class HorizontalMultiDragGestureRecognizer extends MultiDragGestureRecognizer
class HorizontalMultiDragGestureRecognizer$Mate extends HorizontalMultiDragGestureRecognizer with Mate {
  /// HorizontalMultiDragGestureRecognizer HorizontalMultiDragGestureRecognizer({Object? debugOwner, Set<PointerDeviceKind>? supportedDevices, bool Function(int)? allowedButtonsFilter = _defaultButtonAcceptBehavior})
  HorizontalMultiDragGestureRecognizer$Mate({
    /// optionalParameters: {Object? debugOwner} , hasDefaultValue:false, defaultValueCode:null
    Object? debugOwner,

    /// optionalParameters: {Set<PointerDeviceKind>? supportedDevices} , hasDefaultValue:false, defaultValueCode:null
    Set<PointerDeviceKind>? supportedDevices,

    /// optionalParameters: {bool Function(int)? allowedButtonsFilter = _defaultButtonAcceptBehavior} , hasDefaultValue:true, defaultValueCode:_defaultButtonAcceptBehavior
    AllowedButtonsFilter? allowedButtonsFilter,
  }) : super(
          debugOwner: debugOwner,
          supportedDevices: supportedDevices,
          allowedButtonsFilter: allowedButtonsFilter,
        ) {
    mateBuilder = (p) => HorizontalMultiDragGestureRecognizer$Mate(
          debugOwner: p.get('debugOwner').build(),
          supportedDevices: p.get('supportedDevices').build(),
          allowedButtonsFilter: p.get('allowedButtonsFilter').build(),
        );
    matePut('debugOwner', debugOwner);
    matePut('supportedDevices', supportedDevices);
    matePut('allowedButtonsFilter', allowedButtonsFilter);
  }
}

/// class VerticalMultiDragGestureRecognizer extends MultiDragGestureRecognizer
class VerticalMultiDragGestureRecognizer$Mate extends VerticalMultiDragGestureRecognizer with Mate {
  /// VerticalMultiDragGestureRecognizer VerticalMultiDragGestureRecognizer({Object? debugOwner, Set<PointerDeviceKind>? supportedDevices, bool Function(int)? allowedButtonsFilter = _defaultButtonAcceptBehavior})
  VerticalMultiDragGestureRecognizer$Mate({
    /// optionalParameters: {Object? debugOwner} , hasDefaultValue:false, defaultValueCode:null
    Object? debugOwner,

    /// optionalParameters: {Set<PointerDeviceKind>? supportedDevices} , hasDefaultValue:false, defaultValueCode:null
    Set<PointerDeviceKind>? supportedDevices,

    /// optionalParameters: {bool Function(int)? allowedButtonsFilter = _defaultButtonAcceptBehavior} , hasDefaultValue:true, defaultValueCode:_defaultButtonAcceptBehavior
    AllowedButtonsFilter? allowedButtonsFilter,
  }) : super(
          debugOwner: debugOwner,
          supportedDevices: supportedDevices,
          allowedButtonsFilter: allowedButtonsFilter,
        ) {
    mateBuilder = (p) => VerticalMultiDragGestureRecognizer$Mate(
          debugOwner: p.get('debugOwner').build(),
          supportedDevices: p.get('supportedDevices').build(),
          allowedButtonsFilter: p.get('allowedButtonsFilter').build(),
        );
    matePut('debugOwner', debugOwner);
    matePut('supportedDevices', supportedDevices);
    matePut('allowedButtonsFilter', allowedButtonsFilter);
  }
}

/// class DelayedMultiDragGestureRecognizer extends MultiDragGestureRecognizer
class DelayedMultiDragGestureRecognizer$Mate extends DelayedMultiDragGestureRecognizer with Mate {
  /// DelayedMultiDragGestureRecognizer DelayedMultiDragGestureRecognizer({Duration delay = kLongPressTimeout, Object? debugOwner, Set<PointerDeviceKind>? supportedDevices, bool Function(int)? allowedButtonsFilter = _defaultButtonAcceptBehavior})
  DelayedMultiDragGestureRecognizer$Mate({
    /// optionalParameters: {Duration delay = kLongPressTimeout} , hasDefaultValue:true, defaultValueCode:kLongPressTimeout
    required Duration delay,

    /// optionalParameters: {Object? debugOwner} , hasDefaultValue:false, defaultValueCode:null
    Object? debugOwner,

    /// optionalParameters: {Set<PointerDeviceKind>? supportedDevices} , hasDefaultValue:false, defaultValueCode:null
    Set<PointerDeviceKind>? supportedDevices,

    /// optionalParameters: {bool Function(int)? allowedButtonsFilter = _defaultButtonAcceptBehavior} , hasDefaultValue:true, defaultValueCode:_defaultButtonAcceptBehavior
    AllowedButtonsFilter? allowedButtonsFilter,
  }) : super(
          delay: delay,
          debugOwner: debugOwner,
          supportedDevices: supportedDevices,
          allowedButtonsFilter: allowedButtonsFilter,
        ) {
    mateBuilder = (p) => DelayedMultiDragGestureRecognizer$Mate(
          delay: p.get('delay').build(),
          debugOwner: p.get('debugOwner').build(),
          supportedDevices: p.get('supportedDevices').build(),
          allowedButtonsFilter: p.get('allowedButtonsFilter').build(),
        );
    matePut('delay', delay);
    matePut('debugOwner', debugOwner);
    matePut('supportedDevices', supportedDevices);
    matePut('allowedButtonsFilter', allowedButtonsFilter);
  }
}