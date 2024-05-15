import 'package:checks/checks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:you_flutter_internal/better_ui.dart';

void main() {
  group("YouRouter.parse ok", () {
    test('select() 所有档位都覆盖,测一下', () {
      assertScreen(ScreenSize screen) {
        // 用此档位的最小宽度+1，来模仿此屏幕大小
        var screenWidth = screen.minWidth + 1;
        check(ScreenSize.byScreen(screenWidth)).equals(screen);
        check(
          ScreenSize.bestWithWidth(screenWidth, min: "min", sm:"sm",md: "md", lg: "lg", xl: "xl", xxl: "xxl"),
          because: "假设当前屏幕宽度$screenWidth，在${screen.name}档， 应该用相应档位的style",
        ).equals(screen.name);
      }

      for (var screen in ScreenSize.values) {
        assertScreen(screen);
      }
    });
    test('select() 提供一个档位，跳档看看覆盖', () {
      // 用此档位的最小宽度+1，来模仿此屏幕大小
      screen(String screen)   => ScreenSize.byName(screen).minWidth + 1;

      check(ScreenSize.bestWithWidth(screen("sm"), min: "min",sm:"sm",)).equals("sm");
      check(ScreenSize.bestWithWidth(screen("sm"), min: "min")).equals("min");
      check(ScreenSize.bestWithWidth(screen("md"), min: "min",sm:"sm")).equals("sm");
      check(ScreenSize.bestWithWidth(screen("md"), min: "min",sm:"md")).equals("md");
    });

    test('current', () {
     var byScreen=  ScreenSize.byScreen;

      check(byScreen(ScreenSize.sm.minWidth - 1)).equals(ScreenSize.min);
      check(byScreen(ScreenSize.sm.minWidth)).equals(ScreenSize.sm);

      check(byScreen(ScreenSize.md.minWidth - 1)).equals(ScreenSize.sm);
      check(byScreen(ScreenSize.md.minWidth)).equals(ScreenSize.md);

      check(byScreen(ScreenSize.lg.minWidth - 1)).equals(ScreenSize.md);
      check(byScreen(ScreenSize.lg.minWidth)).equals(ScreenSize.lg);

      check(byScreen(ScreenSize.xl.minWidth - 1)).equals(ScreenSize.lg);
      check(byScreen(ScreenSize.xl.minWidth)).equals(ScreenSize.xl);

      check(byScreen(ScreenSize.xxl.minWidth - 1)).equals(ScreenSize.xl);
      check(byScreen(ScreenSize.xxl.minWidth)).equals(ScreenSize.xxl);
      check(byScreen(ScreenSize.xxl.minWidth + 10000)).equals(ScreenSize.xxl);
    });
    test('Enum.values 按原始定义顺序', () {
      check("${ScreenSize.values.map((e) => e.name)}").equals("(min, sm, md, lg, xl, xxl)");
    });
  });
}
