// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/material/refresh_indicator.dart';
import 'package:note/mate.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:core';
import 'dart:ui';
import 'package:flutter/src/widgets/scroll_notification.dart';
import 'package:flutter/material.dart';

/// class RefreshIndicator extends StatefulWidget
class RefreshIndicator$Mate extends RefreshIndicator with Mate {
  /// RefreshIndicator RefreshIndicator({Key? key, required Widget child, double displacement = 40.0, double edgeOffset = 0.0, required Future<void> Function() onRefresh, Color? color, Color? backgroundColor, bool Function(ScrollNotification) notificationPredicate = defaultScrollNotificationPredicate, String? semanticsLabel, String? semanticsValue, double strokeWidth = RefreshProgressIndicator.defaultStrokeWidth, RefreshIndicatorTriggerMode triggerMode = RefreshIndicatorTriggerMode.onEdge})
  RefreshIndicator$Mate({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {required Widget child} , defaultValue:none
    required Widget child,

    /// optionalParameters: {double displacement = 40.0} , defaultValue:Literal
    double displacement = 40.0,

    /// optionalParameters: {double edgeOffset = 0.0} , defaultValue:Literal
    double edgeOffset = 0.0,

    /// optionalParameters: {required Future<void> Function() onRefresh} , defaultValue:none
    required RefreshCallback onRefresh,

    /// optionalParameters: {Color? color} , defaultValue:none
    Color? color,

    /// optionalParameters: {Color? backgroundColor} , defaultValue:none
    Color? backgroundColor,

    /// optionalParameters: {bool Function(ScrollNotification) notificationPredicate = defaultScrollNotificationPredicate} , defaultValue:unprocessed
    required ScrollNotificationPredicate notificationPredicate,

    /// optionalParameters: {String? semanticsLabel} , defaultValue:none
    String? semanticsLabel,

    /// optionalParameters: {String? semanticsValue} , defaultValue:none
    String? semanticsValue,

    /// optionalParameters: {double strokeWidth = RefreshProgressIndicator.defaultStrokeWidth} , defaultValue:PrefixedIdentifier
    double strokeWidth = RefreshProgressIndicator.defaultStrokeWidth,

    /// optionalParameters: {RefreshIndicatorTriggerMode triggerMode = RefreshIndicatorTriggerMode.onEdge} , defaultValue:PrefixedIdentifier
    RefreshIndicatorTriggerMode triggerMode = RefreshIndicatorTriggerMode.onEdge,
  }) : super(
          key: key,
          child: child,
          displacement: displacement,
          edgeOffset: edgeOffset,
          onRefresh: onRefresh,
          color: color,
          backgroundColor: backgroundColor,
          notificationPredicate: notificationPredicate,
          semanticsLabel: semanticsLabel,
          semanticsValue: semanticsValue,
          strokeWidth: strokeWidth,
          triggerMode: triggerMode,
        ) {
    mateCreateName = 'RefreshIndicator';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => RefreshIndicator$Mate(
          key: p.get('key').build(),
          child: p.get('child').build(),
          displacement: p.get('displacement').build(),
          edgeOffset: p.get('edgeOffset').build(),
          onRefresh: p.get('onRefresh').build(),
          color: p.get('color').build(),
          backgroundColor: p.get('backgroundColor').build(),
          notificationPredicate: p.get('notificationPredicate').build(),
          semanticsLabel: p.get('semanticsLabel').build(),
          semanticsValue: p.get('semanticsValue').build(),
          strokeWidth: p.get('strokeWidth').build(),
          triggerMode: p.get('triggerMode').build(),
        );
    mateUse('key', key, isNamed: true);
    mateUse('child', child, isNamed: true);
    mateUse('displacement', displacement, isNamed: true);
    mateUse('edgeOffset', edgeOffset, isNamed: true);
    mateUse('onRefresh', onRefresh, isNamed: true);
    mateUse('color', color, isNamed: true);
    mateUse('backgroundColor', backgroundColor, isNamed: true);
    mateUse('notificationPredicate', notificationPredicate, isNamed: true);
    mateUse('semanticsLabel', semanticsLabel, isNamed: true);
    mateUse('semanticsValue', semanticsValue, isNamed: true);
    mateUse('strokeWidth', strokeWidth, isNamed: true);
    mateUse('triggerMode', triggerMode, isNamed: true);
  }

  /// RefreshIndicator RefreshIndicator.adaptive({Key? key, required Widget child, double displacement = 40.0, double edgeOffset = 0.0, required Future<void> Function() onRefresh, Color? color, Color? backgroundColor, bool Function(ScrollNotification) notificationPredicate = defaultScrollNotificationPredicate, String? semanticsLabel, String? semanticsValue, double strokeWidth = RefreshProgressIndicator.defaultStrokeWidth, RefreshIndicatorTriggerMode triggerMode = RefreshIndicatorTriggerMode.onEdge})
  RefreshIndicator$Mate.adaptive({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {required Widget child} , defaultValue:none
    required Widget child,

    /// optionalParameters: {double displacement = 40.0} , defaultValue:Literal
    double displacement = 40.0,

    /// optionalParameters: {double edgeOffset = 0.0} , defaultValue:Literal
    double edgeOffset = 0.0,

    /// optionalParameters: {required Future<void> Function() onRefresh} , defaultValue:none
    required RefreshCallback onRefresh,

    /// optionalParameters: {Color? color} , defaultValue:none
    Color? color,

    /// optionalParameters: {Color? backgroundColor} , defaultValue:none
    Color? backgroundColor,

    /// optionalParameters: {bool Function(ScrollNotification) notificationPredicate = defaultScrollNotificationPredicate} , defaultValue:unprocessed
    required ScrollNotificationPredicate notificationPredicate,

    /// optionalParameters: {String? semanticsLabel} , defaultValue:none
    String? semanticsLabel,

    /// optionalParameters: {String? semanticsValue} , defaultValue:none
    String? semanticsValue,

    /// optionalParameters: {double strokeWidth = RefreshProgressIndicator.defaultStrokeWidth} , defaultValue:PrefixedIdentifier
    double strokeWidth = RefreshProgressIndicator.defaultStrokeWidth,

    /// optionalParameters: {RefreshIndicatorTriggerMode triggerMode = RefreshIndicatorTriggerMode.onEdge} , defaultValue:PrefixedIdentifier
    RefreshIndicatorTriggerMode triggerMode = RefreshIndicatorTriggerMode.onEdge,
  }) : super.adaptive(
          key: key,
          child: child,
          displacement: displacement,
          edgeOffset: edgeOffset,
          onRefresh: onRefresh,
          color: color,
          backgroundColor: backgroundColor,
          notificationPredicate: notificationPredicate,
          semanticsLabel: semanticsLabel,
          semanticsValue: semanticsValue,
          strokeWidth: strokeWidth,
          triggerMode: triggerMode,
        ) {
    mateCreateName = 'RefreshIndicator.adaptive';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => RefreshIndicator$Mate.adaptive(
          key: p.get('key').build(),
          child: p.get('child').build(),
          displacement: p.get('displacement').build(),
          edgeOffset: p.get('edgeOffset').build(),
          onRefresh: p.get('onRefresh').build(),
          color: p.get('color').build(),
          backgroundColor: p.get('backgroundColor').build(),
          notificationPredicate: p.get('notificationPredicate').build(),
          semanticsLabel: p.get('semanticsLabel').build(),
          semanticsValue: p.get('semanticsValue').build(),
          strokeWidth: p.get('strokeWidth').build(),
          triggerMode: p.get('triggerMode').build(),
        );
    mateUse('key', key, isNamed: true);
    mateUse('child', child, isNamed: true);
    mateUse('displacement', displacement, isNamed: true);
    mateUse('edgeOffset', edgeOffset, isNamed: true);
    mateUse('onRefresh', onRefresh, isNamed: true);
    mateUse('color', color, isNamed: true);
    mateUse('backgroundColor', backgroundColor, isNamed: true);
    mateUse('notificationPredicate', notificationPredicate, isNamed: true);
    mateUse('semanticsLabel', semanticsLabel, isNamed: true);
    mateUse('semanticsValue', semanticsValue, isNamed: true);
    mateUse('strokeWidth', strokeWidth, isNamed: true);
    mateUse('triggerMode', triggerMode, isNamed: true);
  }
}
