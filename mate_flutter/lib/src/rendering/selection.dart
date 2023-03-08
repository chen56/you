// /// Generated by mat_flutter, please don't edit! Created time: 2023-03-09 00:16:01.222040

library;

import 'dart:core';
import 'dart:ui';
import 'package:flutter/src/rendering/selection.dart';

/// abstract class SelectionHandler implements ValueListenable<SelectionGeometry>
abstract class SelectionHandlerMate {
  /// SelectionHandler SelectionHandler()
  SelectionHandlerMate() {}
}

/// class SelectedContent
class SelectedContentMate {
  /// SelectedContent SelectedContent({required String plainText})
  SelectedContentMate(
      {
// param: {required String plainText}
      required String plainText}) {}
}

/// class SelectionUtils
class SelectionUtilsMate {}

/// abstract class SelectionEvent
abstract class SelectionEventMate {}

/// class SelectAllSelectionEvent extends SelectionEvent
class SelectAllSelectionEventMate {
  /// SelectAllSelectionEvent SelectAllSelectionEvent()
  SelectAllSelectionEventMate() {}
}

/// class ClearSelectionEvent extends SelectionEvent
class ClearSelectionEventMate {
  /// ClearSelectionEvent ClearSelectionEvent()
  ClearSelectionEventMate() {}
}

/// class SelectWordSelectionEvent extends SelectionEvent
class SelectWordSelectionEventMate {
  /// SelectWordSelectionEvent SelectWordSelectionEvent({required Offset globalPosition})
  SelectWordSelectionEventMate(
      {
// param: {required Offset globalPosition}
      required Offset globalPosition}) {}
}

/// class SelectionEdgeUpdateEvent extends SelectionEvent
class SelectionEdgeUpdateEventMate {
  /// SelectionEdgeUpdateEvent SelectionEdgeUpdateEvent.forStart({required Offset globalPosition})
  SelectionEdgeUpdateEventMate.forStart(
      {
// param: {required Offset globalPosition}
      required Offset globalPosition}) {}

  /// SelectionEdgeUpdateEvent SelectionEdgeUpdateEvent.forEnd({required Offset globalPosition})
  SelectionEdgeUpdateEventMate.forEnd(
      {
// param: {required Offset globalPosition}
      required Offset globalPosition}) {}
}

/// class GranularlyExtendSelectionEvent extends SelectionEvent
class GranularlyExtendSelectionEventMate {
  /// GranularlyExtendSelectionEvent GranularlyExtendSelectionEvent({required bool forward, required bool isEnd, required TextGranularity granularity})
  GranularlyExtendSelectionEventMate({
// param: {required bool forward}
    required bool forward,
// param: {required bool isEnd}
    required bool isEnd,
// param: {required TextGranularity granularity}
    required TextGranularity granularity,
  }) {}
}

/// class DirectionallyExtendSelectionEvent extends SelectionEvent
class DirectionallyExtendSelectionEventMate {
  /// DirectionallyExtendSelectionEvent DirectionallyExtendSelectionEvent({required double dx, required bool isEnd, required SelectionExtendDirection direction})
  DirectionallyExtendSelectionEventMate({
// param: {required double dx}
    required double dx,
// param: {required bool isEnd}
    required bool isEnd,
// param: {required SelectionExtendDirection direction}
    required SelectionExtendDirection direction,
  }) {}
}

/// abstract class SelectionRegistrar
abstract class SelectionRegistrarMate {
  /// SelectionRegistrar SelectionRegistrar()
  SelectionRegistrarMate() {}
}

/// class SelectionGeometry
class SelectionGeometryMate {
  /// SelectionGeometry SelectionGeometry({SelectionPoint? startSelectionPoint, SelectionPoint? endSelectionPoint, required SelectionStatus status, required bool hasContent})
  SelectionGeometryMate({
// param: {SelectionPoint? startSelectionPoint}
    SelectionPoint? startSelectionPoint,
// param: {SelectionPoint? endSelectionPoint}
    SelectionPoint? endSelectionPoint,
// param: {required SelectionStatus status}
    required SelectionStatus status,
// param: {required bool hasContent}
    required bool hasContent,
  }) {}
}

/// class SelectionPoint
class SelectionPointMate {
  /// SelectionPoint SelectionPoint({required Offset localPosition, required double lineHeight, required TextSelectionHandleType handleType})
  SelectionPointMate({
// param: {required Offset localPosition}
    required Offset localPosition,
// param: {required double lineHeight}
    required double lineHeight,
// param: {required TextSelectionHandleType handleType}
    required TextSelectionHandleType handleType,
  }) {}
}
