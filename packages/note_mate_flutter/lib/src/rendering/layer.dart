// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/rendering/layer.dart';
import 'package:note/mate.dart';
import 'dart:ui';
import 'dart:core';
import 'package:vector_math/vector_math_64.dart';

/// class AnnotationEntry<T>
class AnnotationEntry$Mate<T> extends AnnotationEntry<T> with Mate {
  /// AnnotationEntry<T> AnnotationEntry({required T annotation, required Offset localPosition})
  AnnotationEntry$Mate({
    /// optionalParameters: {required T annotation} , defaultValue:none
    required T annotation,

    /// optionalParameters: {required Offset localPosition} , defaultValue:none
    required Offset localPosition,
  }) : super(
          annotation: annotation,
          localPosition: localPosition,
        ) {
    mateCreateName = 'AnnotationEntry';
    matePackageUrl = 'package:flutter/rendering.dart';
    mateBuilder = (p) => AnnotationEntry$Mate<T>(
          annotation: p.get('annotation').build(),
          localPosition: p.get('localPosition').build(),
        );
    mateUse('annotation', annotation);
    mateUse('localPosition', localPosition);
  }
}

/// class LayerHandle<T extends Layer>
class LayerHandle$Mate<T extends Layer> extends LayerHandle<T> with Mate {
  /// LayerHandle<T> LayerHandle([T? _layer])
  LayerHandle$Mate(

      /// requiredParameters: [T? _layer]
      T? _layer)
      : super(_layer) {
    mateCreateName = 'LayerHandle';
    matePackageUrl = 'package:flutter/rendering.dart';
    mateBuilder = (p) => LayerHandle$Mate<T>(p.get('_layer').value);
    mateUse('_layer', _layer);
  }
}

/// class PictureLayer extends Layer
class PictureLayer$Mate extends PictureLayer with Mate {
  /// PictureLayer PictureLayer(Rect canvasBounds)
  PictureLayer$Mate(

      /// requiredParameters: Rect canvasBounds
      Rect canvasBounds)
      : super(canvasBounds) {
    mateCreateName = 'PictureLayer';
    matePackageUrl = 'package:flutter/rendering.dart';
    mateBuilder = (p) => PictureLayer$Mate(p.get('canvasBounds').value);
    mateUse('canvasBounds', canvasBounds);
  }
}

/// class TextureLayer extends Layer
class TextureLayer$Mate extends TextureLayer with Mate {
  /// TextureLayer TextureLayer({required Rect rect, required int textureId, bool freeze = false, FilterQuality filterQuality = ui.FilterQuality.low})
  TextureLayer$Mate({
    /// optionalParameters: {required Rect rect} , defaultValue:none
    required Rect rect,

    /// optionalParameters: {required int textureId} , defaultValue:none
    required int textureId,

    /// optionalParameters: {bool freeze = false} , defaultValue:Literal
    bool freeze = false,

    /// optionalParameters: {FilterQuality filterQuality = ui.FilterQuality.low} , defaultValue:unprocessed
    required FilterQuality filterQuality,
  }) : super(
          rect: rect,
          textureId: textureId,
          freeze: freeze,
          filterQuality: filterQuality,
        ) {
    mateCreateName = 'TextureLayer';
    matePackageUrl = 'package:flutter/rendering.dart';
    mateBuilder = (p) => TextureLayer$Mate(
          rect: p.get('rect').build(),
          textureId: p.get('textureId').build(),
          freeze: p.get('freeze').build(),
          filterQuality: p.get('filterQuality').build(),
        );
    mateUse('rect', rect);
    mateUse('textureId', textureId);
    mateUse('freeze', freeze);
    mateUse('filterQuality', filterQuality);
  }
}

/// class PlatformViewLayer extends Layer
class PlatformViewLayer$Mate extends PlatformViewLayer with Mate {
  /// PlatformViewLayer PlatformViewLayer({required Rect rect, required int viewId})
  PlatformViewLayer$Mate({
    /// optionalParameters: {required Rect rect} , defaultValue:none
    required Rect rect,

    /// optionalParameters: {required int viewId} , defaultValue:none
    required int viewId,
  }) : super(
          rect: rect,
          viewId: viewId,
        ) {
    mateCreateName = 'PlatformViewLayer';
    matePackageUrl = 'package:flutter/rendering.dart';
    mateBuilder = (p) => PlatformViewLayer$Mate(
          rect: p.get('rect').build(),
          viewId: p.get('viewId').build(),
        );
    mateUse('rect', rect);
    mateUse('viewId', viewId);
  }
}

/// class PerformanceOverlayLayer extends Layer
class PerformanceOverlayLayer$Mate extends PerformanceOverlayLayer with Mate {
  /// PerformanceOverlayLayer PerformanceOverlayLayer({required Rect overlayRect, required int optionsMask, required int rasterizerThreshold, required bool checkerboardRasterCacheImages, required bool checkerboardOffscreenLayers})
  PerformanceOverlayLayer$Mate({
    /// optionalParameters: {required Rect overlayRect} , defaultValue:none
    required Rect overlayRect,

    /// optionalParameters: {required int optionsMask} , defaultValue:none
    required int optionsMask,

    /// optionalParameters: {required int rasterizerThreshold} , defaultValue:none
    required int rasterizerThreshold,

    /// optionalParameters: {required bool checkerboardRasterCacheImages} , defaultValue:none
    required bool checkerboardRasterCacheImages,

    /// optionalParameters: {required bool checkerboardOffscreenLayers} , defaultValue:none
    required bool checkerboardOffscreenLayers,
  }) : super(
          overlayRect: overlayRect,
          optionsMask: optionsMask,
          rasterizerThreshold: rasterizerThreshold,
          checkerboardRasterCacheImages: checkerboardRasterCacheImages,
          checkerboardOffscreenLayers: checkerboardOffscreenLayers,
        ) {
    mateCreateName = 'PerformanceOverlayLayer';
    matePackageUrl = 'package:flutter/rendering.dart';
    mateBuilder = (p) => PerformanceOverlayLayer$Mate(
          overlayRect: p.get('overlayRect').build(),
          optionsMask: p.get('optionsMask').build(),
          rasterizerThreshold: p.get('rasterizerThreshold').build(),
          checkerboardRasterCacheImages: p.get('checkerboardRasterCacheImages').build(),
          checkerboardOffscreenLayers: p.get('checkerboardOffscreenLayers').build(),
        );
    mateUse('overlayRect', overlayRect);
    mateUse('optionsMask', optionsMask);
    mateUse('rasterizerThreshold', rasterizerThreshold);
    mateUse('checkerboardRasterCacheImages', checkerboardRasterCacheImages);
    mateUse('checkerboardOffscreenLayers', checkerboardOffscreenLayers);
  }
}

/// class OffsetLayer extends ContainerLayer
class OffsetLayer$Mate extends OffsetLayer with Mate {
  /// OffsetLayer OffsetLayer({Offset offset = Offset.zero})
  OffsetLayer$Mate(
      {
      /// optionalParameters: {Offset offset = Offset.zero} , defaultValue:unprocessed
      required Offset offset})
      : super(offset: offset) {
    mateCreateName = 'OffsetLayer';
    matePackageUrl = 'package:flutter/rendering.dart';
    mateBuilder = (p) => OffsetLayer$Mate(offset: p.get('offset').build());
    mateUse('offset', offset);
  }
}

/// class ClipRectLayer extends ContainerLayer
class ClipRectLayer$Mate extends ClipRectLayer with Mate {
  /// ClipRectLayer ClipRectLayer({Rect? clipRect, Clip clipBehavior = Clip.hardEdge})
  ClipRectLayer$Mate({
    /// optionalParameters: {Rect? clipRect} , defaultValue:none
    Rect? clipRect,

    /// optionalParameters: {Clip clipBehavior = Clip.hardEdge} , defaultValue:unprocessed
    required Clip clipBehavior,
  }) : super(
          clipRect: clipRect,
          clipBehavior: clipBehavior,
        ) {
    mateCreateName = 'ClipRectLayer';
    matePackageUrl = 'package:flutter/rendering.dart';
    mateBuilder = (p) => ClipRectLayer$Mate(
          clipRect: p.get('clipRect').build(),
          clipBehavior: p.get('clipBehavior').build(),
        );
    mateUse('clipRect', clipRect);
    mateUse('clipBehavior', clipBehavior);
  }
}

/// class ClipRRectLayer extends ContainerLayer
class ClipRRectLayer$Mate extends ClipRRectLayer with Mate {
  /// ClipRRectLayer ClipRRectLayer({RRect? clipRRect, Clip clipBehavior = Clip.antiAlias})
  ClipRRectLayer$Mate({
    /// optionalParameters: {RRect? clipRRect} , defaultValue:none
    RRect? clipRRect,

    /// optionalParameters: {Clip clipBehavior = Clip.antiAlias} , defaultValue:unprocessed
    required Clip clipBehavior,
  }) : super(
          clipRRect: clipRRect,
          clipBehavior: clipBehavior,
        ) {
    mateCreateName = 'ClipRRectLayer';
    matePackageUrl = 'package:flutter/rendering.dart';
    mateBuilder = (p) => ClipRRectLayer$Mate(
          clipRRect: p.get('clipRRect').build(),
          clipBehavior: p.get('clipBehavior').build(),
        );
    mateUse('clipRRect', clipRRect);
    mateUse('clipBehavior', clipBehavior);
  }
}

/// class ClipPathLayer extends ContainerLayer
class ClipPathLayer$Mate extends ClipPathLayer with Mate {
  /// ClipPathLayer ClipPathLayer({Path? clipPath, Clip clipBehavior = Clip.antiAlias})
  ClipPathLayer$Mate({
    /// optionalParameters: {Path? clipPath} , defaultValue:none
    Path? clipPath,

    /// optionalParameters: {Clip clipBehavior = Clip.antiAlias} , defaultValue:unprocessed
    required Clip clipBehavior,
  }) : super(
          clipPath: clipPath,
          clipBehavior: clipBehavior,
        ) {
    mateCreateName = 'ClipPathLayer';
    matePackageUrl = 'package:flutter/rendering.dart';
    mateBuilder = (p) => ClipPathLayer$Mate(
          clipPath: p.get('clipPath').build(),
          clipBehavior: p.get('clipBehavior').build(),
        );
    mateUse('clipPath', clipPath);
    mateUse('clipBehavior', clipBehavior);
  }
}

/// class ColorFilterLayer extends ContainerLayer
class ColorFilterLayer$Mate extends ColorFilterLayer with Mate {
  /// ColorFilterLayer ColorFilterLayer({ColorFilter? colorFilter})
  ColorFilterLayer$Mate(
      {
      /// optionalParameters: {ColorFilter? colorFilter} , defaultValue:none
      ColorFilter? colorFilter})
      : super(colorFilter: colorFilter) {
    mateCreateName = 'ColorFilterLayer';
    matePackageUrl = 'package:flutter/rendering.dart';
    mateBuilder = (p) => ColorFilterLayer$Mate(colorFilter: p.get('colorFilter').build());
    mateUse('colorFilter', colorFilter);
  }
}

/// class ImageFilterLayer extends OffsetLayer
class ImageFilterLayer$Mate extends ImageFilterLayer with Mate {
  /// ImageFilterLayer ImageFilterLayer({ImageFilter? imageFilter, Offset offset = Offset.zero})
  ImageFilterLayer$Mate({
    /// optionalParameters: {ImageFilter? imageFilter} , defaultValue:none
    ImageFilter? imageFilter,

    /// optionalParameters: {Offset offset = Offset.zero} , defaultValue:unprocessed
    required Offset offset,
  }) : super(
          imageFilter: imageFilter,
          offset: offset,
        ) {
    mateCreateName = 'ImageFilterLayer';
    matePackageUrl = 'package:flutter/rendering.dart';
    mateBuilder = (p) => ImageFilterLayer$Mate(
          imageFilter: p.get('imageFilter').build(),
          offset: p.get('offset').build(),
        );
    mateUse('imageFilter', imageFilter);
    mateUse('offset', offset);
  }
}

/// class TransformLayer extends OffsetLayer
class TransformLayer$Mate extends TransformLayer with Mate {
  /// TransformLayer TransformLayer({Matrix4? transform, Offset offset = Offset.zero})
  TransformLayer$Mate({
    /// optionalParameters: {Matrix4? transform} , defaultValue:none
    Matrix4? transform,

    /// optionalParameters: {Offset offset = Offset.zero} , defaultValue:unprocessed
    required Offset offset,
  }) : super(
          transform: transform,
          offset: offset,
        ) {
    mateCreateName = 'TransformLayer';
    matePackageUrl = 'package:flutter/rendering.dart';
    mateBuilder = (p) => TransformLayer$Mate(
          transform: p.get('transform').build(),
          offset: p.get('offset').build(),
        );
    mateUse('transform', transform);
    mateUse('offset', offset);
  }
}

/// class OpacityLayer extends OffsetLayer
class OpacityLayer$Mate extends OpacityLayer with Mate {
  /// OpacityLayer OpacityLayer({int? alpha, Offset offset = Offset.zero})
  OpacityLayer$Mate({
    /// optionalParameters: {int? alpha} , defaultValue:none
    int? alpha,

    /// optionalParameters: {Offset offset = Offset.zero} , defaultValue:unprocessed
    required Offset offset,
  }) : super(
          alpha: alpha,
          offset: offset,
        ) {
    mateCreateName = 'OpacityLayer';
    matePackageUrl = 'package:flutter/rendering.dart';
    mateBuilder = (p) => OpacityLayer$Mate(
          alpha: p.get('alpha').build(),
          offset: p.get('offset').build(),
        );
    mateUse('alpha', alpha);
    mateUse('offset', offset);
  }
}

/// class ShaderMaskLayer extends ContainerLayer
class ShaderMaskLayer$Mate extends ShaderMaskLayer with Mate {
  /// ShaderMaskLayer ShaderMaskLayer({Shader? shader, Rect? maskRect, BlendMode? blendMode})
  ShaderMaskLayer$Mate({
    /// optionalParameters: {Shader? shader} , defaultValue:none
    Shader? shader,

    /// optionalParameters: {Rect? maskRect} , defaultValue:none
    Rect? maskRect,

    /// optionalParameters: {BlendMode? blendMode} , defaultValue:none
    BlendMode? blendMode,
  }) : super(
          shader: shader,
          maskRect: maskRect,
          blendMode: blendMode,
        ) {
    mateCreateName = 'ShaderMaskLayer';
    matePackageUrl = 'package:flutter/rendering.dart';
    mateBuilder = (p) => ShaderMaskLayer$Mate(
          shader: p.get('shader').build(),
          maskRect: p.get('maskRect').build(),
          blendMode: p.get('blendMode').build(),
        );
    mateUse('shader', shader);
    mateUse('maskRect', maskRect);
    mateUse('blendMode', blendMode);
  }
}

/// class BackdropFilterLayer extends ContainerLayer
class BackdropFilterLayer$Mate extends BackdropFilterLayer with Mate {
  /// BackdropFilterLayer BackdropFilterLayer({ImageFilter? filter, BlendMode blendMode = BlendMode.srcOver})
  BackdropFilterLayer$Mate({
    /// optionalParameters: {ImageFilter? filter} , defaultValue:none
    ImageFilter? filter,

    /// optionalParameters: {BlendMode blendMode = BlendMode.srcOver} , defaultValue:unprocessed
    required BlendMode blendMode,
  }) : super(
          filter: filter,
          blendMode: blendMode,
        ) {
    mateCreateName = 'BackdropFilterLayer';
    matePackageUrl = 'package:flutter/rendering.dart';
    mateBuilder = (p) => BackdropFilterLayer$Mate(
          filter: p.get('filter').build(),
          blendMode: p.get('blendMode').build(),
        );
    mateUse('filter', filter);
    mateUse('blendMode', blendMode);
  }
}

/// class PhysicalModelLayer extends ContainerLayer
class PhysicalModelLayer$Mate extends PhysicalModelLayer with Mate {
  /// PhysicalModelLayer PhysicalModelLayer({Path? clipPath, Clip clipBehavior = Clip.none, double? elevation, Color? color, Color? shadowColor})
  PhysicalModelLayer$Mate({
    /// optionalParameters: {Path? clipPath} , defaultValue:none
    Path? clipPath,

    /// optionalParameters: {Clip clipBehavior = Clip.none} , defaultValue:unprocessed
    required Clip clipBehavior,

    /// optionalParameters: {double? elevation} , defaultValue:none
    double? elevation,

    /// optionalParameters: {Color? color} , defaultValue:none
    Color? color,

    /// optionalParameters: {Color? shadowColor} , defaultValue:none
    Color? shadowColor,
  }) : super(
          clipPath: clipPath,
          clipBehavior: clipBehavior,
          elevation: elevation,
          color: color,
          shadowColor: shadowColor,
        ) {
    mateCreateName = 'PhysicalModelLayer';
    matePackageUrl = 'package:flutter/rendering.dart';
    mateBuilder = (p) => PhysicalModelLayer$Mate(
          clipPath: p.get('clipPath').build(),
          clipBehavior: p.get('clipBehavior').build(),
          elevation: p.get('elevation').build(),
          color: p.get('color').build(),
          shadowColor: p.get('shadowColor').build(),
        );
    mateUse('clipPath', clipPath);
    mateUse('clipBehavior', clipBehavior);
    mateUse('elevation', elevation);
    mateUse('color', color);
    mateUse('shadowColor', shadowColor);
  }
}

/// class LeaderLayer extends ContainerLayer
class LeaderLayer$Mate extends LeaderLayer with Mate {
  /// LeaderLayer LeaderLayer({required LayerLink link, Offset offset = Offset.zero})
  LeaderLayer$Mate({
    /// optionalParameters: {required LayerLink link} , defaultValue:none
    required LayerLink link,

    /// optionalParameters: {Offset offset = Offset.zero} , defaultValue:unprocessed
    required Offset offset,
  }) : super(
          link: link,
          offset: offset,
        ) {
    mateCreateName = 'LeaderLayer';
    matePackageUrl = 'package:flutter/rendering.dart';
    mateBuilder = (p) => LeaderLayer$Mate(
          link: p.get('link').build(),
          offset: p.get('offset').build(),
        );
    mateUse('link', link);
    mateUse('offset', offset);
  }
}

/// class FollowerLayer extends ContainerLayer
class FollowerLayer$Mate extends FollowerLayer with Mate {
  /// FollowerLayer FollowerLayer({required LayerLink link, bool? showWhenUnlinked = true, Offset? unlinkedOffset = Offset.zero, Offset? linkedOffset = Offset.zero})
  FollowerLayer$Mate({
    /// optionalParameters: {required LayerLink link} , defaultValue:none
    required LayerLink link,

    /// optionalParameters: {bool? showWhenUnlinked = true} , defaultValue:Literal
    bool? showWhenUnlinked = true,

    /// optionalParameters: {Offset? unlinkedOffset = Offset.zero} , defaultValue:unprocessed
    Offset? unlinkedOffset,

    /// optionalParameters: {Offset? linkedOffset = Offset.zero} , defaultValue:unprocessed
    Offset? linkedOffset,
  }) : super(
          link: link,
          showWhenUnlinked: showWhenUnlinked,
          unlinkedOffset: unlinkedOffset,
          linkedOffset: linkedOffset,
        ) {
    mateCreateName = 'FollowerLayer';
    matePackageUrl = 'package:flutter/rendering.dart';
    mateBuilder = (p) => FollowerLayer$Mate(
          link: p.get('link').build(),
          showWhenUnlinked: p.get('showWhenUnlinked').build(),
          unlinkedOffset: p.get('unlinkedOffset').build(),
          linkedOffset: p.get('linkedOffset').build(),
        );
    mateUse('link', link);
    mateUse('showWhenUnlinked', showWhenUnlinked);
    mateUse('unlinkedOffset', unlinkedOffset);
    mateUse('linkedOffset', linkedOffset);
  }
}

/// class AnnotatedRegionLayer<T extends Object> extends ContainerLayer
class AnnotatedRegionLayer$Mate<T extends Object> extends AnnotatedRegionLayer<T> with Mate {
  /// AnnotatedRegionLayer<T> AnnotatedRegionLayer(T value, {Size? size, Offset? offset, bool opaque = false})
  AnnotatedRegionLayer$Mate(
    /// requiredParameters: T value
    T value, {
    /// optionalParameters: {Size? size} , defaultValue:none
    Size? size,

    /// optionalParameters: {Offset? offset} , defaultValue:none
    Offset? offset,

    /// optionalParameters: {bool opaque = false} , defaultValue:Literal
    bool opaque = false,
  }) : super(
          value,
          size: size,
          offset: offset,
          opaque: opaque,
        ) {
    mateCreateName = 'AnnotatedRegionLayer';
    matePackageUrl = 'package:flutter/rendering.dart';
    mateBuilder = (p) => AnnotatedRegionLayer$Mate<T>(
          p.get('value').value,
          size: p.get('size').build(),
          offset: p.get('offset').build(),
          opaque: p.get('opaque').build(),
        );
    mateUse('value', value);
    mateUse('size', size);
    mateUse('offset', offset);
    mateUse('opaque', opaque);
  }
}
