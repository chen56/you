import 'package:checks/checks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:you_flutter/src/note/note.dart';

void main() {
  group("caller", () {
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
}
