// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/widgets/text.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/painting/text_style.dart';
import 'dart:ui';
import 'dart:core';
import 'package:flutter/src/painting/text_painter.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:note/mate.dart';
import 'package:flutter/src/painting/strut_style.dart';
import 'package:flutter/src/painting/inline_span.dart';

/// class DefaultTextStyle extends InheritedTheme
class DefaultTextStyle$Mate extends DefaultTextStyle with WidgetMate<DefaultTextStyle$Mate> {
  /// DefaultTextStyle DefaultTextStyle({Key? key, required TextStyle style, TextAlign? textAlign, bool softWrap = true, TextOverflow overflow = TextOverflow.clip, int? maxLines, TextWidthBasis textWidthBasis = TextWidthBasis.parent, TextHeightBehavior? textHeightBehavior, required Widget child})
  DefaultTextStyle$Mate({
    /// optionalParameters: {Key? key} , hasDefaultValue:false, defaultValueCode:null
    Key? key,

    /// optionalParameters: {required TextStyle style} , hasDefaultValue:false, defaultValueCode:null
    required TextStyle style,

    /// optionalParameters: {TextAlign? textAlign} , hasDefaultValue:false, defaultValueCode:null
    TextAlign? textAlign,

    /// optionalParameters: {bool softWrap = true} , hasDefaultValue:true, defaultValueCode:true
    required bool softWrap,

    /// optionalParameters: {TextOverflow overflow = TextOverflow.clip} , hasDefaultValue:true, defaultValueCode:TextOverflow.clip
    required TextOverflow overflow,

    /// optionalParameters: {int? maxLines} , hasDefaultValue:false, defaultValueCode:null
    int? maxLines,

    /// optionalParameters: {TextWidthBasis textWidthBasis = TextWidthBasis.parent} , hasDefaultValue:true, defaultValueCode:TextWidthBasis.parent
    required TextWidthBasis textWidthBasis,

    /// optionalParameters: {TextHeightBehavior? textHeightBehavior} , hasDefaultValue:false, defaultValueCode:null
    TextHeightBehavior? textHeightBehavior,

    /// optionalParameters: {required Widget child} , hasDefaultValue:false, defaultValueCode:null
    required Widget child,
  }) : super(
          key: key,
          style: style,
          textAlign: textAlign,
          softWrap: softWrap,
          overflow: overflow,
          maxLines: maxLines,
          textWidthBasis: textWidthBasis,
          textHeightBehavior: textHeightBehavior,
          child: child,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => DefaultTextStyle$Mate(
        key: p.getValue('key'),
        style: p.getValue('style'),
        textAlign: p.getValue('textAlign'),
        softWrap: p.getValue('softWrap'),
        overflow: p.getValue('overflow'),
        maxLines: p.getValue('maxLines'),
        textWidthBasis: p.getValue('textWidthBasis'),
        textHeightBehavior: p.getValue('textHeightBehavior'),
        child: p.getValue('child'),
      ),
    );
    mateParams.set(name: 'key', init: key);
    mateParams.set(name: 'style', init: style);
    mateParams.set(name: 'textAlign', init: textAlign);
    mateParams.set(name: 'softWrap', init: softWrap);
    mateParams.set(name: 'overflow', init: overflow);
    mateParams.set(name: 'maxLines', init: maxLines);
    mateParams.set(name: 'textWidthBasis', init: textWidthBasis);
    mateParams.set(name: 'textHeightBehavior', init: textHeightBehavior);
    mateParams.set(name: 'child', init: child);
  }

  /// DefaultTextStyle DefaultTextStyle.fallback({Key? key})
  DefaultTextStyle$Mate.fallback(
      {
      /// optionalParameters: {Key? key} , hasDefaultValue:false, defaultValueCode:null
      Key? key})
      : super.fallback(key: key) {
    mateParams = Params(
      init: this,
      builder: (p) => DefaultTextStyle$Mate.fallback(key: p.getValue('key')),
    );
    mateParams.set(name: 'key', init: key);
  }
}

/// class DefaultTextHeightBehavior extends InheritedTheme
class DefaultTextHeightBehavior$Mate extends DefaultTextHeightBehavior with WidgetMate<DefaultTextHeightBehavior$Mate> {
  /// DefaultTextHeightBehavior DefaultTextHeightBehavior({Key? key, required TextHeightBehavior textHeightBehavior, required Widget child})
  DefaultTextHeightBehavior$Mate({
    /// optionalParameters: {Key? key} , hasDefaultValue:false, defaultValueCode:null
    Key? key,

    /// optionalParameters: {required TextHeightBehavior textHeightBehavior} , hasDefaultValue:false, defaultValueCode:null
    required TextHeightBehavior textHeightBehavior,

    /// optionalParameters: {required Widget child} , hasDefaultValue:false, defaultValueCode:null
    required Widget child,
  }) : super(
          key: key,
          textHeightBehavior: textHeightBehavior,
          child: child,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => DefaultTextHeightBehavior$Mate(
        key: p.getValue('key'),
        textHeightBehavior: p.getValue('textHeightBehavior'),
        child: p.getValue('child'),
      ),
    );
    mateParams.set(name: 'key', init: key);
    mateParams.set(name: 'textHeightBehavior', init: textHeightBehavior);
    mateParams.set(name: 'child', init: child);
  }
}

/// class Text extends StatelessWidget
class Text$Mate extends Text with WidgetMate<Text$Mate> {
  /// Text Text(String data, {Key? key, TextStyle? style, StrutStyle? strutStyle, TextAlign? textAlign, TextDirection? textDirection, Locale? locale, bool? softWrap, TextOverflow? overflow, double? textScaleFactor, int? maxLines, String? semanticsLabel, TextWidthBasis? textWidthBasis, TextHeightBehavior? textHeightBehavior, Color? selectionColor})
  Text$Mate(
    /// requiredParameters: String data
    String data, {
    /// optionalParameters: {Key? key} , hasDefaultValue:false, defaultValueCode:null
    Key? key,

    /// optionalParameters: {TextStyle? style} , hasDefaultValue:false, defaultValueCode:null
    TextStyle? style,

    /// optionalParameters: {StrutStyle? strutStyle} , hasDefaultValue:false, defaultValueCode:null
    StrutStyle? strutStyle,

    /// optionalParameters: {TextAlign? textAlign} , hasDefaultValue:false, defaultValueCode:null
    TextAlign? textAlign,

    /// optionalParameters: {TextDirection? textDirection} , hasDefaultValue:false, defaultValueCode:null
    TextDirection? textDirection,

    /// optionalParameters: {Locale? locale} , hasDefaultValue:false, defaultValueCode:null
    Locale? locale,

    /// optionalParameters: {bool? softWrap} , hasDefaultValue:false, defaultValueCode:null
    bool? softWrap,

    /// optionalParameters: {TextOverflow? overflow} , hasDefaultValue:false, defaultValueCode:null
    TextOverflow? overflow,

    /// optionalParameters: {double? textScaleFactor} , hasDefaultValue:false, defaultValueCode:null
    double? textScaleFactor,

    /// optionalParameters: {int? maxLines} , hasDefaultValue:false, defaultValueCode:null
    int? maxLines,

    /// optionalParameters: {String? semanticsLabel} , hasDefaultValue:false, defaultValueCode:null
    String? semanticsLabel,

    /// optionalParameters: {TextWidthBasis? textWidthBasis} , hasDefaultValue:false, defaultValueCode:null
    TextWidthBasis? textWidthBasis,

    /// optionalParameters: {TextHeightBehavior? textHeightBehavior} , hasDefaultValue:false, defaultValueCode:null
    TextHeightBehavior? textHeightBehavior,

    /// optionalParameters: {Color? selectionColor} , hasDefaultValue:false, defaultValueCode:null
    Color? selectionColor,
  }) : super(
          data,
          key: key,
          style: style,
          strutStyle: strutStyle,
          textAlign: textAlign,
          textDirection: textDirection,
          locale: locale,
          softWrap: softWrap,
          overflow: overflow,
          textScaleFactor: textScaleFactor,
          maxLines: maxLines,
          semanticsLabel: semanticsLabel,
          textWidthBasis: textWidthBasis,
          textHeightBehavior: textHeightBehavior,
          selectionColor: selectionColor,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => Text$Mate(
        p.getValue('data'),
        key: p.getValue('key'),
        style: p.getValue('style'),
        strutStyle: p.getValue('strutStyle'),
        textAlign: p.getValue('textAlign'),
        textDirection: p.getValue('textDirection'),
        locale: p.getValue('locale'),
        softWrap: p.getValue('softWrap'),
        overflow: p.getValue('overflow'),
        textScaleFactor: p.getValue('textScaleFactor'),
        maxLines: p.getValue('maxLines'),
        semanticsLabel: p.getValue('semanticsLabel'),
        textWidthBasis: p.getValue('textWidthBasis'),
        textHeightBehavior: p.getValue('textHeightBehavior'),
        selectionColor: p.getValue('selectionColor'),
      ),
    );
    mateParams.set(name: 'data', init: data);
    mateParams.set(name: 'key', init: key);
    mateParams.set(name: 'style', init: style);
    mateParams.set(name: 'strutStyle', init: strutStyle);
    mateParams.set(name: 'textAlign', init: textAlign);
    mateParams.set(name: 'textDirection', init: textDirection);
    mateParams.set(name: 'locale', init: locale);
    mateParams.set(name: 'softWrap', init: softWrap);
    mateParams.set(name: 'overflow', init: overflow);
    mateParams.set(name: 'textScaleFactor', init: textScaleFactor);
    mateParams.set(name: 'maxLines', init: maxLines);
    mateParams.set(name: 'semanticsLabel', init: semanticsLabel);
    mateParams.set(name: 'textWidthBasis', init: textWidthBasis);
    mateParams.set(name: 'textHeightBehavior', init: textHeightBehavior);
    mateParams.set(name: 'selectionColor', init: selectionColor);
  }

  /// Text Text.rich(InlineSpan textSpan, {Key? key, TextStyle? style, StrutStyle? strutStyle, TextAlign? textAlign, TextDirection? textDirection, Locale? locale, bool? softWrap, TextOverflow? overflow, double? textScaleFactor, int? maxLines, String? semanticsLabel, TextWidthBasis? textWidthBasis, TextHeightBehavior? textHeightBehavior, Color? selectionColor})
  Text$Mate.rich(
    /// requiredParameters: InlineSpan textSpan
    InlineSpan textSpan, {
    /// optionalParameters: {Key? key} , hasDefaultValue:false, defaultValueCode:null
    Key? key,

    /// optionalParameters: {TextStyle? style} , hasDefaultValue:false, defaultValueCode:null
    TextStyle? style,

    /// optionalParameters: {StrutStyle? strutStyle} , hasDefaultValue:false, defaultValueCode:null
    StrutStyle? strutStyle,

    /// optionalParameters: {TextAlign? textAlign} , hasDefaultValue:false, defaultValueCode:null
    TextAlign? textAlign,

    /// optionalParameters: {TextDirection? textDirection} , hasDefaultValue:false, defaultValueCode:null
    TextDirection? textDirection,

    /// optionalParameters: {Locale? locale} , hasDefaultValue:false, defaultValueCode:null
    Locale? locale,

    /// optionalParameters: {bool? softWrap} , hasDefaultValue:false, defaultValueCode:null
    bool? softWrap,

    /// optionalParameters: {TextOverflow? overflow} , hasDefaultValue:false, defaultValueCode:null
    TextOverflow? overflow,

    /// optionalParameters: {double? textScaleFactor} , hasDefaultValue:false, defaultValueCode:null
    double? textScaleFactor,

    /// optionalParameters: {int? maxLines} , hasDefaultValue:false, defaultValueCode:null
    int? maxLines,

    /// optionalParameters: {String? semanticsLabel} , hasDefaultValue:false, defaultValueCode:null
    String? semanticsLabel,

    /// optionalParameters: {TextWidthBasis? textWidthBasis} , hasDefaultValue:false, defaultValueCode:null
    TextWidthBasis? textWidthBasis,

    /// optionalParameters: {TextHeightBehavior? textHeightBehavior} , hasDefaultValue:false, defaultValueCode:null
    TextHeightBehavior? textHeightBehavior,

    /// optionalParameters: {Color? selectionColor} , hasDefaultValue:false, defaultValueCode:null
    Color? selectionColor,
  }) : super.rich(
          textSpan,
          key: key,
          style: style,
          strutStyle: strutStyle,
          textAlign: textAlign,
          textDirection: textDirection,
          locale: locale,
          softWrap: softWrap,
          overflow: overflow,
          textScaleFactor: textScaleFactor,
          maxLines: maxLines,
          semanticsLabel: semanticsLabel,
          textWidthBasis: textWidthBasis,
          textHeightBehavior: textHeightBehavior,
          selectionColor: selectionColor,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => Text$Mate.rich(
        p.getValue('textSpan'),
        key: p.getValue('key'),
        style: p.getValue('style'),
        strutStyle: p.getValue('strutStyle'),
        textAlign: p.getValue('textAlign'),
        textDirection: p.getValue('textDirection'),
        locale: p.getValue('locale'),
        softWrap: p.getValue('softWrap'),
        overflow: p.getValue('overflow'),
        textScaleFactor: p.getValue('textScaleFactor'),
        maxLines: p.getValue('maxLines'),
        semanticsLabel: p.getValue('semanticsLabel'),
        textWidthBasis: p.getValue('textWidthBasis'),
        textHeightBehavior: p.getValue('textHeightBehavior'),
        selectionColor: p.getValue('selectionColor'),
      ),
    );
    mateParams.set(name: 'textSpan', init: textSpan);
    mateParams.set(name: 'key', init: key);
    mateParams.set(name: 'style', init: style);
    mateParams.set(name: 'strutStyle', init: strutStyle);
    mateParams.set(name: 'textAlign', init: textAlign);
    mateParams.set(name: 'textDirection', init: textDirection);
    mateParams.set(name: 'locale', init: locale);
    mateParams.set(name: 'softWrap', init: softWrap);
    mateParams.set(name: 'overflow', init: overflow);
    mateParams.set(name: 'textScaleFactor', init: textScaleFactor);
    mateParams.set(name: 'maxLines', init: maxLines);
    mateParams.set(name: 'semanticsLabel', init: semanticsLabel);
    mateParams.set(name: 'textWidthBasis', init: textWidthBasis);
    mateParams.set(name: 'textHeightBehavior', init: textHeightBehavior);
    mateParams.set(name: 'selectionColor', init: selectionColor);
  }
}
