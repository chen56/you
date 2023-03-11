// /// Generated by mate_flutter, please don't edit!

import 'package:flutter/src/rendering/selection.dart';
import 'dart:core';
import 'package:note/mate.dart';
import 'dart:ui';

/// class SelectedContent
class SelectedContent$Mate extends SelectedContent with Mate<SelectedContent$Mate> {
  /// SelectedContent SelectedContent({required String plainText})
  SelectedContent$Mate(
      {
      /// param: {required String plainText}
      required String plainText})
      : super(plainText: plainText) {
    mateParams = Params(
      init: this,
      builder: (p) => SelectedContent$Mate(plainText: p.getValue('plainText')),
    );
    mateParams.set(name: 'plainText', init: plainText);
  }
}

/// class SelectWordSelectionEvent extends SelectionEvent
class SelectWordSelectionEvent$Mate extends SelectWordSelectionEvent with Mate<SelectWordSelectionEvent$Mate> {
  /// SelectWordSelectionEvent SelectWordSelectionEvent({required Offset globalPosition})
  SelectWordSelectionEvent$Mate(
      {
      /// param: {required Offset globalPosition}
      required Offset globalPosition})
      : super(globalPosition: globalPosition) {
    mateParams = Params(
      init: this,
      builder: (p) => SelectWordSelectionEvent$Mate(globalPosition: p.getValue('globalPosition')),
    );
    mateParams.set(name: 'globalPosition', init: globalPosition);
  }
}

/// class SelectionEdgeUpdateEvent extends SelectionEvent
class SelectionEdgeUpdateEvent$Mate extends SelectionEdgeUpdateEvent with Mate<SelectionEdgeUpdateEvent$Mate> {
  /// SelectionEdgeUpdateEvent SelectionEdgeUpdateEvent.forStart({required Offset globalPosition})
  SelectionEdgeUpdateEvent$Mate.forStart(
      {
      /// param: {required Offset globalPosition}
      required Offset globalPosition})
      : super.forStart(globalPosition: globalPosition) {
    mateParams = Params(
      init: this,
      builder: (p) => SelectionEdgeUpdateEvent$Mate.forStart(globalPosition: p.getValue('globalPosition')),
    );
    mateParams.set(name: 'globalPosition', init: globalPosition);
  }

  /// SelectionEdgeUpdateEvent SelectionEdgeUpdateEvent.forEnd({required Offset globalPosition})
  SelectionEdgeUpdateEvent$Mate.forEnd(
      {
      /// param: {required Offset globalPosition}
      required Offset globalPosition})
      : super.forEnd(globalPosition: globalPosition) {
    mateParams = Params(
      init: this,
      builder: (p) => SelectionEdgeUpdateEvent$Mate.forEnd(globalPosition: p.getValue('globalPosition')),
    );
    mateParams.set(name: 'globalPosition', init: globalPosition);
  }
}

/// class GranularlyExtendSelectionEvent extends SelectionEvent
class GranularlyExtendSelectionEvent$Mate extends GranularlyExtendSelectionEvent
    with Mate<GranularlyExtendSelectionEvent$Mate> {
  /// GranularlyExtendSelectionEvent GranularlyExtendSelectionEvent({required bool forward, required bool isEnd, required TextGranularity granularity})
  GranularlyExtendSelectionEvent$Mate({
    /// param: {required bool forward}
    required bool forward,

    /// param: {required bool isEnd}
    required bool isEnd,

    /// param: {required TextGranularity granularity}
    required TextGranularity granularity,
  }) : super(
          forward: forward,
          isEnd: isEnd,
          granularity: granularity,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => GranularlyExtendSelectionEvent$Mate(
        forward: p.getValue('forward'),
        isEnd: p.getValue('isEnd'),
        granularity: p.getValue('granularity'),
      ),
    );
    mateParams.set(name: 'forward', init: forward);
    mateParams.set(name: 'isEnd', init: isEnd);
    mateParams.set(name: 'granularity', init: granularity);
  }
}

/// class DirectionallyExtendSelectionEvent extends SelectionEvent
class DirectionallyExtendSelectionEvent$Mate extends DirectionallyExtendSelectionEvent
    with Mate<DirectionallyExtendSelectionEvent$Mate> {
  /// DirectionallyExtendSelectionEvent DirectionallyExtendSelectionEvent({required double dx, required bool isEnd, required SelectionExtendDirection direction})
  DirectionallyExtendSelectionEvent$Mate({
    /// param: {required double dx}
    required double dx,

    /// param: {required bool isEnd}
    required bool isEnd,

    /// param: {required SelectionExtendDirection direction}
    required SelectionExtendDirection direction,
  }) : super(
          dx: dx,
          isEnd: isEnd,
          direction: direction,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => DirectionallyExtendSelectionEvent$Mate(
        dx: p.getValue('dx'),
        isEnd: p.getValue('isEnd'),
        direction: p.getValue('direction'),
      ),
    );
    mateParams.set(name: 'dx', init: dx);
    mateParams.set(name: 'isEnd', init: isEnd);
    mateParams.set(name: 'direction', init: direction);
  }
}

/// class SelectionGeometry
class SelectionGeometry$Mate extends SelectionGeometry with Mate<SelectionGeometry$Mate> {
  /// SelectionGeometry SelectionGeometry({SelectionPoint? startSelectionPoint, SelectionPoint? endSelectionPoint, required SelectionStatus status, required bool hasContent})
  SelectionGeometry$Mate({
    /// param: {SelectionPoint? startSelectionPoint}
    SelectionPoint? startSelectionPoint,

    /// param: {SelectionPoint? endSelectionPoint}
    SelectionPoint? endSelectionPoint,

    /// param: {required SelectionStatus status}
    required SelectionStatus status,

    /// param: {required bool hasContent}
    required bool hasContent,
  }) : super(
          startSelectionPoint: startSelectionPoint,
          endSelectionPoint: endSelectionPoint,
          status: status,
          hasContent: hasContent,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => SelectionGeometry$Mate(
        startSelectionPoint: p.getValue('startSelectionPoint'),
        endSelectionPoint: p.getValue('endSelectionPoint'),
        status: p.getValue('status'),
        hasContent: p.getValue('hasContent'),
      ),
    );
    mateParams.set(name: 'startSelectionPoint', init: startSelectionPoint);
    mateParams.set(name: 'endSelectionPoint', init: endSelectionPoint);
    mateParams.set(name: 'status', init: status);
    mateParams.set(name: 'hasContent', init: hasContent);
  }
}

/// class SelectionPoint
class SelectionPoint$Mate extends SelectionPoint with Mate<SelectionPoint$Mate> {
  /// SelectionPoint SelectionPoint({required Offset localPosition, required double lineHeight, required TextSelectionHandleType handleType})
  SelectionPoint$Mate({
    /// param: {required Offset localPosition}
    required Offset localPosition,

    /// param: {required double lineHeight}
    required double lineHeight,

    /// param: {required TextSelectionHandleType handleType}
    required TextSelectionHandleType handleType,
  }) : super(
          localPosition: localPosition,
          lineHeight: lineHeight,
          handleType: handleType,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => SelectionPoint$Mate(
        localPosition: p.getValue('localPosition'),
        lineHeight: p.getValue('lineHeight'),
        handleType: p.getValue('handleType'),
      ),
    );
    mateParams.set(name: 'localPosition', init: localPosition);
    mateParams.set(name: 'lineHeight', init: lineHeight);
    mateParams.set(name: 'handleType', init: handleType);
  }
}
