import 'package:flutter/material.dart';
import 'package:note/mate.dart';

class ContainerMate extends Container with Mate {
  late final Param<double?> widthMate;
  late final Param<double?> heightMate;

  ContainerMate({
    Key? key,
    AlignmentGeometry? alignment,
    Color? color,
    Clip clipBehavior = Clip.none,
    double? width,
    double? height,
    Widget? child,
  }) : super(
          key: key,
          alignment: alignment,
          color: color,
          clipBehavior: clipBehavior,
          width: width,
          height: height,
          child: child,
        ) {
    mateCreateName = "Container";
    matePackageUrl = "package:flutter/material.dart";
    mateBuilder = (p) => ContainerMate(
          key: p.get("key").build(),
          alignment: p.get("alignment").build(),
          color: p.get("color").build(),
          clipBehavior: p.get("clipBehavior").build(),
          width: p.get("width").build(),
          height: p.get("height").build(),
          child: p.get("child").build(),
        );
    //这里会换成代码生成，凡是可以取到类型的，都可以支持编辑
    mateUse("key", key, isNamed: true);
    mateUse("alignment", alignment, isNamed: true);
    mateUse("color", color, isNamed: true);
    mateUse("clipBehavior", clipBehavior, isNamed: true, defaultValue: Clip.none);
    widthMate = mateUse("width", width, isNamed: true);
    heightMate = mateUse("height", height, isNamed: true);
    mateUse("child", child, isNamed: true);
  }

  ContainerMate configMate({required void Function(ContainerMate self) config}) {
    return this;
  }
}

class Text$Mate extends Text with Mate {
  /// Text Text(String data, {Key? key, TextStyle? style, StrutStyle? strutStyle, TextAlign? textAlign, TextDirection? textDirection, Locale? locale, bool? softWrap, TextOverflow? overflow, double? textScaleFactor, int? maxLines, String? semanticsLabel, TextWidthBasis? textWidthBasis, TextHeightBehavior? textHeightBehavior, Color? selectionColor})
  Text$Mate(
    /// requiredParameters: String data
    String data, {
    /// optionalParameters: {Key? key} , default:none
    Key? key,

    /// optionalParameters: {TextStyle? style} , default:none
    TextStyle? style,

    /// optionalParameters: {StrutStyle? strutStyle} , default:none
    StrutStyle? strutStyle,

    /// optionalParameters: {TextAlign? textAlign} , default:none
    TextAlign? textAlign,

    /// optionalParameters: {TextDirection? textDirection} , default:none
    TextDirection? textDirection,

    /// optionalParameters: {Locale? locale} , default:none
    Locale? locale,

    /// optionalParameters: {bool? softWrap} , default:none
    bool? softWrap,

    /// optionalParameters: {TextOverflow? overflow} , default:none
    TextOverflow? overflow,

    /// optionalParameters: {double? textScaleFactor} , default:none
    double? textScaleFactor,

    /// optionalParameters: {int? maxLines} , default:none
    int? maxLines,

    /// optionalParameters: {String? semanticsLabel} , default:none
    String? semanticsLabel,

    /// optionalParameters: {TextWidthBasis? textWidthBasis} , default:none
    TextWidthBasis? textWidthBasis,

    /// optionalParameters: {TextHeightBehavior? textHeightBehavior} , default:none
    TextHeightBehavior? textHeightBehavior,

    /// optionalParameters: {Color? selectionColor} , default:none
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
    mateCreateName = 'Text';
    matePackageUrl = 'package:flutter/widgets.dart';
    mateBuilder = (p) => Text$Mate(
          p.get('data').value,
          key: p.get('key').build(),
          style: p.get('style').build(),
          strutStyle: p.get('strutStyle').build(),
          textAlign: p.get('textAlign').build(),
          textDirection: p.get('textDirection').build(),
          locale: p.get('locale').build(),
          softWrap: p.get('softWrap').build(),
          overflow: p.get('overflow').build(),
          textScaleFactor: p.get('textScaleFactor').build(),
          maxLines: p.get('maxLines').build(),
          semanticsLabel: p.get('semanticsLabel').build(),
          textWidthBasis: p.get('textWidthBasis').build(),
          textHeightBehavior: p.get('textHeightBehavior').build(),
          selectionColor: p.get('selectionColor').build(),
        );
    mateUse(
      'data',
      data,
      isNamed: false,
    );
    mateUse(
      'key',
      key,
      isNamed: true,
    );
    mateUse(
      'style',
      style,
      isNamed: true,
    );
    mateUse(
      'strutStyle',
      strutStyle,
      isNamed: true,
    );
    mateUse(
      'textAlign',
      textAlign,
      isNamed: true,
    );
    mateUse(
      'textDirection',
      textDirection,
      isNamed: true,
    );
    mateUse(
      'locale',
      locale,
      isNamed: true,
    );
    mateUse(
      'softWrap',
      softWrap,
      isNamed: true,
    );
    mateUse(
      'overflow',
      overflow,
      isNamed: true,
    );
    mateUse(
      'textScaleFactor',
      textScaleFactor,
      isNamed: true,
    );
    mateUse(
      'maxLines',
      maxLines,
      isNamed: true,
    );
    mateUse(
      'semanticsLabel',
      semanticsLabel,
      isNamed: true,
    );
    mateUse(
      'textWidthBasis',
      textWidthBasis,
      isNamed: true,
    );
    mateUse(
      'textHeightBehavior',
      textHeightBehavior,
      isNamed: true,
    );
    mateUse(
      'selectionColor',
      selectionColor,
      isNamed: true,
    );
  }

  /// Text Text.rich(InlineSpan textSpan, {Key? key, TextStyle? style, StrutStyle? strutStyle, TextAlign? textAlign, TextDirection? textDirection, Locale? locale, bool? softWrap, TextOverflow? overflow, double? textScaleFactor, int? maxLines, String? semanticsLabel, TextWidthBasis? textWidthBasis, TextHeightBehavior? textHeightBehavior, Color? selectionColor})
  Text$Mate.rich(
    /// requiredParameters: InlineSpan textSpan
    InlineSpan textSpan, {
    /// optionalParameters: {Key? key} , default:none
    Key? key,

    /// optionalParameters: {TextStyle? style} , default:none
    TextStyle? style,

    /// optionalParameters: {StrutStyle? strutStyle} , default:none
    StrutStyle? strutStyle,

    /// optionalParameters: {TextAlign? textAlign} , default:none
    TextAlign? textAlign,

    /// optionalParameters: {TextDirection? textDirection} , default:none
    TextDirection? textDirection,

    /// optionalParameters: {Locale? locale} , default:none
    Locale? locale,

    /// optionalParameters: {bool? softWrap} , default:none
    bool? softWrap,

    /// optionalParameters: {TextOverflow? overflow} , default:none
    TextOverflow? overflow,

    /// optionalParameters: {double? textScaleFactor} , default:none
    double? textScaleFactor,

    /// optionalParameters: {int? maxLines} , default:none
    int? maxLines,

    /// optionalParameters: {String? semanticsLabel} , default:none
    String? semanticsLabel,

    /// optionalParameters: {TextWidthBasis? textWidthBasis} , default:none
    TextWidthBasis? textWidthBasis,

    /// optionalParameters: {TextHeightBehavior? textHeightBehavior} , default:none
    TextHeightBehavior? textHeightBehavior,

    /// optionalParameters: {Color? selectionColor} , default:none
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
    mateCreateName = 'Text.rich';
    matePackageUrl = 'package:flutter/widgets.dart';
    mateBuilder = (p) => Text$Mate.rich(
          p.get('textSpan').value,
          key: p.get('key').build(),
          style: p.get('style').build(),
          strutStyle: p.get('strutStyle').build(),
          textAlign: p.get('textAlign').build(),
          textDirection: p.get('textDirection').build(),
          locale: p.get('locale').build(),
          softWrap: p.get('softWrap').build(),
          overflow: p.get('overflow').build(),
          textScaleFactor: p.get('textScaleFactor').build(),
          maxLines: p.get('maxLines').build(),
          semanticsLabel: p.get('semanticsLabel').build(),
          textWidthBasis: p.get('textWidthBasis').build(),
          textHeightBehavior: p.get('textHeightBehavior').build(),
          selectionColor: p.get('selectionColor').build(),
        );
    mateUse(
      'textSpan',
      textSpan,
      isNamed: false,
    );
    mateUse(
      'key',
      key,
      isNamed: true,
    );
    mateUse(
      'style',
      style,
      isNamed: true,
    );
    mateUse(
      'strutStyle',
      strutStyle,
      isNamed: true,
    );
    mateUse(
      'textAlign',
      textAlign,
      isNamed: true,
    );
    mateUse(
      'textDirection',
      textDirection,
      isNamed: true,
    );
    mateUse(
      'locale',
      locale,
      isNamed: true,
    );
    mateUse(
      'softWrap',
      softWrap,
      isNamed: true,
    );
    mateUse(
      'overflow',
      overflow,
      isNamed: true,
    );
    mateUse(
      'textScaleFactor',
      textScaleFactor,
      isNamed: true,
    );
    mateUse(
      'maxLines',
      maxLines,
      isNamed: true,
    );
    mateUse(
      'semanticsLabel',
      semanticsLabel,
      isNamed: true,
    );
    mateUse(
      'textWidthBasis',
      textWidthBasis,
      isNamed: true,
    );
    mateUse(
      'textHeightBehavior',
      textHeightBehavior,
      isNamed: true,
    );
    mateUse(
      'selectionColor',
      selectionColor,
      isNamed: true,
    );
  }
}

class ColumnMate extends Column with Mate {
  ColumnMate({
    Key? key,
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    List<Widget> children = const <Widget>[],
  }) : super(
          key: key,
          mainAxisAlignment: mainAxisAlignment,
          children: children,
        ) {
    mateCreateName = "Column";
    matePackageUrl = "package:flutter/material.dart";

    mateBuilder = (p) => ColumnMate(
          key: p.get("key").build(),
          mainAxisAlignment: p.get("mainAxisAlignment").build(),
          children: p.get("children").build(),
        );
    mateUse("key", key, isNamed: true);
    mateUse("mainAxisAlignment", mainAxisAlignment,
        isNamed: true, defaultValue: MainAxisAlignment.start);
    mateUseList("children", children, isNamed: true);
  }
}

class CenterMate extends Center with Mate {
  CenterMate({
    Key? key,
    double? widthFactor,
    double? heightFactor,
    Widget? child,
  }) : super(
          key: key,
          widthFactor: widthFactor,
          heightFactor: heightFactor,
          child: child,
        ) {
    mateCreateName = "Center";
    matePackageUrl = "package:flutter/material.dart";

    mateBuilder = (p) => CenterMate(
          key: p.get("key").build(),
          widthFactor: p.get("widthFactor").build(),
          heightFactor: p.get("heightFactor").build(),
          child: p.get("child").build(),
        );
    mateUse("key", key, isNamed: true);
    mateUse("widthFactor", widthFactor, isNamed: true);
    mateUse("heightFactor", heightFactor, isNamed: true);
    mateUse("child", child, isNamed: true);
  }
}
