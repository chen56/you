// /// Generated by mate_flutter, please don't edit!

import 'package:flutter/src/foundation/serialization.dart';
import 'dart:typed_data';
import 'package:note/mate.dart';
export 'dart:typed_data' show ByteData, Endian, Float32List, Float64List, Int32List, Int64List, Uint8List;

/// class ReadBuffer
class ReadBuffer$Mate extends ReadBuffer with Mate<ReadBuffer$Mate> {
  /// ReadBuffer ReadBuffer(ByteData data)
  ReadBuffer$Mate(

      /// param: ByteData data
      ByteData data)
      : super(data) {
    mateParams = Params(
      init: this,
      builder: (p) => ReadBuffer$Mate(p.getValue('data')),
    );
    mateParams.set(name: 'data', init: data);
  }
}
