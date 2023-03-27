// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/services/platform_views.dart';
import 'package:note/mate.dart';
import 'dart:core';

/// class AndroidPointerProperties
class AndroidPointerProperties$Mate extends AndroidPointerProperties with Mate {
  /// AndroidPointerProperties AndroidPointerProperties({required int id, required int toolType})
  AndroidPointerProperties$Mate({
    /// optionalParameters: {required int id} , defaultValue:none
    required int id,

    /// optionalParameters: {required int toolType} , defaultValue:none
    required int toolType,
  }) : super(
          id: id,
          toolType: toolType,
        ) {
    mateCreateName = 'AndroidPointerProperties';
    matePackageUrl = 'package:flutter/services.dart';
    mateBuilder = (p) => AndroidPointerProperties$Mate(
          id: p.get('id').build(),
          toolType: p.get('toolType').build(),
        );
    mateUse('id', id, isNamed: true);
    mateUse('toolType', toolType, isNamed: true);
  }
}

/// class AndroidPointerCoords
class AndroidPointerCoords$Mate extends AndroidPointerCoords with Mate {
  /// AndroidPointerCoords AndroidPointerCoords({required double orientation, required double pressure, required double size, required double toolMajor, required double toolMinor, required double touchMajor, required double touchMinor, required double x, required double y})
  AndroidPointerCoords$Mate({
    /// optionalParameters: {required double orientation} , defaultValue:none
    required double orientation,

    /// optionalParameters: {required double pressure} , defaultValue:none
    required double pressure,

    /// optionalParameters: {required double size} , defaultValue:none
    required double size,

    /// optionalParameters: {required double toolMajor} , defaultValue:none
    required double toolMajor,

    /// optionalParameters: {required double toolMinor} , defaultValue:none
    required double toolMinor,

    /// optionalParameters: {required double touchMajor} , defaultValue:none
    required double touchMajor,

    /// optionalParameters: {required double touchMinor} , defaultValue:none
    required double touchMinor,

    /// optionalParameters: {required double x} , defaultValue:none
    required double x,

    /// optionalParameters: {required double y} , defaultValue:none
    required double y,
  }) : super(
          orientation: orientation,
          pressure: pressure,
          size: size,
          toolMajor: toolMajor,
          toolMinor: toolMinor,
          touchMajor: touchMajor,
          touchMinor: touchMinor,
          x: x,
          y: y,
        ) {
    mateCreateName = 'AndroidPointerCoords';
    matePackageUrl = 'package:flutter/services.dart';
    mateBuilder = (p) => AndroidPointerCoords$Mate(
          orientation: p.get('orientation').build(),
          pressure: p.get('pressure').build(),
          size: p.get('size').build(),
          toolMajor: p.get('toolMajor').build(),
          toolMinor: p.get('toolMinor').build(),
          touchMajor: p.get('touchMajor').build(),
          touchMinor: p.get('touchMinor').build(),
          x: p.get('x').build(),
          y: p.get('y').build(),
        );
    mateUse('orientation', orientation, isNamed: true);
    mateUse('pressure', pressure, isNamed: true);
    mateUse('size', size, isNamed: true);
    mateUse('toolMajor', toolMajor, isNamed: true);
    mateUse('toolMinor', toolMinor, isNamed: true);
    mateUse('touchMajor', touchMajor, isNamed: true);
    mateUse('touchMinor', touchMinor, isNamed: true);
    mateUse('x', x, isNamed: true);
    mateUse('y', y, isNamed: true);
  }
}

/// class AndroidMotionEvent
class AndroidMotionEvent$Mate extends AndroidMotionEvent with Mate {
  /// AndroidMotionEvent AndroidMotionEvent({required int downTime, required int eventTime, required int action, required int pointerCount, required List<AndroidPointerProperties> pointerProperties, required List<AndroidPointerCoords> pointerCoords, required int metaState, required int buttonState, required double xPrecision, required double yPrecision, required int deviceId, required int edgeFlags, required int source, required int flags, required int motionEventId})
  AndroidMotionEvent$Mate({
    /// optionalParameters: {required int downTime} , defaultValue:none
    required int downTime,

    /// optionalParameters: {required int eventTime} , defaultValue:none
    required int eventTime,

    /// optionalParameters: {required int action} , defaultValue:none
    required int action,

    /// optionalParameters: {required int pointerCount} , defaultValue:none
    required int pointerCount,

    /// optionalParameters: {required List<AndroidPointerProperties> pointerProperties} , defaultValue:none
    required List<AndroidPointerProperties> pointerProperties,

    /// optionalParameters: {required List<AndroidPointerCoords> pointerCoords} , defaultValue:none
    required List<AndroidPointerCoords> pointerCoords,

    /// optionalParameters: {required int metaState} , defaultValue:none
    required int metaState,

    /// optionalParameters: {required int buttonState} , defaultValue:none
    required int buttonState,

    /// optionalParameters: {required double xPrecision} , defaultValue:none
    required double xPrecision,

    /// optionalParameters: {required double yPrecision} , defaultValue:none
    required double yPrecision,

    /// optionalParameters: {required int deviceId} , defaultValue:none
    required int deviceId,

    /// optionalParameters: {required int edgeFlags} , defaultValue:none
    required int edgeFlags,

    /// optionalParameters: {required int source} , defaultValue:none
    required int source,

    /// optionalParameters: {required int flags} , defaultValue:none
    required int flags,

    /// optionalParameters: {required int motionEventId} , defaultValue:none
    required int motionEventId,
  }) : super(
          downTime: downTime,
          eventTime: eventTime,
          action: action,
          pointerCount: pointerCount,
          pointerProperties: pointerProperties,
          pointerCoords: pointerCoords,
          metaState: metaState,
          buttonState: buttonState,
          xPrecision: xPrecision,
          yPrecision: yPrecision,
          deviceId: deviceId,
          edgeFlags: edgeFlags,
          source: source,
          flags: flags,
          motionEventId: motionEventId,
        ) {
    mateCreateName = 'AndroidMotionEvent';
    matePackageUrl = 'package:flutter/services.dart';
    mateBuilder = (p) => AndroidMotionEvent$Mate(
          downTime: p.get('downTime').build(),
          eventTime: p.get('eventTime').build(),
          action: p.get('action').build(),
          pointerCount: p.get('pointerCount').build(),
          pointerProperties: p.get('pointerProperties').build(),
          pointerCoords: p.get('pointerCoords').build(),
          metaState: p.get('metaState').build(),
          buttonState: p.get('buttonState').build(),
          xPrecision: p.get('xPrecision').build(),
          yPrecision: p.get('yPrecision').build(),
          deviceId: p.get('deviceId').build(),
          edgeFlags: p.get('edgeFlags').build(),
          source: p.get('source').build(),
          flags: p.get('flags').build(),
          motionEventId: p.get('motionEventId').build(),
        );
    mateUse('downTime', downTime, isNamed: true);
    mateUse('eventTime', eventTime, isNamed: true);
    mateUse('action', action, isNamed: true);
    mateUse('pointerCount', pointerCount, isNamed: true);
    mateUseList('pointerProperties', pointerProperties, isNamed: true);
    mateUseList('pointerCoords', pointerCoords, isNamed: true);
    mateUse('metaState', metaState, isNamed: true);
    mateUse('buttonState', buttonState, isNamed: true);
    mateUse('xPrecision', xPrecision, isNamed: true);
    mateUse('yPrecision', yPrecision, isNamed: true);
    mateUse('deviceId', deviceId, isNamed: true);
    mateUse('edgeFlags', edgeFlags, isNamed: true);
    mateUse('source', source, isNamed: true);
    mateUse('flags', flags, isNamed: true);
    mateUse('motionEventId', motionEventId, isNamed: true);
  }
}
