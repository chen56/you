import 'package:_you_dart_internal/analyzer.dart';
import 'package:checks/checks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:you_flutter/src/note/source_code.dart';

void main() {
  group("sourcecode", () {
    test('findCaller', () async {
      var trace = StackTrace.fromString("""
package:you_flutter/src/note/note.dart 250:7                         CellCaller.caller
package:you_flutter/src/note/note.dart 194:28                        new CellView
package:flutter_web/routes/notes/cheatsheets/widgets/page.dart 22:9  build
package:flutter_web/routes/notes/cheatsheets/widgets/page.dart 10:9  build
package:you_flutter/src/note/note.dart 58:10                         ToNote._build
package:you_flutter/src/note/note.dart 48:52                         new ToNote.<fn>
package:you_flutter/src/router.dart 265:16                           To._build
package:you_flutter/src/router.dart 261:12                           To._buildBody
package:you_flutter/src/router.dart 419:18                           To._buildPage
package:you_flutter/src/router.dart 652:67                           _RouterDelegate.build.<fn>.<fn>
package:you_flutter/src/router.dart 670:19                           _RouteScope.build
package:flutter/src/widgets/framework.dart 5557:49                   StatelessElement.build
package:flutter/src/widgets/framework.dart 5487:15                   ComponentElement.performRebuild
      """);
      var caller = await CellCaller.parseCallerInternal(originTrace: trace, location: Uri.parse("/notes/cheatsheets/widgets"));
      check(caller.callerFrame.toString()).equals("package:flutter_web/routes/notes/cheatsheets/widgets/page.dart 10:9 in build");
    });
  });

  group("caller", () {
    test('findCaller', () async {
      var content = """
import 'package:flutter/widgets.dart';
import 'package:you_flutter/note.dart';

void build(BuildContext context, Cell print) {
  TextExamples texts = TextExamples();
  CellView(title: "texts.hello", builder: texts.hello);
}

class TextExamples {
  Widget hello(BuildContext context) {
    return Text("bar");
  }
}
""";

      SourceCode s = SourceCode.parse(content);
      check(s.line(6)).equals('''  CellView(title: "texts.hello", builder: texts.hello);''');
      check(s.line(11)).equals('''    return Text("bar");''');
    });
  });

  group("CodeAnalyzer", () {
    test('resolve', () async {
      MemoryFsAnalyzer analyzer = MemoryFsAnalyzer();
      var r = await analyzer.getResolvedLibrary(path: "/pkg/lib/routes/notes/page.dart", content: '''
import 'package:flutter/widgets.dart';
import 'package:you_flutter/note.dart';

void build(BuildContext context, Cell print) {
  TextExamples texts = TextExamples();
  CellView(title: "texts.hello", builder: texts.hello);
}

class TextExamples {
  Widget hello(BuildContext context) {
    return Text("bar");
  }
}
''');
      check(r.unit).isNotNull();
    });
  });
}
