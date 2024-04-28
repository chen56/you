// ignore_for_file: unnecessary_type_check

import 'package:analyzer/dart/analysis/features.dart';
import 'package:test/test.dart';
import 'package:analyzer/dart/analysis/utilities.dart' as analyzer_util;
import 'package:path/path.dart' as path;

void main() {
  test('analyzer', () {
    var x = analyzer_util.parseFile(
        path: path.absolute("test/basic_lib/analyzer/analyzer_parse_test.dart"),
        featureSet: FeatureSet.latestLanguageVersion());
    print(x);
  });
}
class XXX{
  String x="";
}