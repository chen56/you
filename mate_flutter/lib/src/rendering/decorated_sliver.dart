// /// Generated by gen_maters.dart, please don't edit!

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/src/rendering/decorated_sliver.dart' as _i1;
import 'package:mate/mate_core.dart' as _i2;
import 'package:flutter/src/painting/decoration.dart' as _i3;
import 'package:flutter/src/rendering/proxy_box.dart' as _i4;
import 'package:flutter/cupertino.dart' as _i5;
import 'package:flutter/src/painting/image_provider.dart' as _i6;

/// class RenderDecoratedSliver extends RenderProxySliver
class RenderDecoratedSliver$Mate extends _i1.RenderDecoratedSliver with _i2.Mate {
  /// RenderDecoratedSliver RenderDecoratedSliver({required Decoration decoration, DecorationPosition position = DecorationPosition.background, ImageConfiguration configuration = ImageConfiguration.empty})
  RenderDecoratedSliver$Mate({
    /// optionalParameters: {required Decoration decoration} , default:none
    required super.decoration,

    /// optionalParameters: {DecorationPosition position = DecorationPosition.background} , default:processed=PrefixedIdentifierImpl
    super.position,

    /// optionalParameters: {ImageConfiguration configuration = ImageConfiguration.empty} , default:processed=PrefixedIdentifierImpl
    super.configuration,
  })  : mateParams = {
          'decoration': _i2.BuilderArg<_i3.Decoration>(
            name: 'decoration',
            init: decoration,
            isNamed: true,
          ),
          'position': _i2.BuilderArg<_i4.DecorationPosition>(
            name: 'position',
            init: position,
            isNamed: true,
            defaultValue: _i5.DecorationPosition.background,
          ),
          'configuration': _i2.BuilderArg<_i6.ImageConfiguration>(
            name: 'configuration',
            init: configuration,
            isNamed: true,
            defaultValue: _i5.ImageConfiguration.empty,
          ),
        },
        super() {
    mateBuilderName = 'RenderDecoratedSliver';
    matePackageUrl = 'package:flutter/rendering.dart';
    mateBuilder = (p) => RenderDecoratedSliver$Mate(
          decoration: p.get('decoration').build(),
          position: p.get('position').build(),
          configuration: p.get('configuration').build(),
        );
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}