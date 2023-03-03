import 'package:build/build.dart';
import 'package:build_ext/builder.dart';
import 'package:test/test.dart';

/// build package convert [Builder.buildExtensions] to expectedOutputs list:
/// expectedOutputs=expectedOutputs(builder,inputAssetId)
/// then:
/// if(expectedOutputs.contains(outputAsstId))  allow_to_output
main() {
  test('MateBuilder', () async {
    expect(
        expectedOutputs(
            MateBuilder(), AssetId("flutter", "flutter/material.dart")),
        equals([AssetId("flutter", "lib/generated/flutter/material.dart")]));
  });

  test('MateBuilder', () async {
    expect(
        expectedOutputs(
            MateBuilder(),
            AssetId(
                "flutter_markdown", "flutter_markdown/flutter_markdown.dart")),
        equals([
          AssetId("flutter_markdown",
              "lib/generated/flutter_markdown/flutter_markdown.dart")
        ]));
  });
}
