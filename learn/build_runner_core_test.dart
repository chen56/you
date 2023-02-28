// ignore_for_file: unnecessary_type_check

import 'package:build_runner_core/build_runner_core.dart';
import 'package:test/test.dart';

Future<void> main() async {
  PackageGraph packageGraph = await PackageGraph.forPath("./");

  test('build_runner_core.PackageGr', () async {
    expect(packageGraph.root.name, "flutter_note");
    expect(packageGraph.root.dependencyType, DependencyType.path);
    packageGraph.allPackages.forEach((key, value) {
      print("${key}  ${value}");
    });
    print("-------");

    // PackageNode是一棵树
    var flutter = packageGraph.root.dependencies.where((e) => e.name == 'flutter').first;
    expect(flutter.name, "flutter");
    expect(flutter.dependencyType, DependencyType.path);
    expect(flutter.isRoot, false);

    //  -> /{flutter_install_path}}/flutter/packages/flutter
    expect(flutter.path, contains("flutter/packages/flutter"));
  });
}
