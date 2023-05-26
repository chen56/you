// /// Generated by gen_maters.dart, please don't edit!

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/src/material/circle_avatar.dart' as _i1;
import 'package:mate/mate_core.dart' as _i2;
import 'package:flutter/src/foundation/key.dart' as _i3;
import 'package:flutter/src/widgets/framework.dart' as _i4;
import 'dart:ui' as _i5;
import 'package:flutter/src/painting/image_provider.dart' as _i6;
import 'package:flutter/src/painting/image_stream.dart' as _i7;

/// class CircleAvatar extends StatelessWidget
class CircleAvatar$Mate extends _i1.CircleAvatar with _i2.Mate {
  /// CircleAvatar CircleAvatar({Key? key, Widget? child, Color? backgroundColor, ImageProvider<Object>? backgroundImage, ImageProvider<Object>? foregroundImage, void Function(Object, StackTrace?)? onBackgroundImageError, void Function(Object, StackTrace?)? onForegroundImageError, Color? foregroundColor, double? radius, double? minRadius, double? maxRadius})
  CircleAvatar$Mate({
    /// optionalParameters: {Key? key} , default:none
    super.key,

    /// optionalParameters: {Widget? child} , default:none
    super.child,

    /// optionalParameters: {Color? backgroundColor} , default:none
    super.backgroundColor,

    /// optionalParameters: {ImageProvider<Object>? backgroundImage} , default:none
    super.backgroundImage,

    /// optionalParameters: {ImageProvider<Object>? foregroundImage} , default:none
    super.foregroundImage,

    /// optionalParameters: {void Function(Object, StackTrace?)? onBackgroundImageError} , default:none
    super.onBackgroundImageError,

    /// optionalParameters: {void Function(Object, StackTrace?)? onForegroundImageError} , default:none
    super.onForegroundImageError,

    /// optionalParameters: {Color? foregroundColor} , default:none
    super.foregroundColor,

    /// optionalParameters: {double? radius} , default:none
    super.radius,

    /// optionalParameters: {double? minRadius} , default:none
    super.minRadius,

    /// optionalParameters: {double? maxRadius} , default:none
    super.maxRadius,
  })  : mateParams = {
          'key': _i2.BuilderArg<_i3.Key?>(
            name: 'key',
            init: key,
            isNamed: true,
          ),
          'child': _i2.BuilderArg<_i4.Widget?>(
            name: 'child',
            init: child,
            isNamed: true,
          ),
          'backgroundColor': _i2.BuilderArg<_i5.Color?>(
            name: 'backgroundColor',
            init: backgroundColor,
            isNamed: true,
          ),
          'backgroundImage': _i2.BuilderArg<_i6.ImageProvider<Object>?>(
            name: 'backgroundImage',
            init: backgroundImage,
            isNamed: true,
          ),
          'foregroundImage': _i2.BuilderArg<_i6.ImageProvider<Object>?>(
            name: 'foregroundImage',
            init: foregroundImage,
            isNamed: true,
          ),
          'onBackgroundImageError': _i2.BuilderArg<_i7.ImageErrorListener?>(
            name: 'onBackgroundImageError',
            init: onBackgroundImageError,
            isNamed: true,
          ),
          'onForegroundImageError': _i2.BuilderArg<_i7.ImageErrorListener?>(
            name: 'onForegroundImageError',
            init: onForegroundImageError,
            isNamed: true,
          ),
          'foregroundColor': _i2.BuilderArg<_i5.Color?>(
            name: 'foregroundColor',
            init: foregroundColor,
            isNamed: true,
          ),
          'radius': _i2.BuilderArg<double?>(
            name: 'radius',
            init: radius,
            isNamed: true,
          ),
          'minRadius': _i2.BuilderArg<double?>(
            name: 'minRadius',
            init: minRadius,
            isNamed: true,
          ),
          'maxRadius': _i2.BuilderArg<double?>(
            name: 'maxRadius',
            init: maxRadius,
            isNamed: true,
          ),
        },
        super() {
    mateBuilderName = 'CircleAvatar';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => CircleAvatar$Mate(
          key: p.get('key').build(),
          child: p.get('child').build(),
          backgroundColor: p.get('backgroundColor').build(),
          backgroundImage: p.get('backgroundImage').build(),
          foregroundImage: p.get('foregroundImage').build(),
          onBackgroundImageError: p.get('onBackgroundImageError').build(),
          onForegroundImageError: p.get('onForegroundImageError').build(),
          foregroundColor: p.get('foregroundColor').build(),
          radius: p.get('radius').build(),
          minRadius: p.get('minRadius').build(),
          maxRadius: p.get('maxRadius').build(),
        );
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}