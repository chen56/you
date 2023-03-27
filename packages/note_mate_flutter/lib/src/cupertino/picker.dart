// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/cupertino/picker.dart';
import 'package:note/mate.dart';
import 'package:flutter/src/foundation/key.dart';
import 'dart:core';
import 'dart:ui';
import 'package:flutter/src/widgets/list_wheel_scroll_view.dart';
import 'package:flutter/src/foundation/basic_types.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/cupertino.dart';

/// class CupertinoPicker extends StatefulWidget
class CupertinoPicker$Mate extends CupertinoPicker with Mate {
  /// CupertinoPicker CupertinoPicker({Key? key, double diameterRatio = _kDefaultDiameterRatio, Color? backgroundColor, double offAxisFraction = 0.0, bool useMagnifier = false, double magnification = 1.0, FixedExtentScrollController? scrollController, double squeeze = _kSqueeze, required double itemExtent, required void Function(int)? onSelectedItemChanged, required List<Widget> children, Widget? selectionOverlay = const CupertinoPickerDefaultSelectionOverlay(), bool looping = false})
  CupertinoPicker$Mate({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {double diameterRatio = _kDefaultDiameterRatio} , defaultValue:unprocessed
    required double diameterRatio,

    /// optionalParameters: {Color? backgroundColor} , defaultValue:none
    Color? backgroundColor,

    /// optionalParameters: {double offAxisFraction = 0.0} , defaultValue:Literal
    double offAxisFraction = 0.0,

    /// optionalParameters: {bool useMagnifier = false} , defaultValue:Literal
    bool useMagnifier = false,

    /// optionalParameters: {double magnification = 1.0} , defaultValue:Literal
    double magnification = 1.0,

    /// optionalParameters: {FixedExtentScrollController? scrollController} , defaultValue:none
    FixedExtentScrollController? scrollController,

    /// optionalParameters: {double squeeze = _kSqueeze} , defaultValue:unprocessed
    required double squeeze,

    /// optionalParameters: {required double itemExtent} , defaultValue:none
    required double itemExtent,

    /// optionalParameters: {required void Function(int)? onSelectedItemChanged} , defaultValue:none
    required ValueChanged<int>? onSelectedItemChanged,

    /// optionalParameters: {required List<Widget> children} , defaultValue:none
    required List<Widget> children,

    /// optionalParameters: {Widget? selectionOverlay = const CupertinoPickerDefaultSelectionOverlay()} , defaultValue:unprocessed
    Widget? selectionOverlay,

    /// optionalParameters: {bool looping = false} , defaultValue:Literal
    bool looping = false,
  }) : super(
          key: key,
          diameterRatio: diameterRatio,
          backgroundColor: backgroundColor,
          offAxisFraction: offAxisFraction,
          useMagnifier: useMagnifier,
          magnification: magnification,
          scrollController: scrollController,
          squeeze: squeeze,
          itemExtent: itemExtent,
          onSelectedItemChanged: onSelectedItemChanged,
          children: children,
          selectionOverlay: selectionOverlay,
          looping: looping,
        ) {
    mateCreateName = 'CupertinoPicker';
    matePackageUrl = 'package:flutter/cupertino.dart';
    mateBuilder = (p) => CupertinoPicker$Mate(
          key: p.get('key').build(),
          diameterRatio: p.get('diameterRatio').build(),
          backgroundColor: p.get('backgroundColor').build(),
          offAxisFraction: p.get('offAxisFraction').build(),
          useMagnifier: p.get('useMagnifier').build(),
          magnification: p.get('magnification').build(),
          scrollController: p.get('scrollController').build(),
          squeeze: p.get('squeeze').build(),
          itemExtent: p.get('itemExtent').build(),
          onSelectedItemChanged: p.get('onSelectedItemChanged').build(),
          children: p.get('children').build(),
          selectionOverlay: p.get('selectionOverlay').build(),
          looping: p.get('looping').build(),
        );
    mateUse('key', key, isNamed: true);
    mateUse('diameterRatio', diameterRatio, isNamed: true);
    mateUse('backgroundColor', backgroundColor, isNamed: true);
    mateUse('offAxisFraction', offAxisFraction, isNamed: true);
    mateUse('useMagnifier', useMagnifier, isNamed: true);
    mateUse('magnification', magnification, isNamed: true);
    mateUse('scrollController', scrollController, isNamed: true);
    mateUse('squeeze', squeeze, isNamed: true);
    mateUse('itemExtent', itemExtent, isNamed: true);
    mateUse('onSelectedItemChanged', onSelectedItemChanged, isNamed: true);
    mateUseList('children', children, isNamed: true);
    mateUse('selectionOverlay', selectionOverlay, isNamed: true);
    mateUse('looping', looping, isNamed: true);
  }

  /// CupertinoPicker CupertinoPicker.builder({Key? key, double diameterRatio = _kDefaultDiameterRatio, Color? backgroundColor, double offAxisFraction = 0.0, bool useMagnifier = false, double magnification = 1.0, FixedExtentScrollController? scrollController, double squeeze = _kSqueeze, required double itemExtent, required void Function(int)? onSelectedItemChanged, required Widget? Function(BuildContext, int) itemBuilder, int? childCount, Widget? selectionOverlay = const CupertinoPickerDefaultSelectionOverlay()})
  CupertinoPicker$Mate.builder({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {double diameterRatio = _kDefaultDiameterRatio} , defaultValue:unprocessed
    required double diameterRatio,

    /// optionalParameters: {Color? backgroundColor} , defaultValue:none
    Color? backgroundColor,

    /// optionalParameters: {double offAxisFraction = 0.0} , defaultValue:Literal
    double offAxisFraction = 0.0,

    /// optionalParameters: {bool useMagnifier = false} , defaultValue:Literal
    bool useMagnifier = false,

    /// optionalParameters: {double magnification = 1.0} , defaultValue:Literal
    double magnification = 1.0,

    /// optionalParameters: {FixedExtentScrollController? scrollController} , defaultValue:none
    FixedExtentScrollController? scrollController,

    /// optionalParameters: {double squeeze = _kSqueeze} , defaultValue:unprocessed
    required double squeeze,

    /// optionalParameters: {required double itemExtent} , defaultValue:none
    required double itemExtent,

    /// optionalParameters: {required void Function(int)? onSelectedItemChanged} , defaultValue:none
    required ValueChanged<int>? onSelectedItemChanged,

    /// optionalParameters: {required Widget? Function(BuildContext, int) itemBuilder} , defaultValue:none
    required NullableIndexedWidgetBuilder itemBuilder,

    /// optionalParameters: {int? childCount} , defaultValue:none
    int? childCount,

    /// optionalParameters: {Widget? selectionOverlay = const CupertinoPickerDefaultSelectionOverlay()} , defaultValue:unprocessed
    Widget? selectionOverlay,
  }) : super.builder(
          key: key,
          diameterRatio: diameterRatio,
          backgroundColor: backgroundColor,
          offAxisFraction: offAxisFraction,
          useMagnifier: useMagnifier,
          magnification: magnification,
          scrollController: scrollController,
          squeeze: squeeze,
          itemExtent: itemExtent,
          onSelectedItemChanged: onSelectedItemChanged,
          itemBuilder: itemBuilder,
          childCount: childCount,
          selectionOverlay: selectionOverlay,
        ) {
    mateCreateName = 'CupertinoPicker.builder';
    matePackageUrl = 'package:flutter/cupertino.dart';
    mateBuilder = (p) => CupertinoPicker$Mate.builder(
          key: p.get('key').build(),
          diameterRatio: p.get('diameterRatio').build(),
          backgroundColor: p.get('backgroundColor').build(),
          offAxisFraction: p.get('offAxisFraction').build(),
          useMagnifier: p.get('useMagnifier').build(),
          magnification: p.get('magnification').build(),
          scrollController: p.get('scrollController').build(),
          squeeze: p.get('squeeze').build(),
          itemExtent: p.get('itemExtent').build(),
          onSelectedItemChanged: p.get('onSelectedItemChanged').build(),
          itemBuilder: p.get('itemBuilder').build(),
          childCount: p.get('childCount').build(),
          selectionOverlay: p.get('selectionOverlay').build(),
        );
    mateUse('key', key, isNamed: true);
    mateUse('diameterRatio', diameterRatio, isNamed: true);
    mateUse('backgroundColor', backgroundColor, isNamed: true);
    mateUse('offAxisFraction', offAxisFraction, isNamed: true);
    mateUse('useMagnifier', useMagnifier, isNamed: true);
    mateUse('magnification', magnification, isNamed: true);
    mateUse('scrollController', scrollController, isNamed: true);
    mateUse('squeeze', squeeze, isNamed: true);
    mateUse('itemExtent', itemExtent, isNamed: true);
    mateUse('onSelectedItemChanged', onSelectedItemChanged, isNamed: true);
    mateUse('itemBuilder', itemBuilder, isNamed: true);
    mateUse('childCount', childCount, isNamed: true);
    mateUse('selectionOverlay', selectionOverlay, isNamed: true);
  }
}

/// class CupertinoPickerDefaultSelectionOverlay extends StatelessWidget
class CupertinoPickerDefaultSelectionOverlay$Mate extends CupertinoPickerDefaultSelectionOverlay with Mate {
  /// CupertinoPickerDefaultSelectionOverlay CupertinoPickerDefaultSelectionOverlay({Key? key, Color background = CupertinoColors.tertiarySystemFill, bool capStartEdge = true, bool capEndEdge = true})
  CupertinoPickerDefaultSelectionOverlay$Mate({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {Color background = CupertinoColors.tertiarySystemFill} , defaultValue:PrefixedIdentifier
    Color background = CupertinoColors.tertiarySystemFill,

    /// optionalParameters: {bool capStartEdge = true} , defaultValue:Literal
    bool capStartEdge = true,

    /// optionalParameters: {bool capEndEdge = true} , defaultValue:Literal
    bool capEndEdge = true,
  }) : super(
          key: key,
          background: background,
          capStartEdge: capStartEdge,
          capEndEdge: capEndEdge,
        ) {
    mateCreateName = 'CupertinoPickerDefaultSelectionOverlay';
    matePackageUrl = 'package:flutter/cupertino.dart';
    mateBuilder = (p) => CupertinoPickerDefaultSelectionOverlay$Mate(
          key: p.get('key').build(),
          background: p.get('background').build(),
          capStartEdge: p.get('capStartEdge').build(),
          capEndEdge: p.get('capEndEdge').build(),
        );
    mateUse('key', key, isNamed: true);
    mateUse('background', background, isNamed: true);
    mateUse('capStartEdge', capStartEdge, isNamed: true);
    mateUse('capEndEdge', capEndEdge, isNamed: true);
  }
}
