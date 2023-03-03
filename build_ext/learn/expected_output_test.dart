import 'dart:async';

import 'package:build/build.dart';
import 'package:test/test.dart';

main() {
  test('learn.expectedOutputs', () async {
    expect(
        expectedOutputs(
            TestBuilder({
              '{{}}.dart': ['lib/generated/{{}}.dart']
            }),
            AssetId("flutter", "flutter/material.dart")),
        equals([AssetId("flutter", "lib/generated/flutter/material.dart")]));
  });
}

class TestBuilder extends Builder {
  final Map<String, List<String>> outputs;

  TestBuilder(this.outputs);

  @override
  FutureOr<void> build(BuildStep buildStep) {
    throw UnimplementedError();
  }

  @override
  Map<String, List<String>> get buildExtensions => outputs;
}
