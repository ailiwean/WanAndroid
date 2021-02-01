import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wan_android/MainPage.dart';
import 'package:wan_android/SplashPage.dart';
import 'file:///C:/Users/Ailiwean/Desktop/project/wan_android/lib/module/home/ui/Home.dart';
import 'file:///C:/Users/Ailiwean/Desktop/project/wan_android/lib/module/me/ui/Me.dart';
import 'file:///C:/Users/Ailiwean/Desktop/project/wan_android/lib/module/qa/ui/Qa.dart';
import 'file:///C:/Users/Ailiwean/Desktop/project/wan_android/lib/module/sort/ui/Sort.dart';

///  路由管理
class RouteManager {
  static final route = {
    getRouteName(SplashPage): (context, {arguments}) => SplashPage(),
    getRouteName(MainPage): (context, {arguments}) => MainPage(),
    getRouteName(Home): (context, {arguments}) => Sort(),
    getRouteName(Me): (context, {arguments}) => Me(),
    getRouteName(Qa): (context, {arguments}) => Qa(),
    getRouteName(Sort): (context, {arguments}) => Sort(),
  };

  // ignore: top_level_function_literal_block
  static final generateRoute = (RouteSettings settings) {
    final routeName = settings.name;

    if (routeName == null || routeName.isEmpty) {
      throw "common.route Name is not Null or Empty ";
    }

    final build = route[routeName];
    if (build == null) throw "common.route values is not Null";

    return settings.arguments != null
        //带参路由
        ? MaterialPageRoute(
            builder: (context) => build(context, arguments: settings.arguments))
        //无参路由
        : MaterialPageRoute(builder: (context) => build(context));
  };

  static String getRouteName(Type type) {
    return type.toString();
  }

  /// 启动一个页面
  static startPage(BuildContext context, Type type, {argusments}) {
    Navigator.of(context)
        .pushNamed(RouteManager.getRouteName(type), arguments: argusments);
  }

  ///启动一个页面关闭当前页面
  static startPageWithFinish(BuildContext context, Type type, {argusments}) {
    Navigator.of(context).popAndPushNamed(RouteManager.getRouteName(type),
        arguments: argusments);
  }
}
