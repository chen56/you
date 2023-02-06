// ignore_for_file: use_key_in_widget_constructors, file_names, prefer_const_constructors, camel_case_types

import 'package:flutter/widgets.dart';

/// # 生成的代码应有参数注释，以便把调参和代码对应起来
class TODO1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GlobalKey();
    GlobalKey.new();

    return Text(
      /*param:text.data*/ "xxx" /*param*/,
      textAlign: TextAlign.center,
    );
  }
}

class TODO2_navigator{
   //route.settings 如果是Page，会在Page更新时回调Route.xxxx?
  //当前Page模型如何处理参数

}

class TODO3_web_too_slow{

  // 替换canvaskit.wasm CDN 地址，国内defult的太慢，下面方法没用，
  // 还是从unpkg下载，要五分钟：https://unpkg.com/canvaskit-wasm@0.37.1/bin/canvaskit.wasm
  //这样不起作用：
  // flutter build web -v --profile  --web-renderer canvaskit --dart-define=FLUTTER_WEB_CANVASKIT_URL=https://cdn.jsdelivr.net/npm/canvaskit-wasm@0.37.1/bin/ lib/notes/navigator/navigator_v2/3.navigator_v2_only_pages_last_version.dart

  //  flutter run 慢
  // 拿不到字体：https://fonts.gstatic.com/s/roboto/v20/KFOmCnqEu92Fr1Me5WZLCzYlKw.ttf

  //Flutter 默认会打包 MaterialIcons-Regular.otf 和 CupertinoIcons.ttf 这两种字体库，如何精简

  // html里放一个加载中的element, 在flutter就绪时再删除。
  // if(kIsWeb) html.document.getElementById("loading")?.remove();

}


class TODO_seo{
  ///低优先级
}


class TODO_MediaQuery{
  // var mediaQuery = MediaQuery.removePadding(
  //     context: context,
  //     //移除抽屉菜单顶部默认留白
  //     removeTop: true,
  //     child: listView,
  //   );

}