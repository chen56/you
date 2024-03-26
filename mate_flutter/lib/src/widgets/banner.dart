// /// Generated by gen_maters.dart, please don't edit!

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/src/widgets/banner.dart' as _i1;
import 'package:mate/mate_core.dart' as _i2;
import 'dart:ui' as _i3;
import 'package:flutter/src/painting/text_style.dart' as _i4;
import 'package:flutter/src/foundation/key.dart' as _i5;
import 'package:flutter/src/widgets/framework.dart' as _i6;

/// class BannerPainter extends CustomPainter
class BannerPainter$Mate extends _i1.BannerPainter with _i2.Mate {
  /// BannerPainter BannerPainter({required String message, required TextDirection textDirection, required BannerLocation location, required TextDirection layoutDirection, Color color = _kColor, TextStyle textStyle = _kTextStyle})
  BannerPainter$Mate({
    /// optionalParameters: {required String message} , default:none
    required super.message,

    /// optionalParameters: {required TextDirection textDirection} , default:none
    required super.textDirection,

    /// optionalParameters: {required BannerLocation location} , default:none
    required super.location,

    /// optionalParameters: {required TextDirection layoutDirection} , default:none
    required super.layoutDirection,

    /// optionalParameters: {Color color = _kColor} , default:unprocessed=SimpleIdentifierImpl
    super.color,

    /// optionalParameters: {TextStyle textStyle = _kTextStyle} , default:unprocessed=SimpleIdentifierImpl
    super.textStyle,
  })  : mateParams = {
          'message': _i2.BuilderArg<String>(
            name: 'message',
            init: message,
            isNamed: true,
          ),
          'textDirection': _i2.BuilderArg<_i3.TextDirection>(
            name: 'textDirection',
            init: textDirection,
            isNamed: true,
          ),
          'location': _i2.BuilderArg<_i1.BannerLocation>(
            name: 'location',
            init: location,
            isNamed: true,
          ),
          'layoutDirection': _i2.BuilderArg<_i3.TextDirection>(
            name: 'layoutDirection',
            init: layoutDirection,
            isNamed: true,
          ),
          'color': _i2.BuilderArg<_i3.Color>(
            name: 'color',
            init: color,
            isNamed: true,
          ),
          'textStyle': _i2.BuilderArg<_i4.TextStyle>(
            name: 'textStyle',
            init: textStyle,
            isNamed: true,
          ),
        },
        super() {
    mateBuilderName = 'BannerPainter';
    matePackageUrl = 'package:flutter/cupertino.dart';
    mateBuilder = (p) => BannerPainter$Mate(
          message: p.get('message').build(),
          textDirection: p.get('textDirection').build(),
          location: p.get('location').build(),
          layoutDirection: p.get('layoutDirection').build(),
          color: p.get('color').build(),
          textStyle: p.get('textStyle').build(),
        );
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}

/// class Banner extends StatefulWidget
class Banner$Mate extends _i1.Banner with _i2.Mate {
  /// Banner Banner({Key? key, Widget? child, required String message, TextDirection? textDirection, required BannerLocation location, TextDirection? layoutDirection, Color color = _kColor, TextStyle textStyle = _kTextStyle})
  Banner$Mate({
    /// optionalParameters: {Key? key} , default:none
    super.key,

    /// optionalParameters: {Widget? child} , default:none
    super.child,

    /// optionalParameters: {required String message} , default:none
    required super.message,

    /// optionalParameters: {TextDirection? textDirection} , default:none
    super.textDirection,

    /// optionalParameters: {required BannerLocation location} , default:none
    required super.location,

    /// optionalParameters: {TextDirection? layoutDirection} , default:none
    super.layoutDirection,

    /// optionalParameters: {Color color = _kColor} , default:unprocessed=SimpleIdentifierImpl
    super.color,

    /// optionalParameters: {TextStyle textStyle = _kTextStyle} , default:unprocessed=SimpleIdentifierImpl
    super.textStyle,
  })  : mateParams = {
          'key': _i2.BuilderArg<_i5.Key?>(
            name: 'key',
            init: key,
            isNamed: true,
          ),
          'child': _i2.BuilderArg<_i6.Widget?>(
            name: 'child',
            init: child,
            isNamed: true,
          ),
          'message': _i2.BuilderArg<String>(
            name: 'message',
            init: message,
            isNamed: true,
          ),
          'textDirection': _i2.BuilderArg<_i3.TextDirection?>(
            name: 'textDirection',
            init: textDirection,
            isNamed: true,
          ),
          'location': _i2.BuilderArg<_i1.BannerLocation>(
            name: 'location',
            init: location,
            isNamed: true,
          ),
          'layoutDirection': _i2.BuilderArg<_i3.TextDirection?>(
            name: 'layoutDirection',
            init: layoutDirection,
            isNamed: true,
          ),
          'color': _i2.BuilderArg<_i3.Color>(
            name: 'color',
            init: color,
            isNamed: true,
          ),
          'textStyle': _i2.BuilderArg<_i4.TextStyle>(
            name: 'textStyle',
            init: textStyle,
            isNamed: true,
          ),
        },
        super() {
    mateBuilderName = 'Banner';
    matePackageUrl = 'package:flutter/cupertino.dart';
    mateBuilder = (p) => Banner$Mate(
          key: p.get('key').build(),
          child: p.get('child').build(),
          message: p.get('message').build(),
          textDirection: p.get('textDirection').build(),
          location: p.get('location').build(),
          layoutDirection: p.get('layoutDirection').build(),
          color: p.get('color').build(),
          textStyle: p.get('textStyle').build(),
        );
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}

/// class CheckedModeBanner extends StatelessWidget
class CheckedModeBanner$Mate extends _i1.CheckedModeBanner with _i2.Mate {
  /// CheckedModeBanner CheckedModeBanner({Key? key, required Widget child})
  CheckedModeBanner$Mate({
    /// optionalParameters: {Key? key} , default:none
    super.key,

    /// optionalParameters: {required Widget child} , default:none
    required super.child,
  })  : mateParams = {
          'key': _i2.BuilderArg<_i5.Key?>(
            name: 'key',
            init: key,
            isNamed: true,
          ),
          'child': _i2.BuilderArg<_i6.Widget>(
            name: 'child',
            init: child,
            isNamed: true,
          ),
        },
        super() {
    mateBuilderName = 'CheckedModeBanner';
    matePackageUrl = 'package:flutter/cupertino.dart';
    mateBuilder = (p) => CheckedModeBanner$Mate(
          key: p.get('key').build(),
          child: p.get('child').build(),
        );
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}
