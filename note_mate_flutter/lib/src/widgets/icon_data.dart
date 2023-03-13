// /// Generated by mate_flutter, please don't edit!

import 'package:flutter/src/widgets/icon_data.dart';
import 'dart:core';
import 'package:note/mate.dart';
import 'package:flutter/src/foundation/diagnostics.dart';

/// class IconData
class IconData$Mate extends IconData with Mate<IconData$Mate> {
  /// IconData IconData(int codePoint, {String? fontFamily, String? fontPackage, bool matchTextDirection = false})
  IconData$Mate(
    /// param: int codePoint
    int codePoint, {
    /// param: {String? fontFamily}
    String? fontFamily,

    /// param: {String? fontPackage}
    String? fontPackage,

    /// param: {bool matchTextDirection = false}
    required bool matchTextDirection,
  }) : super(
          codePoint,
          fontFamily: fontFamily,
          fontPackage: fontPackage,
          matchTextDirection: matchTextDirection,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => IconData$Mate(
        p.getValue('codePoint'),
        fontFamily: p.getValue('fontFamily'),
        fontPackage: p.getValue('fontPackage'),
        matchTextDirection: p.getValue('matchTextDirection'),
      ),
    );
    mateParams.set(name: 'codePoint', init: codePoint);
    mateParams.set(name: 'fontFamily', init: fontFamily);
    mateParams.set(name: 'fontPackage', init: fontPackage);
    mateParams.set(name: 'matchTextDirection', init: matchTextDirection);
  }
}

/// class IconDataProperty extends DiagnosticsProperty<IconData>
class IconDataProperty$Mate extends IconDataProperty with Mate<IconDataProperty$Mate> {
  /// IconDataProperty IconDataProperty(String name, IconData? value, {String? ifNull, bool showName = true, DiagnosticsTreeStyle style = DiagnosticsTreeStyle.singleLine, DiagnosticLevel level = DiagnosticLevel.info})
  IconDataProperty$Mate(
    /// param: String name
    String name,

    /// param: IconData? value
    IconData? value, {
    /// param: {String? ifNull}
    String? ifNull,

    /// param: {bool showName = true}
    required bool showName,

    /// param: {DiagnosticsTreeStyle style = DiagnosticsTreeStyle.singleLine}
    required DiagnosticsTreeStyle style,

    /// param: {DiagnosticLevel level = DiagnosticLevel.info}
    required DiagnosticLevel level,
  }) : super(
          name,
          value,
          ifNull: ifNull,
          showName: showName,
          style: style,
          level: level,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => IconDataProperty$Mate(
        p.getValue('name'),
        p.getValue('value'),
        ifNull: p.getValue('ifNull'),
        showName: p.getValue('showName'),
        style: p.getValue('style'),
        level: p.getValue('level'),
      ),
    );
    mateParams.set(name: 'name', init: name);
    mateParams.set(name: 'value', init: value);
    mateParams.set(name: 'ifNull', init: ifNull);
    mateParams.set(name: 'showName', init: showName);
    mateParams.set(name: 'style', init: style);
    mateParams.set(name: 'level', init: level);
  }
}