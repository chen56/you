// /// Generated by gen_maters.dart, please don't edit!

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/src/material/tooltip_theme.dart' as _i1;
import 'package:mate/mate_core.dart' as _i2;
import 'package:flutter/src/painting/edge_insets.dart' as _i3;
import 'package:flutter/src/painting/decoration.dart' as _i4;
import 'package:flutter/src/painting/text_style.dart' as _i5;
import 'dart:ui' as _i6;
import 'package:flutter/src/foundation/key.dart' as _i7;
import 'package:flutter/src/widgets/framework.dart' as _i8;

/// class TooltipThemeData with Diagnosticable
class TooltipThemeData$Mate extends _i1.TooltipThemeData with _i2.Mate {
  /// TooltipThemeData TooltipThemeData({double? height, EdgeInsetsGeometry? padding, EdgeInsetsGeometry? margin, double? verticalOffset, bool? preferBelow, bool? excludeFromSemantics, Decoration? decoration, TextStyle? textStyle, TextAlign? textAlign, Duration? waitDuration, Duration? showDuration, Duration? exitDuration, TooltipTriggerMode? triggerMode, bool? enableFeedback})
  TooltipThemeData$Mate({
    /// optionalParameters: {double? height} , default:none
    super.height,

    /// optionalParameters: {EdgeInsetsGeometry? padding} , default:none
    super.padding,

    /// optionalParameters: {EdgeInsetsGeometry? margin} , default:none
    super.margin,

    /// optionalParameters: {double? verticalOffset} , default:none
    super.verticalOffset,

    /// optionalParameters: {bool? preferBelow} , default:none
    super.preferBelow,

    /// optionalParameters: {bool? excludeFromSemantics} , default:none
    super.excludeFromSemantics,

    /// optionalParameters: {Decoration? decoration} , default:none
    super.decoration,

    /// optionalParameters: {TextStyle? textStyle} , default:none
    super.textStyle,

    /// optionalParameters: {TextAlign? textAlign} , default:none
    super.textAlign,

    /// optionalParameters: {Duration? waitDuration} , default:none
    super.waitDuration,

    /// optionalParameters: {Duration? showDuration} , default:none
    super.showDuration,

    /// optionalParameters: {Duration? exitDuration} , default:none
    super.exitDuration,

    /// optionalParameters: {TooltipTriggerMode? triggerMode} , default:none
    super.triggerMode,

    /// optionalParameters: {bool? enableFeedback} , default:none
    super.enableFeedback,
  })  : mateParams = {
          'height': _i2.BuilderArg<double?>(
            name: 'height',
            init: height,
            isNamed: true,
          ),
          'padding': _i2.BuilderArg<_i3.EdgeInsetsGeometry?>(
            name: 'padding',
            init: padding,
            isNamed: true,
          ),
          'margin': _i2.BuilderArg<_i3.EdgeInsetsGeometry?>(
            name: 'margin',
            init: margin,
            isNamed: true,
          ),
          'verticalOffset': _i2.BuilderArg<double?>(
            name: 'verticalOffset',
            init: verticalOffset,
            isNamed: true,
          ),
          'preferBelow': _i2.BuilderArg<bool?>(
            name: 'preferBelow',
            init: preferBelow,
            isNamed: true,
          ),
          'excludeFromSemantics': _i2.BuilderArg<bool?>(
            name: 'excludeFromSemantics',
            init: excludeFromSemantics,
            isNamed: true,
          ),
          'decoration': _i2.BuilderArg<_i4.Decoration?>(
            name: 'decoration',
            init: decoration,
            isNamed: true,
          ),
          'textStyle': _i2.BuilderArg<_i5.TextStyle?>(
            name: 'textStyle',
            init: textStyle,
            isNamed: true,
          ),
          'textAlign': _i2.BuilderArg<_i6.TextAlign?>(
            name: 'textAlign',
            init: textAlign,
            isNamed: true,
          ),
          'waitDuration': _i2.BuilderArg<Duration?>(
            name: 'waitDuration',
            init: waitDuration,
            isNamed: true,
          ),
          'showDuration': _i2.BuilderArg<Duration?>(
            name: 'showDuration',
            init: showDuration,
            isNamed: true,
          ),
          'exitDuration': _i2.BuilderArg<Duration?>(
            name: 'exitDuration',
            init: exitDuration,
            isNamed: true,
          ),
          'triggerMode': _i2.BuilderArg<_i1.TooltipTriggerMode?>(
            name: 'triggerMode',
            init: triggerMode,
            isNamed: true,
          ),
          'enableFeedback': _i2.BuilderArg<bool?>(
            name: 'enableFeedback',
            init: enableFeedback,
            isNamed: true,
          ),
        },
        super() {
    mateBuilderName = 'TooltipThemeData';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => TooltipThemeData$Mate(
          height: p.get('height').build(),
          padding: p.get('padding').build(),
          margin: p.get('margin').build(),
          verticalOffset: p.get('verticalOffset').build(),
          preferBelow: p.get('preferBelow').build(),
          excludeFromSemantics: p.get('excludeFromSemantics').build(),
          decoration: p.get('decoration').build(),
          textStyle: p.get('textStyle').build(),
          textAlign: p.get('textAlign').build(),
          waitDuration: p.get('waitDuration').build(),
          showDuration: p.get('showDuration').build(),
          exitDuration: p.get('exitDuration').build(),
          triggerMode: p.get('triggerMode').build(),
          enableFeedback: p.get('enableFeedback').build(),
        );
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}

/// class TooltipTheme extends InheritedTheme
class TooltipTheme$Mate extends _i1.TooltipTheme with _i2.Mate {
  /// TooltipTheme TooltipTheme({Key? key, required TooltipThemeData data, required Widget child})
  TooltipTheme$Mate({
    /// optionalParameters: {Key? key} , default:none
    super.key,

    /// optionalParameters: {required TooltipThemeData data} , default:none
    required super.data,

    /// optionalParameters: {required Widget child} , default:none
    required super.child,
  })  : mateParams = {
          'key': _i2.BuilderArg<_i7.Key?>(
            name: 'key',
            init: key,
            isNamed: true,
          ),
          'data': _i2.BuilderArg<_i1.TooltipThemeData>(
            name: 'data',
            init: data,
            isNamed: true,
          ),
          'child': _i2.BuilderArg<_i8.Widget>(
            name: 'child',
            init: child,
            isNamed: true,
          ),
        },
        super() {
    mateBuilderName = 'TooltipTheme';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => TooltipTheme$Mate(
          key: p.get('key').build(),
          data: p.get('data').build(),
          child: p.get('child').build(),
        );
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}
