// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/foundation/serialization.dart';
import 'package:note/mate.dart';
import 'dart:typed_data';

/// class ReadBuffer
class ReadBuffer$Mate extends ReadBuffer with Mate {
  /// ReadBuffer ReadBuffer(ByteData data)
  ReadBuffer$Mate(

      /// requiredParameters: ByteData data
      ByteData data)
      : super(data) {
    mateCreateName = 'ReadBuffer';
    matePackageUrl = 'package:flutter/foundation.dart';
    mateBuilder = (p) => ReadBuffer$Mate(p.get('data').value);
    mateUse('data', data);
  }
}
