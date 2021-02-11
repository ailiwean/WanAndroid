import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wan_android/MainPage.dart';
import 'package:wan_android/SplashPage.dart';
import 'package:wan_android/common/route/AnimaRoute.dart';
import 'package:wan_android/common/widget/WebViewWrap.dart';
import 'package:wan_android/module/home/ui/Home.dart';
import 'package:wan_android/module/home/ui/HomeSearch.dart';
import 'package:wan_android/module/me/ui/Me.dart';
import 'package:wan_android/module/qa/ui/Qa.dart';
import 'package:wan_android/module/system/ui/System.dart';
import 'package:wan_android/module/me/ui/Login.dart';

///  路由管理
class RouteManager {
  static final route = {
    getRouteName(SplashPage): (context, {arguments}) => SplashPage(),
    getRouteName(MainPage): (context, {arguments}) => MainPage(),
    getRouteName(Home): (context, {arguments}) => Sort(),
    getRouteName(Me): (context, {arguments}) => Me(),
    getRouteName(Qa): (context, {arguments}) => Qa(),
    getRouteName(Sort): (context, {arguments}) => Sort(),
    getRouteName(HomeSearch): (context, {arguments}) => HomeSearch(),
    getRouteName(WebViewWrap): (context, {arguments}) => WebViewWrap(
          url: arguments["url"],
          arguments: arguments,
        ),
    getRouteName(Login): (context, {arguments}) => Login(),
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
        ? AnimaPageRoute(
            builder: (context) => build(context, arguments: settings.arguments))
        //无参路由
        : AnimaPageRoute(builder: (context) => build(context));
  };

  static String getRouteName(Type type) {
    return type.toString();
  }

  /// 启动一个页面
  static startPage(BuildContext context, Type type, {argusments}) {
    if (RouteManager.getRouteName(type) == null) throw "Not fount this Page";
    Navigator.of(context)
        .pushNamed(RouteManager.getRouteName(type), arguments: argusments);
  }

  ///启动一个页面关闭当前页面
  static startPageWithFinish(BuildContext context, Type type, {argusments}) {
    if (RouteManager.getRouteName(type) == null) throw "Not fount this Page";
    Navigator.of(context).popAndPushNamed(RouteManager.getRouteName(type),
        arguments: argusments);
  }

  ///关闭这个页面
  static finish(BuildContext context) {
    Navigator.pop(context);
  }
}
