// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/widgets/scrollbar.dart';
import 'package:note/mate.dart';
import 'dart:ui';
import 'package:flutter/src/animation/animation.dart';
import 'dart:core';
import 'package:flutter/src/painting/edge_insets.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/src/painting/borders.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/scroll_controller.dart';
import 'package:flutter/src/widgets/scroll_notification.dart';

/// class ScrollbarPainter extends ChangeNotifier implements CustomPainter
class ScrollbarPainter$Mate extends ScrollbarPainter with Mate {
  /// ScrollbarPainter ScrollbarPainter({required Color color, required Animation<double> fadeoutOpacityAnimation, Color trackColor = const Color(0x00000000), Color trackBorderColor = const Color(0x00000000), TextDirection? textDirection, double thickness = _kScrollbarThickness, EdgeInsets padding = EdgeInsets.zero, double mainAxisMargin = 0.0, double crossAxisMargin = 0.0, Radius? radius, Radius? trackRadius, OutlinedBorder? shape, double minLength = _kMinThumbExtent, double? minOverscrollLength, ScrollbarOrientation? scrollbarOrientation, bool ignorePointer = false})
  ScrollbarPainter$Mate({
    /// optionalParameters: {required Color color} , defaultValue:none
    required Color color,

    /// optionalParameters: {required Animation<double> fadeoutOpacityAnimation} , defaultValue:none
    required Animation<double> fadeoutOpacityAnimation,

    /// optionalParameters: {Color trackColor = const Color(0x00000000)} , defaultValue:unprocessed
    required Color trackColor,

    /// optionalParameters: {Color trackBorderColor = const Color(0x00000000)} , defaultValue:unprocessed
    required Color trackBorderColor,

    /// optionalParameters: {TextDirection? textDirection} , defaultValue:none
    TextDirection? textDirection,

    /// optionalParameters: {double thickness = _kScrollbarThickness} , defaultValue:unprocessed
    required double thickness,

    /// optionalParameters: {EdgeInsets padding = EdgeInsets.zero} , defaultValue:PrefixedIdentifier
    EdgeInsets padding = EdgeInsets.zero,

    /// optionalParameters: {double mainAxisMargin = 0.0} , defaultValue:Literal
    double mainAxisMargin = 0.0,

    /// optionalParameters: {double crossAxisMargin = 0.0} , defaultValue:Literal
    double crossAxisMargin = 0.0,

    /// optionalParameters: {Radius? radius} , defaultValue:none
    Radius? radius,

    /// optionalParameters: {Radius? trackRadius} , defaultValue:none
    Radius? trackRadius,

    /// optionalParameters: {OutlinedBorder? shape} , defaultValue:none
    OutlinedBorder? shape,

    /// optionalParameters: {double minLength = _kMinThumbExtent} , defaultValue:unprocessed
    required double minLength,

    /// optionalParameters: {double? minOverscrollLength} , defaultValue:none
    double? minOverscrollLength,

    /// optionalParameters: {ScrollbarOrientation? scrollbarOrientation} , defaultValue:none
    ScrollbarOrientation? scrollbarOrientation,

    /// optionalParameters: {bool ignorePointer = false} , defaultValue:Literal
    bool ignorePointer = false,
  }) : super(
          color: color,
          fadeoutOpacityAnimation: fadeoutOpacityAnimation,
          trackColor: trackColor,
          trackBorderColor: trackBorderColor,
          textDirection: textDirection,
          thickness: thickness,
          padding: padding,
          mainAxisMargin: mainAxisMargin,
          crossAxisMargin: crossAxisMargin,
          radius: radius,
          trackRadius: trackRadius,
          shape: shape,
          minLength: minLength,
          minOverscrollLength: minOverscrollLength,
          scrollbarOrientation: scrollbarOrientation,
          ignorePointer: ignorePointer,
        ) {
    mateCreateName = 'ScrollbarPainter';
    matePackageUrl = 'package:flutter/widgets.dart';
    mateBuilder = (p) => ScrollbarPainter$Mate(
          color: p.get('color').build(),
          fadeoutOpacityAnimation: p.get('fadeoutOpacityAnimation').build(),
          trackColor: p.get('trackColor').build(),
          trackBorderColor: p.get('trackBorderColor').build(),
          textDirection: p.get('textDirection').build(),
          thickness: p.get('thickness').build(),
          padding: p.get('padding').build(),
          mainAxisMargin: p.get('mainAxisMargin').build(),
          crossAxisMargin: p.get('crossAxisMargin').build(),
          radius: p.get('radius').build(),
          trackRadius: p.get('trackRadius').build(),
          shape: p.get('shape').build(),
          minLength: p.get('minLength').build(),
          minOverscrollLength: p.get('minOverscrollLength').build(),
          scrollbarOrientation: p.get('scrollbarOrientation').build(),
          ignorePointer: p.get('ignorePointer').build(),
        );
    mateUse('color', color, isNamed: true);
    mateUse('fadeoutOpacityAnimation', fadeoutOpacityAnimation, isNamed: true);
    mateUse('trackColor', trackColor, isNamed: true);
    mateUse('trackBorderColor', trackBorderColor, isNamed: true);
    mateUse('textDirection', textDirection, isNamed: true);
    mateUse('thickness', thickness, isNamed: true);
    mateUse('padding', padding, isNamed: true);
    mateUse('mainAxisMargin', mainAxisMargin, isNamed: true);
    mateUse('crossAxisMargin', crossAxisMargin, isNamed: true);
    mateUse('radius', radius, isNamed: true);
    mateUse('trackRadius', trackRadius, isNamed: true);
    mateUse('shape', shape, isNamed: true);
    mateUse('minLength', minLength, isNamed: true);
    mateUse('minOverscrollLength', minOverscrollLength, isNamed: true);
    mateUse('scrollbarOrientation', scrollbarOrientation, isNamed: true);
    mateUse('ignorePointer', ignorePointer, isNamed: true);
  }
}

/// class RawScrollbar extends StatefulWidget
class RawScrollbar$Mate extends RawScrollbar with Mate {
  /// RawScrollbar RawScrollbar({Key? key, required Widget child, ScrollController? controller, bool? thumbVisibility, OutlinedBorder? shape, Radius? radius, double? thickness, Color? thumbColor, double minThumbLength = _kMinThumbExtent, double? minOverscrollLength, bool? trackVisibility, Radius? trackRadius, Color? trackColor, Color? trackBorderColor, Duration fadeDuration = _kScrollbarFadeDuration, Duration timeToFade = _kScrollbarTimeToFade, Duration pressDuration = Duration.zero, bool Function(ScrollNotification) notificationPredicate = defaultScrollNotificationPredicate, bool? interactive, ScrollbarOrientation? scrollbarOrientation, double mainAxisMargin = 0.0, double crossAxisMargin = 0.0, EdgeInsets? padding, bool? isAlwaysShown})
  RawScrollbar$Mate({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {required Widget child} , defaultValue:none
    required Widget child,

    /// optionalParameters: {ScrollController? controller} , defaultValue:none
    ScrollController? controller,

    /// optionalParameters: {bool? thumbVisibility} , defaultValue:none
    bool? thumbVisibility,

    /// optionalParameters: {OutlinedBorder? shape} , defaultValue:none
    OutlinedBorder? shape,

    /// optionalParameters: {Radius? radius} , defaultValue:none
    Radius? radius,

    /// optionalParameters: {double? thickness} , defaultValue:none
    double? thickness,

    /// optionalParameters: {Color? thumbColor} , defaultValue:none
    Color? thumbColor,

    /// optionalParameters: {double minThumbLength = _kMinThumbExtent} , defaultValue:unprocessed
    required double minThumbLength,

    /// optionalParameters: {double? minOverscrollLength} , defaultValue:none
    double? minOverscrollLength,

    /// optionalParameters: {bool? trackVisibility} , defaultValue:none
    bool? trackVisibility,

    /// optionalParameters: {Radius? trackRadius} , defaultValue:none
    Radius? trackRadius,

    /// optionalParameters: {Color? trackColor} , defaultValue:none
    Color? trackColor,

    /// optionalParameters: {Color? trackBorderColor} , defaultValue:none
    Color? trackBorderColor,

    /// optionalParameters: {Duration fadeDuration = _kScrollbarFadeDuration} , defaultValue:unprocessed
    required Duration fadeDuration,

    /// optionalParameters: {Duration timeToFade = _kScrollbarTimeToFade} , defaultValue:unprocessed
    required Duration timeToFade,

    /// optionalParameters: {Duration pressDuration = Duration.zero} , defaultValue:PrefixedIdentifier
    Duration pressDuration = Duration.zero,

    /// optionalParameters: {bool Function(ScrollNotification) notificationPredicate = defaultScrollNotificationPredicate} , defaultValue:unprocessed
    required ScrollNotificationPredicate notificationPredicate,

    /// optionalParameters: {bool? interactive} , defaultValue:none
    bool? interactive,

    /// optionalParameters: {ScrollbarOrientation? scrollbarOrientation} , defaultValue:none
    ScrollbarOrientation? scrollbarOrientation,

    /// optionalParameters: {double mainAxisMargin = 0.0} , defaultValue:Literal
    double mainAxisMargin = 0.0,

    /// optionalParameters: {double crossAxisMargin = 0.0} , defaultValue:Literal
    double crossAxisMargin = 0.0,

    /// optionalParameters: {EdgeInsets? padding} , defaultValue:none
    EdgeInsets? padding,
  }) : super(
          key: key,
          child: child,
          controller: controller,
          thumbVisibility: thumbVisibility,
          shape: shape,
          radius: radius,
          thickness: thickness,
          thumbColor: thumbColor,
          minThumbLength: minThumbLength,
          minOverscrollLength: minOverscrollLength,
          trackVisibility: trackVisibility,
          trackRadius: trackRadius,
          trackColor: trackColor,
          trackBorderColor: trackBorderColor,
          fadeDuration: fadeDuration,
          timeToFade: timeToFade,
          pressDuration: pressDuration,
          notificationPredicate: notificationPredicate,
          interactive: interactive,
          scrollbarOrientation: scrollbarOrientation,
          mainAxisMargin: mainAxisMargin,
          crossAxisMargin: crossAxisMargin,
          padding: padding,
        ) {
    mateCreateName = 'RawScrollbar';
    matePackageUrl = 'package:flutter/widgets.dart';
    mateBuilder = (p) => RawScrollbar$Mate(
          key: p.get('key').build(),
          child: p.get('child').build(),
          controller: p.get('controller').build(),
          thumbVisibility: p.get('thumbVisibility').build(),
          shape: p.get('shape').build(),
          radius: p.get('radius').build(),
          thickness: p.get('thickness').build(),
          thumbColor: p.get('thumbColor').build(),
          minThumbLength: p.get('minThumbLength').build(),
          minOverscrollLength: p.get('minOverscrollLength').build(),
          trackVisibility: p.get('trackVisibility').build(),
          trackRadius: p.get('trackRadius').build(),
          trackColor: p.get('trackColor').build(),
          trackBorderColor: p.get('trackBorderColor').build(),
          fadeDuration: p.get('fadeDuration').build(),
          timeToFade: p.get('timeToFade').build(),
          pressDuration: p.get('pressDuration').build(),
          notificationPredicate: p.get('notificationPredicate').build(),
          interactive: p.get('interactive').build(),
          scrollbarOrientation: p.get('scrollbarOrientation').build(),
          mainAxisMargin: p.get('mainAxisMargin').build(),
          crossAxisMargin: p.get('crossAxisMargin').build(),
          padding: p.get('padding').build(),
        );
    mateUse('key', key, isNamed: true);
    mateUse('child', child, isNamed: true);
    mateUse('controller', controller, isNamed: true);
    mateUse('thumbVisibility', thumbVisibility, isNamed: true);
    mateUse('shape', shape, isNamed: true);
    mateUse('radius', radius, isNamed: true);
    mateUse('thickness', thickness, isNamed: true);
    mateUse('thumbColor', thumbColor, isNamed: true);
    mateUse('minThumbLength', minThumbLength, isNamed: true);
    mateUse('minOverscrollLength', minOverscrollLength, isNamed: true);
    mateUse('trackVisibility', trackVisibility, isNamed: true);
    mateUse('trackRadius', trackRadius, isNamed: true);
    mateUse('trackColor', trackColor, isNamed: true);
    mateUse('trackBorderColor', trackBorderColor, isNamed: true);
    mateUse('fadeDuration', fadeDuration, isNamed: true);
    mateUse('timeToFade', timeToFade, isNamed: true);
    mateUse('pressDuration', pressDuration, isNamed: true);
    mateUse('notificationPredicate', notificationPredicate, isNamed: true);
    mateUse('interactive', interactive, isNamed: true);
    mateUse('scrollbarOrientation', scrollbarOrientation, isNamed: true);
    mateUse('mainAxisMargin', mainAxisMargin, isNamed: true);
    mateUse('crossAxisMargin', crossAxisMargin, isNamed: true);
    mateUse('padding', padding, isNamed: true);
  }
}
