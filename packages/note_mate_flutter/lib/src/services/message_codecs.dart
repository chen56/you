// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/services/message_codecs.dart';
import 'package:note/mate.dart';

/// class StandardMethodCodec implements MethodCodec
class StandardMethodCodec$Mate extends StandardMethodCodec with Mate {
  /// StandardMethodCodec StandardMethodCodec([StandardMessageCodec messageCodec = const StandardMessageCodec()])
  StandardMethodCodec$Mate(

      /// requiredParameters: [StandardMessageCodec messageCodec = const StandardMessageCodec()]
      StandardMessageCodec messageCodec)
      : super(messageCodec) {
    mateCreateName = 'StandardMethodCodec';
    matePackageUrl = 'package:flutter/services.dart';
    mateBuilder = (p) => StandardMethodCodec$Mate(p.get('messageCodec').value);
    mateUse('messageCodec', messageCodec, isNamed: false);
  }
}
