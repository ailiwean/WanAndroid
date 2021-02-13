import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wan_android/MainPage.dart';
import 'package:wan_android/SplashPage.dart';
import 'package:wan_android/common/route/AnimaRoute.dart';
import 'package:wan_android/common/widget/WebViewWrap.dart';
import 'package:wan_android/module/home/ui/HomeSearch.dart';
import 'package:wan_android/module/mine/ui/AuthorAbout.dart';
import 'package:wan_android/module/mine/ui/Login.dart';
import 'package:wan_android/module/mine/ui/Mine.dart';
import 'package:wan_android/module/mine/ui/MineBookMark.dart';
import 'package:wan_android/module/mine/ui/MinePoints.dart';
import 'package:wan_android/module/mine/ui/MineShare.dart';
import 'package:wan_android/module/mine/ui/MineStoreUp.dart';
import 'package:wan_android/module/mine/ui/OpenSource.dart';
import 'package:wan_android/module/mine/ui/ReadHistory.dart';
import 'package:wan_android/module/mine/ui/Setting.dart';

///  路由管理
class RouteManager {
  static final route = {
    getRouteName(SplashPage): (context, {arguments}) => SplashPage(),
    getRouteName(MainPage): (context, {arguments}) => MainPage(
          loginJson: arguments[Mine.needLoginKey],
        ),
    getRouteName(HomeSearch): (context, {arguments}) => HomeSearch(),
    getRouteName(WebViewWrap): (context, {arguments}) => WebViewWrap(
          url: arguments["url"],
          arguments: arguments,
        ),
    getRouteName(Login): (context, {arguments}) => Login(),
    getRouteName(MineBookMark): (context, {arguments}) => MineBookMark(),
    getRouteName(AuthorAbout): (context, {arguments}) => MineBookMark(),
    getRouteName(MinePoints): (context, {arguments}) => MinePoints(),
    getRouteName(MineShare): (context, {arguments}) => MineShare(),
    getRouteName(OpenSource): (context, {arguments}) => OpenSource(),
    getRouteName(ReadHistory): (context, {arguments}) => ReadHistory(),
    getRouteName(Setting): (context, {arguments}) => Setting(),
    getRouteName(MineStoreUp): (context, {arguments}) => Setting(),
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
  static Future<dynamic> startPage(BuildContext context, Type type,
      {argusments}) {
    if (RouteManager.getRouteName(type) == null) throw "Not fount this Page";
    return Navigator.of(context)
        .pushNamed(RouteManager.getRouteName(type), arguments: argusments);
  }

  ///启动一个页面关闭当前页面
  static Future<dynamic> startPageWithFinish(BuildContext context, Type type,
      {argusments}) {
    if (RouteManager.getRouteName(type) == null) throw "Not fount this Page";
    return Navigator.of(context).popAndPushNamed(
        RouteManager.getRouteName(type),
        arguments: argusments);
  }

  ///关闭这个页面
  static finish(BuildContext context, {dynamic result}) {
    Navigator.pop(context, result);
  }
}
