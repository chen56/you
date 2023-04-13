// ignore_for_file: unnecessary_type_check

import 'package:analyzer/dart/analysis/features.dart';
import 'package:test/test.dart';
import 'package:analyzer/dart/analysis/utilities.dart' as util;
import 'package:path/path.dart' as path;

void main() {
  test('analyzer', () {
    var x = util.parseFile(
        path: path.absolute("test/analyzer/analyzer_test.dart"),
        featureSet: FeatureSet.latestLanguageVersion());
    print(x);
  });
}
