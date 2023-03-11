// /// Generated by mate_flutter, please don't edit!

import 'package:flutter/src/services/message_codec.dart';
import 'dart:core';
import 'package:note/mate.dart';
export 'dart:typed_data' show ByteData;

/// class MethodCall
class MethodCall$Mate extends MethodCall with Mate<MethodCall$Mate> {
  /// MethodCall MethodCall(String method, [dynamic arguments])
  MethodCall$Mate(
    /// param: String method
    String method,

    /// param: [dynamic arguments]
    dynamic arguments,
  ) : super(
          method,
          arguments,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => MethodCall$Mate(
        p.getValue('method'),
        p.getValue('arguments'),
      ),
    );
    mateParams.set(name: 'method', init: method);
    mateParams.set(name: 'arguments', init: arguments);
  }
}

/// class PlatformException implements Exception
class PlatformException$Mate extends PlatformException with Mate<PlatformException$Mate> {
  /// PlatformException PlatformException({required String code, String? message, dynamic details, String? stacktrace})
  PlatformException$Mate({
    /// param: {required String code}
    required String code,

    /// param: {String? message}
    String? message,

    /// param: {dynamic details}
    required dynamic details,

    /// param: {String? stacktrace}
    String? stacktrace,
  }) : super(
          code: code,
          message: message,
          details: details,
          stacktrace: stacktrace,
        ) {
    mateParams = Params(
      init: this,
      builder: (p) => PlatformException$Mate(
        code: p.getValue('code'),
        message: p.getValue('message'),
        details: p.getValue('details'),
        stacktrace: p.getValue('stacktrace'),
      ),
    );
    mateParams.set(name: 'code', init: code);
    mateParams.set(name: 'message', init: message);
    mateParams.set(name: 'details', init: details);
    mateParams.set(name: 'stacktrace', init: stacktrace);
  }
}

/// class MissingPluginException implements Exception
class MissingPluginException$Mate extends MissingPluginException with Mate<MissingPluginException$Mate> {
  /// MissingPluginException MissingPluginException([String? message])
  MissingPluginException$Mate(

      /// param: [String? message]
      String? message)
      : super(message) {
    mateParams = Params(
      init: this,
      builder: (p) => MissingPluginException$Mate(p.getValue('message')),
    );
    mateParams.set(name: 'message', init: message);
  }
}
