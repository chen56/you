// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/material/page_transitions_theme.dart';
import 'package:note/mate.dart';
import 'dart:core';
import 'package:flutter/src/foundation/platform.dart';

/// class ZoomPageTransitionsBuilder extends PageTransitionsBuilder
class ZoomPageTransitionsBuilder$Mate extends ZoomPageTransitionsBuilder with Mate {
  /// ZoomPageTransitionsBuilder ZoomPageTransitionsBuilder({bool allowEnterRouteSnapshotting = true})
  ZoomPageTransitionsBuilder$Mate(
      {
      /// optionalParameters: {bool allowEnterRouteSnapshotting = true} , defaultValue:Literal
      bool allowEnterRouteSnapshotting = true})
      : super(allowEnterRouteSnapshotting: allowEnterRouteSnapshotting) {
    mateCreateName = 'ZoomPageTransitionsBuilder';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) =>
        ZoomPageTransitionsBuilder$Mate(allowEnterRouteSnapshotting: p.get('allowEnterRouteSnapshotting').build());
    mateUse('allowEnterRouteSnapshotting', allowEnterRouteSnapshotting, isNamed: true);
  }
}

/// class PageTransitionsTheme with Diagnosticable
class PageTransitionsTheme$Mate extends PageTransitionsTheme with Mate {
  /// PageTransitionsTheme PageTransitionsTheme({Map<TargetPlatform, PageTransitionsBuilder> builders = _defaultBuilders})
  PageTransitionsTheme$Mate(
      {
      /// optionalParameters: {Map<TargetPlatform, PageTransitionsBuilder> builders = _defaultBuilders} , defaultValue:unprocessed
      required Map<TargetPlatform, PageTransitionsBuilder> builders})
      : super(builders: builders) {
    mateCreateName = 'PageTransitionsTheme';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => PageTransitionsTheme$Mate(builders: p.get('builders').build());
    mateUse('builders', builders, isNamed: true);
  }
}
