// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/services/raw_keyboard_android.dart';
import 'dart:core';
import 'package:note/mate.dart';

/// class RawKeyEventDataAndroid extends RawKeyEventData
class RawKeyEventDataAndroid$Mate extends RawKeyEventDataAndroid with Mate<RawKeyEventDataAndroid$Mate> {
  /// RawKeyEventDataAndroid RawKeyEventDataAndroid({int flags = 0, int codePoint = 0, int plainCodePoint = 0, int keyCode = 0, int scanCode = 0, int metaState = 0, int eventSource = 0, int vendorId = 0, int productId = 0, int deviceId = 0, int repeatCount = 0})
  RawKeyEventDataAndroid$Mate({
    /// optionalParameters: {int flags = 0} , hasDefaultValue:true, defaultValueCode:0
    required int flags,

    /// optionalParameters: {int codePoint = 0} , hasDefaultValue:true, defaultValueCode:0
    required int codePoint,

    /// optionalParameters: {int plainCodePoint = 0} , hasDefaultValue:true, defaultValueCode:0
    required int plainCodePoint,

    /// optionalParameters: {int keyCode = 0} , hasDefaultValue:true, defaultValueCode:0
    required int keyCode,

    /// optionalParameters: {int scanCode = 0} , hasDefaultValue:true, defaultValueCode:0
    required int scanCode,

    /// optionalParameters: {int metaState = 0} , hasDefaultValue:true, defaultValueCode:0
    required int metaState,

    /// optionalParameters: {int eventSource = 0} , hasDefaultValue:true, defaultValueCode:0
    required int eventSource,

    /// optionalParameters: {int vendorId = 0} , hasDefaultValue:true, defaultValueCode:0
    required int vendorId,

    /// optionalParameters: {int productId = 0} , hasDefaultValue:true, defaultValueCode:0
    required int productId,

    /// optionalParameters: {int deviceId = 0} , hasDefaultValue:true, defaultValueCode:0
    required int deviceId,

    /// optionalParameters: {int repeatCount = 0} , hasDefaultValue:true, defaultValueCode:0
    required int repeatCount,
  }) : super(
          flags: flags,
          codePoint: codePoint,
          plainCodePoint: plainCodePoint,
          keyCode: keyCode,
          scanCode: scanCode,
          metaState: metaState,
          eventSource: eventSource,
          vendorId: vendorId,
          productId: productId,
          deviceId: deviceId,
          repeatCount: repeatCount,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => RawKeyEventDataAndroid$Mate(
        flags: p.getValue('flags'),
        codePoint: p.getValue('codePoint'),
        plainCodePoint: p.getValue('plainCodePoint'),
        keyCode: p.getValue('keyCode'),
        scanCode: p.getValue('scanCode'),
        metaState: p.getValue('metaState'),
        eventSource: p.getValue('eventSource'),
        vendorId: p.getValue('vendorId'),
        productId: p.getValue('productId'),
        deviceId: p.getValue('deviceId'),
        repeatCount: p.getValue('repeatCount'),
      ),
    );
    mateParams.set(name: 'flags', init: flags);
    mateParams.set(name: 'codePoint', init: codePoint);
    mateParams.set(name: 'plainCodePoint', init: plainCodePoint);
    mateParams.set(name: 'keyCode', init: keyCode);
    mateParams.set(name: 'scanCode', init: scanCode);
    mateParams.set(name: 'metaState', init: metaState);
    mateParams.set(name: 'eventSource', init: eventSource);
    mateParams.set(name: 'vendorId', init: vendorId);
    mateParams.set(name: 'productId', init: productId);
    mateParams.set(name: 'deviceId', init: deviceId);
    mateParams.set(name: 'repeatCount', init: repeatCount);
  }
}
