// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/widgets/display_feature_sub_screen.dart';
import 'package:note/mate.dart';
import 'package:flutter/src/foundation/key.dart';
import 'dart:ui';
import 'package:flutter/src/widgets/framework.dart';

/// class DisplayFeatureSubScreen extends StatelessWidget
class DisplayFeatureSubScreen$Mate extends DisplayFeatureSubScreen with Mate {
  /// DisplayFeatureSubScreen DisplayFeatureSubScreen({Key? key, Offset? anchorPoint, required Widget child})
  DisplayFeatureSubScreen$Mate({
    /// optionalParameters: {Key? key} , defaultValue:none
    Key? key,

    /// optionalParameters: {Offset? anchorPoint} , defaultValue:none
    Offset? anchorPoint,

    /// optionalParameters: {required Widget child} , defaultValue:none
    required Widget child,
  }) : super(
          key: key,
          anchorPoint: anchorPoint,
          child: child,
        ) {
    mateCreateName = 'DisplayFeatureSubScreen';
    matePackageUrl = 'package:flutter/material.dart';
    mateBuilder = (p) => DisplayFeatureSubScreen$Mate(
          key: p.get('key').build(),
          anchorPoint: p.get('anchorPoint').build(),
          child: p.get('child').build(),
        );
    mateUse('key', key);
    mateUse('anchorPoint', anchorPoint);
    mateUse('child', child);
  }
}
