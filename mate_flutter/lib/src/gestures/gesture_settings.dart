// /// Generated by gen_maters.dart, please don't edit!

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/src/gestures/gesture_settings.dart' as _i1;
import 'package:mate/mate_core.dart' as _i2;

/// class DeviceGestureSettings
class DeviceGestureSettings$Mate extends _i1.DeviceGestureSettings
    with _i2.Mate {
  /// DeviceGestureSettings DeviceGestureSettings({double? touchSlop})
  DeviceGestureSettings$Mate(
      {
      /// optionalParameters: {double? touchSlop} , default:none
      super.touchSlop})
      : mateParams = {
          'touchSlop': _i2.BuilderArg<double?>(
            name: 'touchSlop',
            init: touchSlop,
            isNamed: true,
          )
        },
        super() {
    mateBuilderName = 'DeviceGestureSettings';
    matePackageUrl = 'package:flutter/gestures.dart';
    mateBuilder = (p) =>
        DeviceGestureSettings$Mate(touchSlop: p.get('touchSlop').build());
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}