import 'package:checks/checks.dart';
import 'package:test/test.dart';
import 'package:_you_dart_internal/src/pubspec.dart';

void main() {
  group("Pubspec.assets", () {
    test('update', () async {
      String content = """
flutter:
  assets:
    - assets/manual1                   # manual config, keep it
    - lib/routes/notes/1/              # old
    - lib/routes/notes/2/              # old
    - lib/routes/notes/3/              # old
    - assets/manual2                   # manual config, keep it
""";
      Pubspec pubspec = Pubspec.parse(content);

      // when
      var assets = List.of(pubspec.assets);
      assets.remove("lib/routes/notes/2/");
      assets.add("lib/routes/notes/4/");
      pubspec.assetsUpdate(assets);

      // then
      check(pubspec.toYamlString()).equals("""
flutter:
  assets:
    - assets/manual1                   # manual config, keep it
    - lib/routes/notes/1/              # old
    - lib/routes/notes/3/              # old
    - assets/manual2                   # manual config, keep it
    - lib/routes/notes/4/
""");
    });
  });

  group("Pubspec.name", () {
    test('  update', () async {
      String content = """
name: app
flutter:
""";
      Pubspec pubspec = Pubspec.parse(content);
      check(pubspec.name).equals("app");

      // when
      pubspec.name = "app2";

      // then
      check(pubspec.toYamlString()).equals("""
name: app2
flutter:
""");
    });
  });
}
