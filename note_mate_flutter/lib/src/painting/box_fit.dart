// /// Generated by mate_flutter, please don't edit!

import 'package:flutter/src/painting/box_fit.dart';
import 'dart:ui';
import 'package:note/mate.dart';

/// class FittedSizes
class FittedSizes$Mate extends FittedSizes with Mate<FittedSizes$Mate> {
  /// FittedSizes FittedSizes(Size source, Size destination)
  FittedSizes$Mate(
    /// param: Size source
    Size source,

    /// param: Size destination
    Size destination,
  ) : super(
          source,
          destination,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => FittedSizes$Mate(
        p.getValue('source'),
        p.getValue('destination'),
      ),
    );
    mateParams.set(name: 'source', init: source);
    mateParams.set(name: 'destination', init: destination);
  }
}
