// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/cupertino/theme.dart';
import 'package:note/mate.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:ui';
import 'package:flutter/src/cupertino/text_theme.dart';
import 'dart:core';

/// class CupertinoTheme extends StatelessWidget
class CupertinoTheme$Mate extends CupertinoTheme with Mate {
  /// CupertinoTheme CupertinoTheme({Key? key, required CupertinoThemeData data, required Widget child})
  CupertinoTheme$Mate({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {required CupertinoThemeData data} , defaultValue:none
    required CupertinoThemeData data,

    /// optionalParameters: {required Widget child} , defaultValue:none
    required Widget child,
  }) : super(
          key: key,
          data: data,
          child: child,
        ) {
    mateCreateName = 'CupertinoTheme';
    matePackageUrl = 'package:flutter/cupertino.dart';
    mateBuilder = (p) => CupertinoTheme$Mate(
          key: p.get('key').build(),
          data: p.get('data').build(),
          child: p.get('child').build(),
        );
    mateUse('key', key, isNamed: true);
    mateUse('data', data, isNamed: true);
    mateUse('child', child, isNamed: true);
  }
}

/// class CupertinoThemeData extends NoDefaultCupertinoThemeData with Diagnosticable
class CupertinoThemeData$Mate extends CupertinoThemeData with Mate {
  /// CupertinoThemeData CupertinoThemeData({Brightness? brightness, Color? primaryColor, Color? primaryContrastingColor, CupertinoTextThemeData? textTheme, Color? barBackgroundColor, Color? scaffoldBackgroundColor, bool? applyThemeToAll})
  CupertinoThemeData$Mate({
    /// optionalParameters: {Brightness? brightness} , defaultValue:none
    Brightness? brightness,

    /// optionalParameters: {Color? primaryColor} , defaultValue:none
    Color? primaryColor,

    /// optionalParameters: {Color? primaryContrastingColor} , defaultValue:none
    Color? primaryContrastingColor,

    /// optionalParameters: {CupertinoTextThemeData? textTheme} , defaultValue:none
    CupertinoTextThemeData? textTheme,

    /// optionalParameters: {Color? barBackgroundColor} , defaultValue:none
    Color? barBackgroundColor,

    /// optionalParameters: {Color? scaffoldBackgroundColor} , defaultValue:none
    Color? scaffoldBackgroundColor,

    /// optionalParameters: {bool? applyThemeToAll} , defaultValue:none
    bool? applyThemeToAll,
  }) : super(
          brightness: brightness,
          primaryColor: primaryColor,
          primaryContrastingColor: primaryContrastingColor,
          textTheme: textTheme,
          barBackgroundColor: barBackgroundColor,
          scaffoldBackgroundColor: scaffoldBackgroundColor,
          applyThemeToAll: applyThemeToAll,
        ) {
    mateCreateName = 'CupertinoThemeData';
    matePackageUrl = 'package:flutter/cupertino.dart';
    mateBuilder = (p) => CupertinoThemeData$Mate(
          brightness: p.get('brightness').build(),
          primaryColor: p.get('primaryColor').build(),
          primaryContrastingColor: p.get('primaryContrastingColor').build(),
          textTheme: p.get('textTheme').build(),
          barBackgroundColor: p.get('barBackgroundColor').build(),
          scaffoldBackgroundColor: p.get('scaffoldBackgroundColor').build(),
          applyThemeToAll: p.get('applyThemeToAll').build(),
        );
    mateUse('brightness', brightness, isNamed: true);
    mateUse('primaryColor', primaryColor, isNamed: true);
    mateUse('primaryContrastingColor', primaryContrastingColor, isNamed: true);
    mateUse('textTheme', textTheme, isNamed: true);
    mateUse('barBackgroundColor', barBackgroundColor, isNamed: true);
    mateUse('scaffoldBackgroundColor', scaffoldBackgroundColor, isNamed: true);
    mateUse('applyThemeToAll', applyThemeToAll, isNamed: true);
  }

  /// CupertinoThemeData CupertinoThemeData.raw(Brightness? brightness, Color? primaryColor, Color? primaryContrastingColor, CupertinoTextThemeData? textTheme, Color? barBackgroundColor, Color? scaffoldBackgroundColor, bool? applyThemeToAll)
  CupertinoThemeData$Mate.raw(
    /// requiredParameters: Brightness? brightness
    Brightness? brightness,

    /// requiredParameters: Color? primaryColor
    Color? primaryColor,

    /// requiredParameters: Color? primaryContrastingColor
    Color? primaryContrastingColor,

    /// requiredParameters: CupertinoTextThemeData? textTheme
    CupertinoTextThemeData? textTheme,

    /// requiredParameters: Color? barBackgroundColor
    Color? barBackgroundColor,

    /// requiredParameters: Color? scaffoldBackgroundColor
    Color? scaffoldBackgroundColor,

    /// requiredParameters: bool? applyThemeToAll
    bool? applyThemeToAll,
  ) : super.raw(
          brightness,
          primaryColor,
          primaryContrastingColor,
          textTheme,
          barBackgroundColor,
          scaffoldBackgroundColor,
          applyThemeToAll,
        ) {
    mateCreateName = 'CupertinoThemeData.raw';
    matePackageUrl = 'package:flutter/cupertino.dart';
    mateBuilder = (p) => CupertinoThemeData$Mate.raw(
          p.get('brightness').value,
          p.get('primaryColor').value,
          p.get('primaryContrastingColor').value,
          p.get('textTheme').value,
          p.get('barBackgroundColor').value,
          p.get('scaffoldBackgroundColor').value,
          p.get('applyThemeToAll').value,
        );
    mateUse('brightness', brightness, isNamed: false);
    mateUse('primaryColor', primaryColor, isNamed: false);
    mateUse('primaryContrastingColor', primaryContrastingColor, isNamed: false);
    mateUse('textTheme', textTheme, isNamed: false);
    mateUse('barBackgroundColor', barBackgroundColor, isNamed: false);
    mateUse('scaffoldBackgroundColor', scaffoldBackgroundColor, isNamed: false);
    mateUse('applyThemeToAll', applyThemeToAll, isNamed: false);
  }
}

/// class NoDefaultCupertinoThemeData
class NoDefaultCupertinoThemeData$Mate extends NoDefaultCupertinoThemeData with Mate {
  /// NoDefaultCupertinoThemeData NoDefaultCupertinoThemeData({Brightness? brightness, Color? primaryColor, Color? primaryContrastingColor, CupertinoTextThemeData? textTheme, Color? barBackgroundColor, Color? scaffoldBackgroundColor, bool? applyThemeToAll})
  NoDefaultCupertinoThemeData$Mate({
    /// optionalParameters: {Brightness? brightness} , defaultValue:none
    Brightness? brightness,

    /// optionalParameters: {Color? primaryColor} , defaultValue:none
    Color? primaryColor,

    /// optionalParameters: {Color? primaryContrastingColor} , defaultValue:none
    Color? primaryContrastingColor,

    /// optionalParameters: {CupertinoTextThemeData? textTheme} , defaultValue:none
    CupertinoTextThemeData? textTheme,

    /// optionalParameters: {Color? barBackgroundColor} , defaultValue:none
    Color? barBackgroundColor,

    /// optionalParameters: {Color? scaffoldBackgroundColor} , defaultValue:none
    Color? scaffoldBackgroundColor,

    /// optionalParameters: {bool? applyThemeToAll} , defaultValue:none
    bool? applyThemeToAll,
  }) : super(
          brightness: brightness,
          primaryColor: primaryColor,
          primaryContrastingColor: primaryContrastingColor,
          textTheme: textTheme,
          barBackgroundColor: barBackgroundColor,
          scaffoldBackgroundColor: scaffoldBackgroundColor,
          applyThemeToAll: applyThemeToAll,
        ) {
    mateCreateName = 'NoDefaultCupertinoThemeData';
    matePackageUrl = 'package:flutter/cupertino.dart';
    mateBuilder = (p) => NoDefaultCupertinoThemeData$Mate(
          brightness: p.get('brightness').build(),
          primaryColor: p.get('primaryColor').build(),
          primaryContrastingColor: p.get('primaryContrastingColor').build(),
          textTheme: p.get('textTheme').build(),
          barBackgroundColor: p.get('barBackgroundColor').build(),
          scaffoldBackgroundColor: p.get('scaffoldBackgroundColor').build(),
          applyThemeToAll: p.get('applyThemeToAll').build(),
        );
    mateUse('brightness', brightness, isNamed: true);
    mateUse('primaryColor', primaryColor, isNamed: true);
    mateUse('primaryContrastingColor', primaryContrastingColor, isNamed: true);
    mateUse('textTheme', textTheme, isNamed: true);
    mateUse('barBackgroundColor', barBackgroundColor, isNamed: true);
    mateUse('scaffoldBackgroundColor', scaffoldBackgroundColor, isNamed: true);
    mateUse('applyThemeToAll', applyThemeToAll, isNamed: true);
  }
}
