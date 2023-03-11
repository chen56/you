// /// Generated by mate_flutter, please don't edit!

import 'package:flutter/src/rendering/layer.dart';
import 'dart:ui';
import 'package:note/mate.dart';
import 'dart:core';
import 'package:vector_math/vector_math_64.dart';

/// class AnnotationEntry<T>
class AnnotationEntry$Mate<T> extends AnnotationEntry<T> with Mate<AnnotationEntry$Mate> {
  /// AnnotationEntry<T> AnnotationEntry({required T annotation, required Offset localPosition})
  AnnotationEntry$Mate({
    /// param: {required T annotation}
    required T annotation,

    /// param: {required Offset localPosition}
    required Offset localPosition,
  }) : super(
          annotation: annotation,
          localPosition: localPosition,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => AnnotationEntry$Mate(
        annotation: p.getValue('annotation'),
        localPosition: p.getValue('localPosition'),
      ),
    );
    mateParams.set(name: 'annotation', init: annotation);
    mateParams.set(name: 'localPosition', init: localPosition);
  }
}

/// class LayerHandle<T extends Layer>
class LayerHandle$Mate<T extends Layer> extends LayerHandle<T> with Mate<LayerHandle$Mate> {
  /// LayerHandle<T> LayerHandle([T? _layer])
  LayerHandle$Mate(

      /// param: [T? _layer]
      T? _layer)
      : super(_layer) {
    mateParams = Params(
      init: this,
      builder: (p) => LayerHandle$Mate(p.getValue('_layer')),
    );
    mateParams.set(name: '_layer', init: _layer);
  }
}

/// class PictureLayer extends Layer
class PictureLayer$Mate extends PictureLayer with Mate<PictureLayer$Mate> {
  /// PictureLayer PictureLayer(Rect canvasBounds)
  PictureLayer$Mate(

      /// param: Rect canvasBounds
      Rect canvasBounds)
      : super(canvasBounds) {
    mateParams = Params(
      init: this,
      builder: (p) => PictureLayer$Mate(p.getValue('canvasBounds')),
    );
    mateParams.set(name: 'canvasBounds', init: canvasBounds);
  }
}

/// class TextureLayer extends Layer
class TextureLayer$Mate extends TextureLayer with Mate<TextureLayer$Mate> {
  /// TextureLayer TextureLayer({required Rect rect, required int textureId, bool freeze = false, FilterQuality filterQuality = ui.FilterQuality.low})
  TextureLayer$Mate({
    /// param: {required Rect rect}
    required Rect rect,

    /// param: {required int textureId}
    required int textureId,

    /// param: {bool freeze = false}
    required bool freeze,

    /// param: {FilterQuality filterQuality = ui.FilterQuality.low}
    required FilterQuality filterQuality,
  }) : super(
          rect: rect,
          textureId: textureId,
          freeze: freeze,
          filterQuality: filterQuality,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => TextureLayer$Mate(
        rect: p.getValue('rect'),
        textureId: p.getValue('textureId'),
        freeze: p.getValue('freeze'),
        filterQuality: p.getValue('filterQuality'),
      ),
    );
    mateParams.set(name: 'rect', init: rect);
    mateParams.set(name: 'textureId', init: textureId);
    mateParams.set(name: 'freeze', init: freeze);
    mateParams.set(name: 'filterQuality', init: filterQuality);
  }
}

/// class PlatformViewLayer extends Layer
class PlatformViewLayer$Mate extends PlatformViewLayer with Mate<PlatformViewLayer$Mate> {
  /// PlatformViewLayer PlatformViewLayer({required Rect rect, required int viewId})
  PlatformViewLayer$Mate({
    /// param: {required Rect rect}
    required Rect rect,

    /// param: {required int viewId}
    required int viewId,
  }) : super(
          rect: rect,
          viewId: viewId,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => PlatformViewLayer$Mate(
        rect: p.getValue('rect'),
        viewId: p.getValue('viewId'),
      ),
    );
    mateParams.set(name: 'rect', init: rect);
    mateParams.set(name: 'viewId', init: viewId);
  }
}

/// class PerformanceOverlayLayer extends Layer
class PerformanceOverlayLayer$Mate extends PerformanceOverlayLayer with Mate<PerformanceOverlayLayer$Mate> {
  /// PerformanceOverlayLayer PerformanceOverlayLayer({required Rect overlayRect, required int optionsMask, required int rasterizerThreshold, required bool checkerboardRasterCacheImages, required bool checkerboardOffscreenLayers})
  PerformanceOverlayLayer$Mate({
    /// param: {required Rect overlayRect}
    required Rect overlayRect,

    /// param: {required int optionsMask}
    required int optionsMask,

    /// param: {required int rasterizerThreshold}
    required int rasterizerThreshold,

    /// param: {required bool checkerboardRasterCacheImages}
    required bool checkerboardRasterCacheImages,

    /// param: {required bool checkerboardOffscreenLayers}
    required bool checkerboardOffscreenLayers,
  }) : super(
          overlayRect: overlayRect,
          optionsMask: optionsMask,
          rasterizerThreshold: rasterizerThreshold,
          checkerboardRasterCacheImages: checkerboardRasterCacheImages,
          checkerboardOffscreenLayers: checkerboardOffscreenLayers,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => PerformanceOverlayLayer$Mate(
        overlayRect: p.getValue('overlayRect'),
        optionsMask: p.getValue('optionsMask'),
        rasterizerThreshold: p.getValue('rasterizerThreshold'),
        checkerboardRasterCacheImages: p.getValue('checkerboardRasterCacheImages'),
        checkerboardOffscreenLayers: p.getValue('checkerboardOffscreenLayers'),
      ),
    );
    mateParams.set(name: 'overlayRect', init: overlayRect);
    mateParams.set(name: 'optionsMask', init: optionsMask);
    mateParams.set(name: 'rasterizerThreshold', init: rasterizerThreshold);
    mateParams.set(name: 'checkerboardRasterCacheImages', init: checkerboardRasterCacheImages);
    mateParams.set(name: 'checkerboardOffscreenLayers', init: checkerboardOffscreenLayers);
  }
}

/// class OffsetLayer extends ContainerLayer
class OffsetLayer$Mate extends OffsetLayer with Mate<OffsetLayer$Mate> {
  /// OffsetLayer OffsetLayer({Offset offset = Offset.zero})
  OffsetLayer$Mate(
      {
      /// param: {Offset offset = Offset.zero}
      required Offset offset})
      : super(offset: offset) {
    mateParams = Params(
      init: this,
      builder: (p) => OffsetLayer$Mate(offset: p.getValue('offset')),
    );
    mateParams.set(name: 'offset', init: offset);
  }
}

/// class ClipRectLayer extends ContainerLayer
class ClipRectLayer$Mate extends ClipRectLayer with Mate<ClipRectLayer$Mate> {
  /// ClipRectLayer ClipRectLayer({Rect? clipRect, Clip clipBehavior = Clip.hardEdge})
  ClipRectLayer$Mate({
    /// param: {Rect? clipRect}
    Rect? clipRect,

    /// param: {Clip clipBehavior = Clip.hardEdge}
    required Clip clipBehavior,
  }) : super(
          clipRect: clipRect,
          clipBehavior: clipBehavior,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => ClipRectLayer$Mate(
        clipRect: p.getValue('clipRect'),
        clipBehavior: p.getValue('clipBehavior'),
      ),
    );
    mateParams.set(name: 'clipRect', init: clipRect);
    mateParams.set(name: 'clipBehavior', init: clipBehavior);
  }
}

/// class ClipRRectLayer extends ContainerLayer
class ClipRRectLayer$Mate extends ClipRRectLayer with Mate<ClipRRectLayer$Mate> {
  /// ClipRRectLayer ClipRRectLayer({RRect? clipRRect, Clip clipBehavior = Clip.antiAlias})
  ClipRRectLayer$Mate({
    /// param: {RRect? clipRRect}
    RRect? clipRRect,

    /// param: {Clip clipBehavior = Clip.antiAlias}
    required Clip clipBehavior,
  }) : super(
          clipRRect: clipRRect,
          clipBehavior: clipBehavior,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => ClipRRectLayer$Mate(
        clipRRect: p.getValue('clipRRect'),
        clipBehavior: p.getValue('clipBehavior'),
      ),
    );
    mateParams.set(name: 'clipRRect', init: clipRRect);
    mateParams.set(name: 'clipBehavior', init: clipBehavior);
  }
}

/// class ClipPathLayer extends ContainerLayer
class ClipPathLayer$Mate extends ClipPathLayer with Mate<ClipPathLayer$Mate> {
  /// ClipPathLayer ClipPathLayer({Path? clipPath, Clip clipBehavior = Clip.antiAlias})
  ClipPathLayer$Mate({
    /// param: {Path? clipPath}
    Path? clipPath,

    /// param: {Clip clipBehavior = Clip.antiAlias}
    required Clip clipBehavior,
  }) : super(
          clipPath: clipPath,
          clipBehavior: clipBehavior,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => ClipPathLayer$Mate(
        clipPath: p.getValue('clipPath'),
        clipBehavior: p.getValue('clipBehavior'),
      ),
    );
    mateParams.set(name: 'clipPath', init: clipPath);
    mateParams.set(name: 'clipBehavior', init: clipBehavior);
  }
}

/// class ColorFilterLayer extends ContainerLayer
class ColorFilterLayer$Mate extends ColorFilterLayer with Mate<ColorFilterLayer$Mate> {
  /// ColorFilterLayer ColorFilterLayer({ColorFilter? colorFilter})
  ColorFilterLayer$Mate(
      {
      /// param: {ColorFilter? colorFilter}
      ColorFilter? colorFilter})
      : super(colorFilter: colorFilter) {
    mateParams = Params(
      init: this,
      builder: (p) => ColorFilterLayer$Mate(colorFilter: p.getValue('colorFilter')),
    );
    mateParams.set(name: 'colorFilter', init: colorFilter);
  }
}

/// class ImageFilterLayer extends OffsetLayer
class ImageFilterLayer$Mate extends ImageFilterLayer with Mate<ImageFilterLayer$Mate> {
  /// ImageFilterLayer ImageFilterLayer({ImageFilter? imageFilter, Offset offset = Offset.zero})
  ImageFilterLayer$Mate({
    /// param: {ImageFilter? imageFilter}
    ImageFilter? imageFilter,

    /// param: {Offset offset = Offset.zero}
    required Offset offset,
  }) : super(
          imageFilter: imageFilter,
          offset: offset,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => ImageFilterLayer$Mate(
        imageFilter: p.getValue('imageFilter'),
        offset: p.getValue('offset'),
      ),
    );
    mateParams.set(name: 'imageFilter', init: imageFilter);
    mateParams.set(name: 'offset', init: offset);
  }
}

/// class TransformLayer extends OffsetLayer
class TransformLayer$Mate extends TransformLayer with Mate<TransformLayer$Mate> {
  /// TransformLayer TransformLayer({Matrix4? transform, Offset offset = Offset.zero})
  TransformLayer$Mate({
    /// param: {Matrix4? transform}
    Matrix4? transform,

    /// param: {Offset offset = Offset.zero}
    required Offset offset,
  }) : super(
          transform: transform,
          offset: offset,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => TransformLayer$Mate(
        transform: p.getValue('transform'),
        offset: p.getValue('offset'),
      ),
    );
    mateParams.set(name: 'transform', init: transform);
    mateParams.set(name: 'offset', init: offset);
  }
}

/// class OpacityLayer extends OffsetLayer
class OpacityLayer$Mate extends OpacityLayer with Mate<OpacityLayer$Mate> {
  /// OpacityLayer OpacityLayer({int? alpha, Offset offset = Offset.zero})
  OpacityLayer$Mate({
    /// param: {int? alpha}
    int? alpha,

    /// param: {Offset offset = Offset.zero}
    required Offset offset,
  }) : super(
          alpha: alpha,
          offset: offset,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => OpacityLayer$Mate(
        alpha: p.getValue('alpha'),
        offset: p.getValue('offset'),
      ),
    );
    mateParams.set(name: 'alpha', init: alpha);
    mateParams.set(name: 'offset', init: offset);
  }
}

/// class ShaderMaskLayer extends ContainerLayer
class ShaderMaskLayer$Mate extends ShaderMaskLayer with Mate<ShaderMaskLayer$Mate> {
  /// ShaderMaskLayer ShaderMaskLayer({Shader? shader, Rect? maskRect, BlendMode? blendMode})
  ShaderMaskLayer$Mate({
    /// param: {Shader? shader}
    Shader? shader,

    /// param: {Rect? maskRect}
    Rect? maskRect,

    /// param: {BlendMode? blendMode}
    BlendMode? blendMode,
  }) : super(
          shader: shader,
          maskRect: maskRect,
          blendMode: blendMode,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => ShaderMaskLayer$Mate(
        shader: p.getValue('shader'),
        maskRect: p.getValue('maskRect'),
        blendMode: p.getValue('blendMode'),
      ),
    );
    mateParams.set(name: 'shader', init: shader);
    mateParams.set(name: 'maskRect', init: maskRect);
    mateParams.set(name: 'blendMode', init: blendMode);
  }
}

/// class BackdropFilterLayer extends ContainerLayer
class BackdropFilterLayer$Mate extends BackdropFilterLayer with Mate<BackdropFilterLayer$Mate> {
  /// BackdropFilterLayer BackdropFilterLayer({ImageFilter? filter, BlendMode blendMode = BlendMode.srcOver})
  BackdropFilterLayer$Mate({
    /// param: {ImageFilter? filter}
    ImageFilter? filter,

    /// param: {BlendMode blendMode = BlendMode.srcOver}
    required BlendMode blendMode,
  }) : super(
          filter: filter,
          blendMode: blendMode,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => BackdropFilterLayer$Mate(
        filter: p.getValue('filter'),
        blendMode: p.getValue('blendMode'),
      ),
    );
    mateParams.set(name: 'filter', init: filter);
    mateParams.set(name: 'blendMode', init: blendMode);
  }
}

/// class PhysicalModelLayer extends ContainerLayer
class PhysicalModelLayer$Mate extends PhysicalModelLayer with Mate<PhysicalModelLayer$Mate> {
  /// PhysicalModelLayer PhysicalModelLayer({Path? clipPath, Clip clipBehavior = Clip.none, double? elevation, Color? color, Color? shadowColor})
  PhysicalModelLayer$Mate({
    /// param: {Path? clipPath}
    Path? clipPath,

    /// param: {Clip clipBehavior = Clip.none}
    required Clip clipBehavior,

    /// param: {double? elevation}
    double? elevation,

    /// param: {Color? color}
    Color? color,

    /// param: {Color? shadowColor}
    Color? shadowColor,
  }) : super(
          clipPath: clipPath,
          clipBehavior: clipBehavior,
          elevation: elevation,
          color: color,
          shadowColor: shadowColor,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => PhysicalModelLayer$Mate(
        clipPath: p.getValue('clipPath'),
        clipBehavior: p.getValue('clipBehavior'),
        elevation: p.getValue('elevation'),
        color: p.getValue('color'),
        shadowColor: p.getValue('shadowColor'),
      ),
    );
    mateParams.set(name: 'clipPath', init: clipPath);
    mateParams.set(name: 'clipBehavior', init: clipBehavior);
    mateParams.set(name: 'elevation', init: elevation);
    mateParams.set(name: 'color', init: color);
    mateParams.set(name: 'shadowColor', init: shadowColor);
  }
}

/// class LeaderLayer extends ContainerLayer
class LeaderLayer$Mate extends LeaderLayer with Mate<LeaderLayer$Mate> {
  /// LeaderLayer LeaderLayer({required LayerLink link, Offset offset = Offset.zero})
  LeaderLayer$Mate({
    /// param: {required LayerLink link}
    required LayerLink link,

    /// param: {Offset offset = Offset.zero}
    required Offset offset,
  }) : super(
          link: link,
          offset: offset,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => LeaderLayer$Mate(
        link: p.getValue('link'),
        offset: p.getValue('offset'),
      ),
    );
    mateParams.set(name: 'link', init: link);
    mateParams.set(name: 'offset', init: offset);
  }
}

/// class FollowerLayer extends ContainerLayer
class FollowerLayer$Mate extends FollowerLayer with Mate<FollowerLayer$Mate> {
  /// FollowerLayer FollowerLayer({required LayerLink link, bool? showWhenUnlinked = true, Offset? unlinkedOffset = Offset.zero, Offset? linkedOffset = Offset.zero})
  FollowerLayer$Mate({
    /// param: {required LayerLink link}
    required LayerLink link,

    /// param: {bool? showWhenUnlinked = true}
    bool? showWhenUnlinked,

    /// param: {Offset? unlinkedOffset = Offset.zero}
    Offset? unlinkedOffset,

    /// param: {Offset? linkedOffset = Offset.zero}
    Offset? linkedOffset,
  }) : super(
          link: link,
          showWhenUnlinked: showWhenUnlinked,
          unlinkedOffset: unlinkedOffset,
          linkedOffset: linkedOffset,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => FollowerLayer$Mate(
        link: p.getValue('link'),
        showWhenUnlinked: p.getValue('showWhenUnlinked'),
        unlinkedOffset: p.getValue('unlinkedOffset'),
        linkedOffset: p.getValue('linkedOffset'),
      ),
    );
    mateParams.set(name: 'link', init: link);
    mateParams.set(name: 'showWhenUnlinked', init: showWhenUnlinked);
    mateParams.set(name: 'unlinkedOffset', init: unlinkedOffset);
    mateParams.set(name: 'linkedOffset', init: linkedOffset);
  }
}

/// class AnnotatedRegionLayer<T extends Object> extends ContainerLayer
class AnnotatedRegionLayer$Mate<T extends Object> extends AnnotatedRegionLayer<T> with Mate<AnnotatedRegionLayer$Mate> {
  /// AnnotatedRegionLayer<T> AnnotatedRegionLayer(T value, {Size? size, Offset? offset, bool opaque = false})
  AnnotatedRegionLayer$Mate(
    /// param: T value
    T value, {
    /// param: {Size? size}
    Size? size,

    /// param: {Offset? offset}
    Offset? offset,

    /// param: {bool opaque = false}
    required bool opaque,
  }) : super(
          value,
          size: size,
          offset: offset,
          opaque: opaque,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => AnnotatedRegionLayer$Mate(
        p.getValue('value'),
        size: p.getValue('size'),
        offset: p.getValue('offset'),
        opaque: p.getValue('opaque'),
      ),
    );
    mateParams.set(name: 'value', init: value);
    mateParams.set(name: 'size', init: size);
    mateParams.set(name: 'offset', init: offset);
    mateParams.set(name: 'opaque', init: opaque);
  }
}
