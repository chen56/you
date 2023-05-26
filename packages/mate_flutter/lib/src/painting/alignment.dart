// /// Generated by gen_maters.dart, please don't edit!

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/src/painting/alignment.dart' as _i1;
import 'package:mate/mate_core.dart' as _i2;

/// class Alignment extends AlignmentGeometry
class Alignment$Mate extends _i1.Alignment with _i2.Mate {
  /// Alignment Alignment(double x, double y)
  Alignment$Mate(
    /// requiredParameters: double x
    super.x,

    /// requiredParameters: double y
    super.y,
  )   : mateParams = {
          'x': _i2.BuilderArg<double>(
            name: 'x',
            init: x,
            isNamed: false,
          ),
          'y': _i2.BuilderArg<double>(
            name: 'y',
            init: y,
            isNamed: false,
          ),
        },
        super() {
    mateBuilderName = 'Alignment';
    matePackageUrl = 'package:flutter/cupertino.dart';
    mateBuilder = (p) => Alignment$Mate(
          p.get('x').value,
          p.get('y').value,
        );
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}

/// class AlignmentDirectional extends AlignmentGeometry
class AlignmentDirectional$Mate extends _i1.AlignmentDirectional with _i2.Mate {
  /// AlignmentDirectional AlignmentDirectional(double start, double y)
  AlignmentDirectional$Mate(
    /// requiredParameters: double start
    super.start,

    /// requiredParameters: double y
    super.y,
  )   : mateParams = {
          'start': _i2.BuilderArg<double>(
            name: 'start',
            init: start,
            isNamed: false,
          ),
          'y': _i2.BuilderArg<double>(
            name: 'y',
            init: y,
            isNamed: false,
          ),
        },
        super() {
    mateBuilderName = 'AlignmentDirectional';
    matePackageUrl = 'package:flutter/cupertino.dart';
    mateBuilder = (p) => AlignmentDirectional$Mate(
          p.get('start').value,
          p.get('y').value,
        );
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}

/// class TextAlignVertical
class TextAlignVertical$Mate extends _i1.TextAlignVertical with _i2.Mate {
  /// TextAlignVertical TextAlignVertical({required double y})
  TextAlignVertical$Mate(
      {
      /// optionalParameters: {required double y} , default:none
      required super.y})
      : mateParams = {
          'y': _i2.BuilderArg<double>(
            name: 'y',
            init: y,
            isNamed: true,
          )
        },
        super() {
    mateBuilderName = 'TextAlignVertical';
    matePackageUrl = 'package:flutter/cupertino.dart';
    mateBuilder = (p) => TextAlignVertical$Mate(y: p.get('y').build());
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}