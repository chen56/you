// /// Generated by gen_maters.dart, please don't edit!

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/src/painting/image_provider.dart' as _i1;
import 'package:mate/mate_core.dart' as _i2;
import 'package:flutter/src/services/asset_bundle.dart' as _i3;
import 'dart:ui' as _i4;
import 'package:flutter/src/foundation/platform.dart' as _i5;
import 'package:flutter/cupertino.dart' as _i6;
import 'dart:io' as _i7;
import 'dart:typed_data' as _i8;

/// class ImageConfiguration
class ImageConfiguration$Mate extends _i1.ImageConfiguration with _i2.Mate {
  /// ImageConfiguration ImageConfiguration({AssetBundle? bundle, double? devicePixelRatio, Locale? locale, TextDirection? textDirection, Size? size, TargetPlatform? platform})
  ImageConfiguration$Mate({
    /// optionalParameters: {AssetBundle? bundle} , default:none
    super.bundle,

    /// optionalParameters: {double? devicePixelRatio} , default:none
    super.devicePixelRatio,

    /// optionalParameters: {Locale? locale} , default:none
    super.locale,

    /// optionalParameters: {TextDirection? textDirection} , default:none
    super.textDirection,

    /// optionalParameters: {Size? size} , default:none
    super.size,

    /// optionalParameters: {TargetPlatform? platform} , default:none
    super.platform,
  })  : mateParams = {
          'bundle': _i2.BuilderArg<_i3.AssetBundle?>(
            name: 'bundle',
            init: bundle,
            isNamed: true,
          ),
          'devicePixelRatio': _i2.BuilderArg<double?>(
            name: 'devicePixelRatio',
            init: devicePixelRatio,
            isNamed: true,
          ),
          'locale': _i2.BuilderArg<_i4.Locale?>(
            name: 'locale',
            init: locale,
            isNamed: true,
          ),
          'textDirection': _i2.BuilderArg<_i4.TextDirection?>(
            name: 'textDirection',
            init: textDirection,
            isNamed: true,
          ),
          'size': _i2.BuilderArg<_i4.Size?>(
            name: 'size',
            init: size,
            isNamed: true,
          ),
          'platform': _i2.BuilderArg<_i5.TargetPlatform?>(
            name: 'platform',
            init: platform,
            isNamed: true,
          ),
        },
        super() {
    mateBuilderName = 'ImageConfiguration';
    matePackageUrl = 'package:flutter/cupertino.dart';
    mateBuilder = (p) => ImageConfiguration$Mate(
          bundle: p.get('bundle').build(),
          devicePixelRatio: p.get('devicePixelRatio').build(),
          locale: p.get('locale').build(),
          textDirection: p.get('textDirection').build(),
          size: p.get('size').build(),
          platform: p.get('platform').build(),
        );
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}

/// class AssetBundleImageKey
class AssetBundleImageKey$Mate extends _i1.AssetBundleImageKey with _i2.Mate {
  /// AssetBundleImageKey AssetBundleImageKey({required AssetBundle bundle, required String name, required double scale})
  AssetBundleImageKey$Mate({
    /// optionalParameters: {required AssetBundle bundle} , default:none
    required super.bundle,

    /// optionalParameters: {required String name} , default:none
    required super.name,

    /// optionalParameters: {required double scale} , default:none
    required super.scale,
  })  : mateParams = {
          'bundle': _i2.BuilderArg<_i3.AssetBundle>(
            name: 'bundle',
            init: bundle,
            isNamed: true,
          ),
          'name': _i2.BuilderArg<String>(
            name: 'name',
            init: name,
            isNamed: true,
          ),
          'scale': _i2.BuilderArg<double>(
            name: 'scale',
            init: scale,
            isNamed: true,
          ),
        },
        super() {
    mateBuilderName = 'AssetBundleImageKey';
    matePackageUrl = 'package:flutter/cupertino.dart';
    mateBuilder = (p) => AssetBundleImageKey$Mate(
          bundle: p.get('bundle').build(),
          name: p.get('name').build(),
          scale: p.get('scale').build(),
        );
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}

/// class ResizeImage extends ImageProvider<ResizeImageKey>
class ResizeImage$Mate extends _i1.ResizeImage with _i2.Mate {
  /// ResizeImage ResizeImage(ImageProvider<Object> imageProvider, {int? width, int? height, ResizeImagePolicy policy = ResizeImagePolicy.exact, bool allowUpscaling = false})
  ResizeImage$Mate(
    /// requiredParameters: ImageProvider<Object> imageProvider
    super.imageProvider, {
    /// optionalParameters: {int? width} , default:none
    super.width,

    /// optionalParameters: {int? height} , default:none
    super.height,

    /// optionalParameters: {ResizeImagePolicy policy = ResizeImagePolicy.exact} , default:processed=PrefixedIdentifierImpl
    super.policy,

    /// optionalParameters: {bool allowUpscaling = false} , default:processed=BooleanLiteralImpl
    super.allowUpscaling,
  })  : mateParams = {
          'imageProvider': _i2.BuilderArg<_i1.ImageProvider<Object>>(
            name: 'imageProvider',
            init: imageProvider,
            isNamed: false,
          ),
          'width': _i2.BuilderArg<int?>(
            name: 'width',
            init: width,
            isNamed: true,
          ),
          'height': _i2.BuilderArg<int?>(
            name: 'height',
            init: height,
            isNamed: true,
          ),
          'policy': _i2.BuilderArg<_i1.ResizeImagePolicy>(
            name: 'policy',
            init: policy,
            isNamed: true,
            defaultValue: _i6.ResizeImagePolicy.exact,
          ),
          'allowUpscaling': _i2.BuilderArg<bool>(
            name: 'allowUpscaling',
            init: allowUpscaling,
            isNamed: true,
            defaultValue: false,
          ),
        },
        super() {
    mateBuilderName = 'ResizeImage';
    matePackageUrl = 'package:flutter/cupertino.dart';
    mateBuilder = (p) => ResizeImage$Mate(
          p.get('imageProvider').value,
          width: p.get('width').build(),
          height: p.get('height').build(),
          policy: p.get('policy').build(),
          allowUpscaling: p.get('allowUpscaling').build(),
        );
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}

/// class FileImage extends ImageProvider<FileImage>
class FileImage$Mate extends _i1.FileImage with _i2.Mate {
  /// FileImage FileImage(File file, {double scale = 1.0})
  FileImage$Mate(
    /// requiredParameters: File file
    super.file, {
    /// optionalParameters: {double scale = 1.0} , default:processed=DoubleLiteralImpl
    super.scale,
  })  : mateParams = {
          'file': _i2.BuilderArg<_i7.File>(
            name: 'file',
            init: file,
            isNamed: false,
          ),
          'scale': _i2.BuilderArg<double>(
            name: 'scale',
            init: scale,
            isNamed: true,
            defaultValue: 1.0,
          ),
        },
        super() {
    mateBuilderName = 'FileImage';
    matePackageUrl = 'package:flutter/cupertino.dart';
    mateBuilder = (p) => FileImage$Mate(
          p.get('file').value,
          scale: p.get('scale').build(),
        );
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}

/// class MemoryImage extends ImageProvider<MemoryImage>
class MemoryImage$Mate extends _i1.MemoryImage with _i2.Mate {
  /// MemoryImage MemoryImage(Uint8List bytes, {double scale = 1.0})
  MemoryImage$Mate(
    /// requiredParameters: Uint8List bytes
    super.bytes, {
    /// optionalParameters: {double scale = 1.0} , default:processed=DoubleLiteralImpl
    super.scale,
  })  : mateParams = {
          'bytes': _i2.BuilderArg<_i8.Uint8List>(
            name: 'bytes',
            init: bytes,
            isNamed: false,
          ),
          'scale': _i2.BuilderArg<double>(
            name: 'scale',
            init: scale,
            isNamed: true,
            defaultValue: 1.0,
          ),
        },
        super() {
    mateBuilderName = 'MemoryImage';
    matePackageUrl = 'package:flutter/cupertino.dart';
    mateBuilder = (p) => MemoryImage$Mate(
          p.get('bytes').value,
          scale: p.get('scale').build(),
        );
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}

/// class ExactAssetImage extends AssetBundleImageProvider
class ExactAssetImage$Mate extends _i1.ExactAssetImage with _i2.Mate {
  /// ExactAssetImage ExactAssetImage(String assetName, {double scale = 1.0, AssetBundle? bundle, String? package})
  ExactAssetImage$Mate(
    /// requiredParameters: String assetName
    super.assetName, {
    /// optionalParameters: {double scale = 1.0} , default:processed=DoubleLiteralImpl
    super.scale,

    /// optionalParameters: {AssetBundle? bundle} , default:none
    super.bundle,

    /// optionalParameters: {String? package} , default:none
    super.package,
  })  : mateParams = {
          'assetName': _i2.BuilderArg<String>(
            name: 'assetName',
            init: assetName,
            isNamed: false,
          ),
          'scale': _i2.BuilderArg<double>(
            name: 'scale',
            init: scale,
            isNamed: true,
            defaultValue: 1.0,
          ),
          'bundle': _i2.BuilderArg<_i3.AssetBundle?>(
            name: 'bundle',
            init: bundle,
            isNamed: true,
          ),
          'package': _i2.BuilderArg<String?>(
            name: 'package',
            init: package,
            isNamed: true,
          ),
        },
        super() {
    mateBuilderName = 'ExactAssetImage';
    matePackageUrl = 'package:flutter/cupertino.dart';
    mateBuilder = (p) => ExactAssetImage$Mate(
          p.get('assetName').value,
          scale: p.get('scale').build(),
          bundle: p.get('bundle').build(),
          package: p.get('package').build(),
        );
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}

/// class NetworkImageLoadException implements Exception
class NetworkImageLoadException$Mate extends _i1.NetworkImageLoadException
    with _i2.Mate {
  /// NetworkImageLoadException NetworkImageLoadException({required int statusCode, required Uri uri})
  NetworkImageLoadException$Mate({
    /// optionalParameters: {required int statusCode} , default:none
    required super.statusCode,

    /// optionalParameters: {required Uri uri} , default:none
    required super.uri,
  })  : mateParams = {
          'statusCode': _i2.BuilderArg<int>(
            name: 'statusCode',
            init: statusCode,
            isNamed: true,
          ),
          'uri': _i2.BuilderArg<Uri>(
            name: 'uri',
            init: uri,
            isNamed: true,
          ),
        },
        super() {
    mateBuilderName = 'NetworkImageLoadException';
    matePackageUrl = 'package:flutter/cupertino.dart';
    mateBuilder = (p) => NetworkImageLoadException$Mate(
          statusCode: p.get('statusCode').build(),
          uri: p.get('uri').build(),
        );
  }

  @override
  final Map<String, _i2.BuilderArg> mateParams;
}