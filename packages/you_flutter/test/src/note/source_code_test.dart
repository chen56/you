import 'package:flutter_test/flutter_test.dart';
import 'package:you_flutter/src/note/source_code.dart';

void main() {
  group("caller", () {
    test('findCaller', () async {
      var content = """
import 'package:flutter/widgets.dart';
import 'package:you_flutter/note.dart';

void build(BuildContext context, Cell print) {

}
""";

      SourceCode s = SourceCode.parse(content);
    });
  });
}
