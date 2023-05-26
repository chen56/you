// /// Generated by gen_maters.dart, please don't edit!

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/src/material/text_selection_toolbar_text_button.dart'
    as _i1;
import 'package:mate/mate_core.dart' as _i2;
import 'package:flutter/src/foundation/key.dart' as _i3;
import 'package:flutter/src/widgets/framework.dart' as _i4;
import 'package:flutter/src/painting/edge_insets.dart' as _i5;
import 'dart:ui' as _i6;
import 'package:flutter/src/painting/alignment.dart' as _i7;

/// class TextSelectionToolbarTextButton extends StatelessWidget
class TextSelectionToolbarTextButton$Mate
    extends _i1.TextSelectionToolbarTextButton with _i2.Mate {
  /// TextSelectionToolbarTextButton TextSelectionToolbarTextButton({Key? key, required Widget child, required EdgeInsets padding, void Function()? onPressed, AlignmentGeometry? alignment})
  TextSelectionToolbarTextButton$Mate({
    /// optionalParameters: {Key? key} , default:none
    super.key,

    /// optionalParameters: {required Widget child} , default:none
    required super.child,

    /// optionalParameters: {required EdgeInsets padding} , default:none
    required super.padding,

    /// optionalParameters: {void Function()? onPressed} , default:none
    super.onPressed,

    /// optionalParameters: {AlignmentGeometry? alignment} , default:none
    super.alignment,
  })  : mateParams = {
          'key': _i2.BuilderArg<_i3.Key?>(
            name: 'key',
            init: key,
            isNamed: true,
          ),
          'child': _i2.BuilderArg<_i4.Widget>(
            name: 'child',
            init: child,
            isNamed: true,
          ),
          'padding': _i2.BuilderArg<_i5.EdgeInsets>(
            name: 'padding',
            init: padding,
            isNamed: true,
          ),
          'onPressed': _i2.BuilderArg<_i6.VoidCallback?>(
            name: 'onPressed',
            init: onPressed,
            isNamed: true,
          ),
          'alignment': _i2.BuilderArg<_i7.AlignmentGeometry?>(
            name: 'alignment',
            init: alignment,
            isNamed: true,
          ),
        },
        super() {
    mateBuilderName = 'TextSelectionToolbarTextButton';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => TextSelectionToolbarTextButton$Mate(
          key: p.get('key').build(),
          child: p.get('child').build(),
          padding: p.get('padding').build(),
          onPressed: p.get('onPressed').build(),
          alignment: p.get('alignment').build(),
        );
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}