// /// Generated by gen_maters.dart, please don't edit!

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/src/rendering/image.dart' as _i1;
import 'package:mate/mate_core.dart' as _i2;
import 'dart:ui' as _i3;
import 'package:flutter/src/animation/animation.dart' as _i4;
import 'package:flutter/src/painting/box_fit.dart' as _i5;
import 'package:flutter/src/painting/alignment.dart' as _i6;
import 'package:flutter/cupertino.dart' as _i7;
import 'package:flutter/src/painting/decoration_image.dart' as _i8;

/// class RenderImage extends RenderBox
class RenderImage$Mate extends _i1.RenderImage with _i2.Mate {
  /// RenderImage RenderImage({Image? image, String? debugImageLabel, double? width, double? height, double scale = 1.0, Color? color, Animation<double>? opacity, BlendMode? colorBlendMode, BoxFit? fit, AlignmentGeometry alignment = Alignment.center, ImageRepeat repeat = ImageRepeat.noRepeat, Rect? centerSlice, bool matchTextDirection = false, TextDirection? textDirection, bool invertColors = false, bool isAntiAlias = false, FilterQuality filterQuality = FilterQuality.low})
  RenderImage$Mate({
    /// optionalParameters: {Image? image} , default:none
    super.image,

    /// optionalParameters: {String? debugImageLabel} , default:none
    super.debugImageLabel,

    /// optionalParameters: {double? width} , default:none
    super.width,

    /// optionalParameters: {double? height} , default:none
    super.height,

    /// optionalParameters: {double scale = 1.0} , default:processed=DoubleLiteralImpl
    super.scale,

    /// optionalParameters: {Color? color} , default:none
    super.color,

    /// optionalParameters: {Animation<double>? opacity} , default:none
    super.opacity,

    /// optionalParameters: {BlendMode? colorBlendMode} , default:none
    super.colorBlendMode,

    /// optionalParameters: {BoxFit? fit} , default:none
    super.fit,

    /// optionalParameters: {AlignmentGeometry alignment = Alignment.center} , default:processed=PrefixedIdentifierImpl
    super.alignment,

    /// optionalParameters: {ImageRepeat repeat = ImageRepeat.noRepeat} , default:processed=PrefixedIdentifierImpl
    super.repeat,

    /// optionalParameters: {Rect? centerSlice} , default:none
    super.centerSlice,

    /// optionalParameters: {bool matchTextDirection = false} , default:processed=BooleanLiteralImpl
    super.matchTextDirection,

    /// optionalParameters: {TextDirection? textDirection} , default:none
    super.textDirection,

    /// optionalParameters: {bool invertColors = false} , default:processed=BooleanLiteralImpl
    super.invertColors,

    /// optionalParameters: {bool isAntiAlias = false} , default:processed=BooleanLiteralImpl
    super.isAntiAlias,

    /// optionalParameters: {FilterQuality filterQuality = FilterQuality.low} , default:processed=PrefixedIdentifierImpl
    super.filterQuality,
  })  : mateParams = {
          'image': _i2.BuilderArg<_i3.Image?>(
            name: 'image',
            init: image,
            isNamed: true,
          ),
          'debugImageLabel': _i2.BuilderArg<String?>(
            name: 'debugImageLabel',
            init: debugImageLabel,
            isNamed: true,
          ),
          'width': _i2.BuilderArg<double?>(
            name: 'width',
            init: width,
            isNamed: true,
          ),
          'height': _i2.BuilderArg<double?>(
            name: 'height',
            init: height,
            isNamed: true,
          ),
          'scale': _i2.BuilderArg<double>(
            name: 'scale',
            init: scale,
            isNamed: true,
            defaultValue: 1.0,
          ),
          'color': _i2.BuilderArg<_i3.Color?>(
            name: 'color',
            init: color,
            isNamed: true,
          ),
          'opacity': _i2.BuilderArg<_i4.Animation<double>?>(
            name: 'opacity',
            init: opacity,
            isNamed: true,
          ),
          'colorBlendMode': _i2.BuilderArg<_i3.BlendMode?>(
            name: 'colorBlendMode',
            init: colorBlendMode,
            isNamed: true,
          ),
          'fit': _i2.BuilderArg<_i5.BoxFit?>(
            name: 'fit',
            init: fit,
            isNamed: true,
          ),
          'alignment': _i2.BuilderArg<_i6.AlignmentGeometry>(
            name: 'alignment',
            init: alignment,
            isNamed: true,
            defaultValue: _i7.Alignment.center,
          ),
          'repeat': _i2.BuilderArg<_i8.ImageRepeat>(
            name: 'repeat',
            init: repeat,
            isNamed: true,
            defaultValue: _i7.ImageRepeat.noRepeat,
          ),
          'centerSlice': _i2.BuilderArg<_i3.Rect?>(
            name: 'centerSlice',
            init: centerSlice,
            isNamed: true,
          ),
          'matchTextDirection': _i2.BuilderArg<bool>(
            name: 'matchTextDirection',
            init: matchTextDirection,
            isNamed: true,
            defaultValue: false,
          ),
          'textDirection': _i2.BuilderArg<_i3.TextDirection?>(
            name: 'textDirection',
            init: textDirection,
            isNamed: true,
          ),
          'invertColors': _i2.BuilderArg<bool>(
            name: 'invertColors',
            init: invertColors,
            isNamed: true,
            defaultValue: false,
          ),
          'isAntiAlias': _i2.BuilderArg<bool>(
            name: 'isAntiAlias',
            init: isAntiAlias,
            isNamed: true,
            defaultValue: false,
          ),
          'filterQuality': _i2.BuilderArg<_i3.FilterQuality>(
            name: 'filterQuality',
            init: filterQuality,
            isNamed: true,
            defaultValue: _i3.FilterQuality.low,
          ),
        },
        super() {
    mateBuilderName = 'RenderImage';
    matePackageUrl = 'package:flutter/rendering.dart';
    mateBuilder = (p) => RenderImage$Mate(
          image: p.get('image').build(),
          debugImageLabel: p.get('debugImageLabel').build(),
          width: p.get('width').build(),
          height: p.get('height').build(),
          scale: p.get('scale').build(),
          color: p.get('color').build(),
          opacity: p.get('opacity').build(),
          colorBlendMode: p.get('colorBlendMode').build(),
          fit: p.get('fit').build(),
          alignment: p.get('alignment').build(),
          repeat: p.get('repeat').build(),
          centerSlice: p.get('centerSlice').build(),
          matchTextDirection: p.get('matchTextDirection').build(),
          textDirection: p.get('textDirection').build(),
          invertColors: p.get('invertColors').build(),
          isAntiAlias: p.get('isAntiAlias').build(),
          filterQuality: p.get('filterQuality').build(),
        );
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}