// /// Generated by mate_flutter, please don't edit!

import 'package:flutter/src/widgets/display_feature_sub_screen.dart';
import 'package:flutter/src/foundation/key.dart';
import 'dart:ui';
import 'package:flutter/src/widgets/framework.dart';
import 'package:note/mate.dart';

/// class DisplayFeatureSubScreen extends StatelessWidget
class DisplayFeatureSubScreen$Mate extends DisplayFeatureSubScreen with WidgetMate<DisplayFeatureSubScreen$Mate> {
  /// DisplayFeatureSubScreen DisplayFeatureSubScreen({Key? key, Offset? anchorPoint, required Widget child})
  DisplayFeatureSubScreen$Mate({
    /// param: {Key? key}
    Key? key,

    /// param: {Offset? anchorPoint}
    Offset? anchorPoint,

    /// param: {required Widget child}
    required Widget child,
  }) : super(
          key: key,
          anchorPoint: anchorPoint,
          child: child,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => DisplayFeatureSubScreen$Mate(
        key: p.getValue('key'),
        anchorPoint: p.getValue('anchorPoint'),
        child: p.getValue('child'),
      ),
    );
    mateParams.set(name: 'key', init: key);
    mateParams.set(name: 'anchorPoint', init: anchorPoint);
    mateParams.set(name: 'child', init: child);
  }
}