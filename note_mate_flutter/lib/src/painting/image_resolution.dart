// /// Generated by mate_flutter, please don't edit!

import 'package:flutter/src/painting/image_resolution.dart';
import 'dart:core';
import 'package:flutter/src/services/asset_bundle.dart';
import 'package:note/mate.dart';

/// class AssetImage extends AssetBundleImageProvider
class AssetImage$Mate extends AssetImage with Mate<AssetImage$Mate> {
  /// AssetImage AssetImage(String assetName, {AssetBundle? bundle, String? package})
  AssetImage$Mate(
    /// param: String assetName
    String assetName, {
    /// param: {AssetBundle? bundle}
    AssetBundle? bundle,

    /// param: {String? package}
    String? package,
  }) : super(
          assetName,
          bundle: bundle,
          package: package,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => AssetImage$Mate(
        p.getValue('assetName'),
        bundle: p.getValue('bundle'),
        package: p.getValue('package'),
      ),
    );
    mateParams.set(name: 'assetName', init: assetName);
    mateParams.set(name: 'bundle', init: bundle);
    mateParams.set(name: 'package', init: package);
  }
}