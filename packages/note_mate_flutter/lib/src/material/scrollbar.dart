// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/material/scrollbar.dart';
import 'package:note/mate.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/scroll_controller.dart';
import 'dart:core';
import 'dart:ui';
import 'package:flutter/src/widgets/scroll_notification.dart';
import 'package:flutter/src/widgets/scrollbar.dart';

/// class Scrollbar extends StatelessWidget
class Scrollbar$Mate extends Scrollbar with Mate {
  /// Scrollbar Scrollbar({Key? key, required Widget child, ScrollController? controller, bool? thumbVisibility, bool? trackVisibility, double? thickness, Radius? radius, bool Function(ScrollNotification)? notificationPredicate, bool? interactive, ScrollbarOrientation? scrollbarOrientation, bool? isAlwaysShown, bool? showTrackOnHover, double? hoverThickness})
  Scrollbar$Mate({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {required Widget child} , defaultValue:none
    required Widget child,

    /// optionalParameters: {ScrollController? controller} , defaultValue:none
    ScrollController? controller,

    /// optionalParameters: {bool? thumbVisibility} , defaultValue:none
    bool? thumbVisibility,

    /// optionalParameters: {bool? trackVisibility} , defaultValue:none
    bool? trackVisibility,

    /// optionalParameters: {double? thickness} , defaultValue:none
    double? thickness,

    /// optionalParameters: {Radius? radius} , defaultValue:none
    Radius? radius,

    /// optionalParameters: {bool Function(ScrollNotification)? notificationPredicate} , defaultValue:none
    ScrollNotificationPredicate? notificationPredicate,

    /// optionalParameters: {bool? interactive} , defaultValue:none
    bool? interactive,

    /// optionalParameters: {ScrollbarOrientation? scrollbarOrientation} , defaultValue:none
    ScrollbarOrientation? scrollbarOrientation,
  }) : super(
          key: key,
          child: child,
          controller: controller,
          thumbVisibility: thumbVisibility,
          trackVisibility: trackVisibility,
          thickness: thickness,
          radius: radius,
          notificationPredicate: notificationPredicate,
          interactive: interactive,
          scrollbarOrientation: scrollbarOrientation,
        ) {
    mateCreateName = 'Scrollbar';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => Scrollbar$Mate(
          key: p.get('key').build(),
          child: p.get('child').build(),
          controller: p.get('controller').build(),
          thumbVisibility: p.get('thumbVisibility').build(),
          trackVisibility: p.get('trackVisibility').build(),
          thickness: p.get('thickness').build(),
          radius: p.get('radius').build(),
          notificationPredicate: p.get('notificationPredicate').build(),
          interactive: p.get('interactive').build(),
          scrollbarOrientation: p.get('scrollbarOrientation').build(),
        );
    mateUse('key', key);
    mateUse('child', child);
    mateUse('controller', controller);
    mateUse('thumbVisibility', thumbVisibility);
    mateUse('trackVisibility', trackVisibility);
    mateUse('thickness', thickness);
    mateUse('radius', radius);
    mateUse('notificationPredicate', notificationPredicate);
    mateUse('interactive', interactive);
    mateUse('scrollbarOrientation', scrollbarOrientation);
  }
}
