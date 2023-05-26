// /// Generated by gen_maters.dart, please don't edit!

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/src/material/bottom_app_bar_theme.dart' as _i1;
import 'package:mate/mate_core.dart' as _i2;
import 'dart:ui' as _i3;
import 'package:flutter/src/painting/notched_shapes.dart' as _i4;
import 'package:flutter/src/painting/edge_insets.dart' as _i5;

/// class BottomAppBarTheme with Diagnosticable
class BottomAppBarTheme$Mate extends _i1.BottomAppBarTheme with _i2.Mate {
  /// BottomAppBarTheme BottomAppBarTheme({Color? color, double? elevation, NotchedShape? shape, double? height, Color? surfaceTintColor, Color? shadowColor, EdgeInsetsGeometry? padding})
  BottomAppBarTheme$Mate({
    /// optionalParameters: {Color? color} , default:none
    super.color,

    /// optionalParameters: {double? elevation} , default:none
    super.elevation,

    /// optionalParameters: {NotchedShape? shape} , default:none
    super.shape,

    /// optionalParameters: {double? height} , default:none
    super.height,

    /// optionalParameters: {Color? surfaceTintColor} , default:none
    super.surfaceTintColor,

    /// optionalParameters: {Color? shadowColor} , default:none
    super.shadowColor,

    /// optionalParameters: {EdgeInsetsGeometry? padding} , default:none
    super.padding,
  })  : mateParams = {
          'color': _i2.BuilderArg<_i3.Color?>(
            name: 'color',
            init: color,
            isNamed: true,
          ),
          'elevation': _i2.BuilderArg<double?>(
            name: 'elevation',
            init: elevation,
            isNamed: true,
          ),
          'shape': _i2.BuilderArg<_i4.NotchedShape?>(
            name: 'shape',
            init: shape,
            isNamed: true,
          ),
          'height': _i2.BuilderArg<double?>(
            name: 'height',
            init: height,
            isNamed: true,
          ),
          'surfaceTintColor': _i2.BuilderArg<_i3.Color?>(
            name: 'surfaceTintColor',
            init: surfaceTintColor,
            isNamed: true,
          ),
          'shadowColor': _i2.BuilderArg<_i3.Color?>(
            name: 'shadowColor',
            init: shadowColor,
            isNamed: true,
          ),
          'padding': _i2.BuilderArg<_i5.EdgeInsetsGeometry?>(
            name: 'padding',
            init: padding,
            isNamed: true,
          ),
        },
        super() {
    mateBuilderName = 'BottomAppBarTheme';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => BottomAppBarTheme$Mate(
          color: p.get('color').build(),
          elevation: p.get('elevation').build(),
          shape: p.get('shape').build(),
          height: p.get('height').build(),
          surfaceTintColor: p.get('surfaceTintColor').build(),
          shadowColor: p.get('shadowColor').build(),
          padding: p.get('padding').build(),
        );
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}