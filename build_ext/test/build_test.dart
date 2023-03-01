import 'package:build_config/build_config.dart';
import 'package:build_ext/builder.dart';
import 'package:build_runner/build_runner.dart' as s;
import 'package:build_runner_core/build_runner_core.dart';
import 'package:test/test.dart';

main() {
  test('build', () async {
    var app = BuilderApplication.forBuilder('',
        [(buildOptions) => MateBuilder()], (packageNode) => packageNode.isRoot,
        hideOutput: false,
        defaultGenerateFor: const InputSet(include: ["lib/*.dart"]));
    var result = await s.run(["build", "-o", "build/bulid_runner"], [app]);
    print("result:$result");
  });
}
