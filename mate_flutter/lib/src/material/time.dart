// /// Generated by gen_maters.dart, please don't edit!

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/src/material/time.dart' as _i1;
import 'package:mate/mate_core.dart' as _i2;

/// class TimeOfDay
class TimeOfDay$Mate extends _i1.TimeOfDay with _i2.Mate {
  /// TimeOfDay TimeOfDay({required int hour, required int minute})
  TimeOfDay$Mate({
    /// optionalParameters: {required int hour} , default:none
    required super.hour,

    /// optionalParameters: {required int minute} , default:none
    required super.minute,
  })  : mateParams = {
          'hour': _i2.BuilderArg<int>(
            name: 'hour',
            init: hour,
            isNamed: true,
          ),
          'minute': _i2.BuilderArg<int>(
            name: 'minute',
            init: minute,
            isNamed: true,
          ),
        },
        super() {
    mateBuilderName = 'TimeOfDay';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => TimeOfDay$Mate(
          hour: p.get('hour').build(),
          minute: p.get('minute').build(),
        );
  }

  /// TimeOfDay TimeOfDay.fromDateTime(DateTime time)
  TimeOfDay$Mate.fromDateTime(

      /// requiredParameters: DateTime time
      super.time)
      : mateParams = {
          'time': _i2.BuilderArg<DateTime>(
            name: 'time',
            init: time,
            isNamed: false,
          )
        },
        super.fromDateTime() {
    mateBuilderName = 'TimeOfDay.fromDateTime';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => TimeOfDay$Mate.fromDateTime(p.get('time').value);
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}

/// class RestorableTimeOfDay extends RestorableValue<TimeOfDay>
class RestorableTimeOfDay$Mate extends _i1.RestorableTimeOfDay with _i2.Mate {
  /// RestorableTimeOfDay RestorableTimeOfDay(TimeOfDay defaultValue)
  RestorableTimeOfDay$Mate(

      /// requiredParameters: TimeOfDay defaultValue
      super.defaultValue)
      : mateParams = {
          'defaultValue': _i2.BuilderArg<_i1.TimeOfDay>(
            name: 'defaultValue',
            init: defaultValue,
            isNamed: false,
          )
        },
        super() {
    mateBuilderName = 'RestorableTimeOfDay';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => RestorableTimeOfDay$Mate(p.get('defaultValue').value);
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}