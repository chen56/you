import 'package:flutter/services.dart' show ByteData, ImmutableBuffer, rootBundle;

class Asset {
  String key;

  Asset(this.key);

  Future<String> loadString({bool cache = true}) {
    return rootBundle.loadString(key, cache: cache);
  }

  Future<ByteData> load() {
    return rootBundle.load(key);
  }

  Future<ImmutableBuffer> loadBuffer() {
    return rootBundle.loadBuffer(key);
  }
}
