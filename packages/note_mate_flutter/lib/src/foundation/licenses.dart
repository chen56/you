// /// Generated by gen_maters.dart, please don't edit!

import 'package:flutter/src/foundation/licenses.dart';
import 'package:note/mate.dart';
import 'dart:core';

/// class LicenseParagraph
class LicenseParagraph$Mate extends LicenseParagraph with Mate {
  /// LicenseParagraph LicenseParagraph(String text, int indent)
  LicenseParagraph$Mate(
    /// requiredParameters: String text
    String text,

    /// requiredParameters: int indent
    int indent,
  ) : super(
          text,
          indent,
        ) {
    mateCreateName = 'LicenseParagraph';
    matePackageUrl = 'package:flutter/foundation.dart';
    mateBuilder = (p) => LicenseParagraph$Mate(
          p.get('text').value,
          p.get('indent').value,
        );
    mateUse('text', text);
    mateUse('indent', indent);
  }
}

/// class LicenseEntryWithLineBreaks extends LicenseEntry
class LicenseEntryWithLineBreaks$Mate extends LicenseEntryWithLineBreaks with Mate {
  /// LicenseEntryWithLineBreaks LicenseEntryWithLineBreaks(List<String> packages, String text)
  LicenseEntryWithLineBreaks$Mate(
    /// requiredParameters: List<String> packages
    List<String> packages,

    /// requiredParameters: String text
    String text,
  ) : super(
          packages,
          text,
        ) {
    mateCreateName = 'LicenseEntryWithLineBreaks';
    matePackageUrl = 'package:flutter/foundation.dart';
    mateBuilder = (p) => LicenseEntryWithLineBreaks$Mate(
          p.get('packages').value,
          p.get('text').value,
        );
    mateUse('packages', packages);
    mateUse('text', text);
  }
}
