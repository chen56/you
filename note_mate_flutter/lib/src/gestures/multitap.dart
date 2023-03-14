// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/gestures/multitap.dart';
import 'dart:core';
import 'dart:ui';
import 'package:flutter/src/gestures/recognizer.dart';
import 'package:note/mate.dart';

/// class DoubleTapGestureRecognizer extends GestureRecognizer
class DoubleTapGestureRecognizer$Mate extends DoubleTapGestureRecognizer with Mate<DoubleTapGestureRecognizer$Mate> {
  /// DoubleTapGestureRecognizer DoubleTapGestureRecognizer({Object? debugOwner, Set<PointerDeviceKind>? supportedDevices, bool Function(int)? allowedButtonsFilter = _defaultButtonAcceptBehavior})
  DoubleTapGestureRecognizer$Mate({
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
    mateParams = Params(
      init: this,
      builder: (p) => DoubleTapGestureRecognizer$Mate(
        debugOwner: p.getValue('debugOwner'),
        supportedDevices: p.getValue('supportedDevices'),
        allowedButtonsFilter: p.getValue('allowedButtonsFilter'),
      ),
    );
    mateParams.set(name: 'debugOwner', init: debugOwner);
    mateParams.set(name: 'supportedDevices', init: supportedDevices);
    mateParams.set(name: 'allowedButtonsFilter', init: allowedButtonsFilter);
  }
}

/// class MultiTapGestureRecognizer extends GestureRecognizer
class MultiTapGestureRecognizer$Mate extends MultiTapGestureRecognizer with Mate<MultiTapGestureRecognizer$Mate> {
  /// MultiTapGestureRecognizer MultiTapGestureRecognizer({Duration longTapDelay = Duration.zero, Object? debugOwner, Set<PointerDeviceKind>? supportedDevices, bool Function(int)? allowedButtonsFilter})
  MultiTapGestureRecognizer$Mate({
    /// optionalParameters: {Duration longTapDelay = Duration.zero} , hasDefaultValue:true, defaultValueCode:Duration.zero
    required Duration longTapDelay,

    /// optionalParameters: {Object? debugOwner} , hasDefaultValue:false, defaultValueCode:null
    Object? debugOwner,

    /// optionalParameters: {Set<PointerDeviceKind>? supportedDevices} , hasDefaultValue:false, defaultValueCode:null
    Set<PointerDeviceKind>? supportedDevices,

    /// optionalParameters: {bool Function(int)? allowedButtonsFilter} , hasDefaultValue:false, defaultValueCode:null
    AllowedButtonsFilter? allowedButtonsFilter,
  }) : super(
          longTapDelay: longTapDelay,
          debugOwner: debugOwner,
          supportedDevices: supportedDevices,
          allowedButtonsFilter: allowedButtonsFilter,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => MultiTapGestureRecognizer$Mate(
        longTapDelay: p.getValue('longTapDelay'),
        debugOwner: p.getValue('debugOwner'),
        supportedDevices: p.getValue('supportedDevices'),
        allowedButtonsFilter: p.getValue('allowedButtonsFilter'),
      ),
    );
    mateParams.set(name: 'longTapDelay', init: longTapDelay);
    mateParams.set(name: 'debugOwner', init: debugOwner);
    mateParams.set(name: 'supportedDevices', init: supportedDevices);
    mateParams.set(name: 'allowedButtonsFilter', init: allowedButtonsFilter);
  }
}

/// class SerialTapDownDetails
class SerialTapDownDetails$Mate extends SerialTapDownDetails with Mate<SerialTapDownDetails$Mate> {
  /// SerialTapDownDetails SerialTapDownDetails({Offset globalPosition = Offset.zero, Offset? localPosition, required PointerDeviceKind kind, int buttons = 0, int count = 1})
  SerialTapDownDetails$Mate({
    /// optionalParameters: {Offset globalPosition = Offset.zero} , hasDefaultValue:true, defaultValueCode:Offset.zero
    required Offset globalPosition,

    /// optionalParameters: {Offset? localPosition} , hasDefaultValue:false, defaultValueCode:null
    Offset? localPosition,

    /// optionalParameters: {required PointerDeviceKind kind} , hasDefaultValue:false, defaultValueCode:null
    required PointerDeviceKind kind,

    /// optionalParameters: {int buttons = 0} , hasDefaultValue:true, defaultValueCode:0
    required int buttons,

    /// optionalParameters: {int count = 1} , hasDefaultValue:true, defaultValueCode:1
    required int count,
  }) : super(
          globalPosition: globalPosition,
          localPosition: localPosition,
          kind: kind,
          buttons: buttons,
          count: count,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => SerialTapDownDetails$Mate(
        globalPosition: p.getValue('globalPosition'),
        localPosition: p.getValue('localPosition'),
        kind: p.getValue('kind'),
        buttons: p.getValue('buttons'),
        count: p.getValue('count'),
      ),
    );
    mateParams.set(name: 'globalPosition', init: globalPosition);
    mateParams.set(name: 'localPosition', init: localPosition);
    mateParams.set(name: 'kind', init: kind);
    mateParams.set(name: 'buttons', init: buttons);
    mateParams.set(name: 'count', init: count);
  }
}

/// class SerialTapCancelDetails
class SerialTapCancelDetails$Mate extends SerialTapCancelDetails with Mate<SerialTapCancelDetails$Mate> {
  /// SerialTapCancelDetails SerialTapCancelDetails({int count = 1})
  SerialTapCancelDetails$Mate(
      {
      /// optionalParameters: {int count = 1} , hasDefaultValue:true, defaultValueCode:1
      required int count})
      : super(count: count) {
    mateParams = Params(
      init: this,
      builder: (p) => SerialTapCancelDetails$Mate(count: p.getValue('count')),
    );
    mateParams.set(name: 'count', init: count);
  }
}

/// class SerialTapUpDetails
class SerialTapUpDetails$Mate extends SerialTapUpDetails with Mate<SerialTapUpDetails$Mate> {
  /// SerialTapUpDetails SerialTapUpDetails({Offset globalPosition = Offset.zero, Offset? localPosition, PointerDeviceKind? kind, int count = 1})
  SerialTapUpDetails$Mate({
    /// optionalParameters: {Offset globalPosition = Offset.zero} , hasDefaultValue:true, defaultValueCode:Offset.zero
    required Offset globalPosition,

    /// optionalParameters: {Offset? localPosition} , hasDefaultValue:false, defaultValueCode:null
    Offset? localPosition,

    /// optionalParameters: {PointerDeviceKind? kind} , hasDefaultValue:false, defaultValueCode:null
    PointerDeviceKind? kind,

    /// optionalParameters: {int count = 1} , hasDefaultValue:true, defaultValueCode:1
    required int count,
  }) : super(
          globalPosition: globalPosition,
          localPosition: localPosition,
          kind: kind,
          count: count,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => SerialTapUpDetails$Mate(
        globalPosition: p.getValue('globalPosition'),
        localPosition: p.getValue('localPosition'),
        kind: p.getValue('kind'),
        count: p.getValue('count'),
      ),
    );
    mateParams.set(name: 'globalPosition', init: globalPosition);
    mateParams.set(name: 'localPosition', init: localPosition);
    mateParams.set(name: 'kind', init: kind);
    mateParams.set(name: 'count', init: count);
  }
}

/// class SerialTapGestureRecognizer extends GestureRecognizer
class SerialTapGestureRecognizer$Mate extends SerialTapGestureRecognizer with Mate<SerialTapGestureRecognizer$Mate> {
  /// SerialTapGestureRecognizer SerialTapGestureRecognizer({Object? debugOwner, Set<PointerDeviceKind>? supportedDevices, bool Function(int)? allowedButtonsFilter})
  SerialTapGestureRecognizer$Mate({
    /// optionalParameters: {Object? debugOwner} , hasDefaultValue:false, defaultValueCode:null
    Object? debugOwner,

    /// optionalParameters: {Set<PointerDeviceKind>? supportedDevices} , hasDefaultValue:false, defaultValueCode:null
    Set<PointerDeviceKind>? supportedDevices,

    /// optionalParameters: {bool Function(int)? allowedButtonsFilter} , hasDefaultValue:false, defaultValueCode:null
    AllowedButtonsFilter? allowedButtonsFilter,
  }) : super(
          debugOwner: debugOwner,
          supportedDevices: supportedDevices,
          allowedButtonsFilter: allowedButtonsFilter,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => SerialTapGestureRecognizer$Mate(
        debugOwner: p.getValue('debugOwner'),
        supportedDevices: p.getValue('supportedDevices'),
        allowedButtonsFilter: p.getValue('allowedButtonsFilter'),
      ),
    );
    mateParams.set(name: 'debugOwner', init: debugOwner);
    mateParams.set(name: 'supportedDevices', init: supportedDevices);
    mateParams.set(name: 'allowedButtonsFilter', init: allowedButtonsFilter);
  }
}
