import 'package:flutter/material.dart';
import 'package:flutter_demo_list/routers/application.dart';
import 'package:flutter_demo_list/routers/routes.dart';

class NavigatorUtil {
  /// 跳转到主页面
  static void goSearchPage(BuildContext context) {
    /// Routes.home 路由地址
    /// replace：true 就是将 splash 页面给移除掉了，这点后退键的时候就不会再出现Splash页面
    Application.router.navigateTo(context, Routes.search, replace: true);
  }

  /// 返回
  static void goBack(BuildContext context) {
    unfocus();
    Navigator.pop(context);
  }

  static void unfocus() {
    // 使用下面的方式，会触发不必要的build。
    // FocusScope.of(context).unfocus();
    // https://github.com/flutter/flutter/issues/47128#issuecomment-627551073
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
