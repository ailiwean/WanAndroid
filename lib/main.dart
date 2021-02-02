import 'package:flutter/material.dart';
import 'package:wan_android/SplashPage.dart';
import 'package:wan_android/common/route/RouteManager.dart';
import 'package:wan_android/common/utils/AppBarUtils.dart';
import 'package:wan_android/common/utils/ToastUtils.dart';
 import 'package:wan_android/res/AppColors.dart';

import 'common/network/Network.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    initApp(context);
    return MaterialApp(
      initialRoute: RouteManager.getRouteName(SplashPage),
      onGenerateRoute: RouteManager.generateRoute,
      theme: ThemeData(
          primaryColor: AppColors.primaryColor,
          buttonColor: AppColors.buttonColor),
    );
  }

  initApp(BuildContext context) {
    //沉浸式状态栏去透明条
    statusOverLayerBar();

    //Toast
    ToastUtils.init(context);

    //网络请求库初始化
    Network.build()
        .setBaseUrl("https://wanandroid.com")
        .setBaseHeaders({}).build();
  }
}
