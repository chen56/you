// ignore_for_file: use_key_in_widget_constructors, file_names, prefer_const_constructors, camel_case_types

import 'package:flutter/widgets.dart';

class TODO_core_architecture{
  // navigator
  // - 参数传递 及返回值
  // - 层级navigator? 页面内的一组小流程如何做？
  //   类似注册步骤？https://flutter.cn/docs/cookbook/effects/nested-nav 嵌套混乱 和 pop混乱
  // - 类似微信回退到以前某页
  // - 可分享给朋友打开的页面就是独立页面，否则是不独立页面比如多步骤向导页中的某一步  需单独处理
  // - navatitor 用时间戳或id控制浏览器后退按钮的鉴别
  // - state恢复表单，防止没保存
}
class TODO_js_static_site{
  // flutter貌似是有点大，半天加载不出来！应提供一个简版的静态站：html+js

  //https://www.patterns.dev/posts/islands-architecture/
  //https://markojs.com
  // https://www.11ty.dev
  // Astro Snowpack的作者
}


/// # 生成的代码应有参数注释，以便把调参和代码对应起来
class TODO_core_architecture_comment extends StatelessWidget {
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


class TODO3_dev_optimization{

  // 替换canvaskit.wasm CDN 地址，国内defult的太慢，下面方法没用，
  // 还是从unpkg下载，要五分钟：https://unpkg.com/canvaskit-wasm@0.37.1/bin/canvaskit.wasm
  //这样不起作用：
  // flutter build web -v --profile  --web-renderer canvaskit --dart-define=FLUTTER_WEB_CANVASKIT_URL=https://cdn.jsdelivr.net/npm/canvaskit-wasm@0.37.1/bin/ lib/notes/navigator/navigator_v2/3.navigator_v2_only_pages_last_version.dart

  //  flutter run 慢
  // 拿不到字体：https://fonts.gstatic.com/s/roboto/v20/KFOmCnqEu92Fr1Me5WZLCzYlKw.ttf


}

class TODO_feature_optimization{
  ///seo 低优先级
  //字体问题https://cloud.tencent.com/developer/article/1966375?from=article.detail.1633675&areaSource=106000.1&traceId=UQMP0YIVlSbBwp_JzXQXQ

  //Flutter 默认会打包 MaterialIcons-Regular.otf 和 CupertinoIcons.ttf 这两种字体库，如何精简

  // web加载进度条：html里放一个加载中的element, 在flutter就绪时再删除?
  // if(kIsWeb) html.document.getElementById("loading")?.remove();

}

class TODO2_note{
  //navigator_ route.settings 如果是Page，会在Page更新时回调Route.xxxx?
  //navigator 当前Page模型如何处理参数
  //为什么要管理pages状态。正在某博app 看某姑娘精彩评论，去上了个厕所 ，app被os杀了 ，打开后是首页找不到刚读到哪了，也许永远找不到那个位置，蹉跎一生

  //PreferredSizeWidget 是啥
  //是否搞个组件继承树作为导航，方便查阅，类似 https://juejin.cn/post/6997370774466068517


  // var mediaQuery = MediaQuery.removePadding(
  //     context: context,
  //     //移除抽屉菜单顶部默认留白
  //     removeTop: true,
  //     child: listView,
  //   );

}

