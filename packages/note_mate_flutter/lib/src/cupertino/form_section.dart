// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/cupertino/form_section.dart';
import 'package:note/mate.dart';
import 'package:flutter/src/foundation/key.dart';
import 'dart:core';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/painting/edge_insets.dart';
import 'package:flutter/painting.dart';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/painting/box_decoration.dart';

/// class CupertinoFormSection extends StatelessWidget
class CupertinoFormSection$Mate extends CupertinoFormSection with Mate {
  /// CupertinoFormSection CupertinoFormSection({Key? key, required List<Widget> children, Widget? header, Widget? footer, EdgeInsetsGeometry margin = EdgeInsets.zero, Color backgroundColor = CupertinoColors.systemGroupedBackground, BoxDecoration? decoration, Clip clipBehavior = Clip.none})
  CupertinoFormSection$Mate({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {required List<Widget> children} , defaultValue:none
    required List<Widget> children,

    /// optionalParameters: {Widget? header} , defaultValue:none
    Widget? header,

    /// optionalParameters: {Widget? footer} , defaultValue:none
    Widget? footer,

    /// optionalParameters: {EdgeInsetsGeometry margin = EdgeInsets.zero} , defaultValue:PrefixedIdentifier
    EdgeInsetsGeometry margin = EdgeInsets.zero,

    /// optionalParameters: {Color backgroundColor = CupertinoColors.systemGroupedBackground} , defaultValue:PrefixedIdentifier
    Color backgroundColor = CupertinoColors.systemGroupedBackground,

    /// optionalParameters: {BoxDecoration? decoration} , defaultValue:none
    BoxDecoration? decoration,

    /// optionalParameters: {Clip clipBehavior = Clip.none} , defaultValue:PrefixedIdentifier
    Clip clipBehavior = Clip.none,
  }) : super(
          key: key,
          children: children,
          header: header,
          footer: footer,
          margin: margin,
          backgroundColor: backgroundColor,
          decoration: decoration,
          clipBehavior: clipBehavior,
        ) {
    mateCreateName = 'CupertinoFormSection';
    matePackageUrl = 'package:flutter/cupertino.dart';
    mateBuilder = (p) => CupertinoFormSection$Mate(
          key: p.get('key').build(),
          children: p.get('children').build(),
          header: p.get('header').build(),
          footer: p.get('footer').build(),
          margin: p.get('margin').build(),
          backgroundColor: p.get('backgroundColor').build(),
          decoration: p.get('decoration').build(),
          clipBehavior: p.get('clipBehavior').build(),
        );
    mateUse('key', key, isNamed: true);
    mateUseList('children', children, isNamed: true);
    mateUse('header', header, isNamed: true);
    mateUse('footer', footer, isNamed: true);
    mateUse('margin', margin, isNamed: true);
    mateUse('backgroundColor', backgroundColor, isNamed: true);
    mateUse('decoration', decoration, isNamed: true);
    mateUse('clipBehavior', clipBehavior, isNamed: true);
  }

  /// CupertinoFormSection CupertinoFormSection.insetGrouped({Key? key, required List<Widget> children, Widget? header, Widget? footer, EdgeInsetsGeometry margin = _kFormDefaultInsetGroupedRowsMargin, Color backgroundColor = CupertinoColors.systemGroupedBackground, BoxDecoration? decoration, Clip clipBehavior = Clip.none})
  CupertinoFormSection$Mate.insetGrouped({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {required List<Widget> children} , defaultValue:none
    required List<Widget> children,

    /// optionalParameters: {Widget? header} , defaultValue:none
    Widget? header,

    /// optionalParameters: {Widget? footer} , defaultValue:none
    Widget? footer,

    /// optionalParameters: {EdgeInsetsGeometry margin = _kFormDefaultInsetGroupedRowsMargin} , defaultValue:unprocessed
    required EdgeInsetsGeometry margin,

    /// optionalParameters: {Color backgroundColor = CupertinoColors.systemGroupedBackground} , defaultValue:PrefixedIdentifier
    Color backgroundColor = CupertinoColors.systemGroupedBackground,

    /// optionalParameters: {BoxDecoration? decoration} , defaultValue:none
    BoxDecoration? decoration,

    /// optionalParameters: {Clip clipBehavior = Clip.none} , defaultValue:PrefixedIdentifier
    Clip clipBehavior = Clip.none,
  }) : super.insetGrouped(
          key: key,
          children: children,
          header: header,
          footer: footer,
          margin: margin,
          backgroundColor: backgroundColor,
          decoration: decoration,
          clipBehavior: clipBehavior,
        ) {
    mateCreateName = 'CupertinoFormSection.insetGrouped';
    matePackageUrl = 'package:flutter/cupertino.dart';
    mateBuilder = (p) => CupertinoFormSection$Mate.insetGrouped(
          key: p.get('key').build(),
          children: p.get('children').build(),
          header: p.get('header').build(),
          footer: p.get('footer').build(),
          margin: p.get('margin').build(),
          backgroundColor: p.get('backgroundColor').build(),
          decoration: p.get('decoration').build(),
          clipBehavior: p.get('clipBehavior').build(),
        );
    mateUse('key', key, isNamed: true);
    mateUseList('children', children, isNamed: true);
    mateUse('header', header, isNamed: true);
    mateUse('footer', footer, isNamed: true);
    mateUse('margin', margin, isNamed: true);
    mateUse('backgroundColor', backgroundColor, isNamed: true);
    mateUse('decoration', decoration, isNamed: true);
    mateUse('clipBehavior', clipBehavior, isNamed: true);
  }
}
