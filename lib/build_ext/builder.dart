// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:build/build.dart';

Builder pagesBuilder(BuilderOptions options) => PagesBuilder();

/// Adds `generated.css` to the `web` directory.
class PagesBuilder implements Builder {
  @override
  Future build(BuildStep buildStep) async {
    print("buildStep.inputId.package: ${buildStep.inputId.package}     ");
    print("  ${buildStep.allowedOutputs}   ");
    await buildStep.writeAsString(
        AssetId(buildStep.inputId.package, 'lib/pages.g.dart'), content());
  }

  @override
  final buildExtensions = const {
    r'$package$': ['lib/pages.g.dart']
  };

  static String content() => '''
/*
Generated at: ${DateTime.now()} , by PagesBuilder......
*/
''';
}
