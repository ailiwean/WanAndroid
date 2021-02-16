import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:wan_android/common/route/RouteManager.dart';
import 'package:wan_android/common/utils/AppScreen.dart';
import 'package:wan_android/common/utils/AppSpUtils.dart';
import 'package:wan_android/module/RootPage.dart';
import 'package:wan_android/module/mine/bean/login_res.dart';
import 'package:wan_android/module/mine/ui/AuthorAbout.dart';
import 'package:wan_android/module/mine/ui/Login.dart';
import 'package:wan_android/module/mine/ui/MineBookMark.dart';
import 'package:wan_android/module/mine/ui/MinePoints.dart';
import 'package:wan_android/module/mine/ui/MineShare.dart';
import 'package:wan_android/module/mine/ui/MineStoreUp.dart';
import 'package:wan_android/module/mine/ui/OpenSource.dart';
import 'package:wan_android/module/mine/ui/ReadHistory.dart';
import 'package:wan_android/module/mine/ui/Setting.dart';
import 'package:wan_android/module/mine/widget/DayPicture.dart';
import 'package:wan_android/res/AppColors.dart';
import 'package:wan_android/res/Style.dart';

class Mine extends StatefulWidget with RootPage {
  static String pageName = "我的";
  static String needLoginKey = "loginJson";
  final loginjson;

  Mine({Key key, this.loginjson});

  @override
  _MineState createState() => _MineState(loginJson: loginjson);

  @override
  String getPageName() {
    return pageName;
  }

  @override
  Icon getPageIcon() {
    return Icon(Icons.how_to_reg);
  }
}

class _MineState extends State<Mine> with AutomaticKeepAliveClientMixin {
  LoginRes res;

  _MineState({String loginJson}) {
    try {
      res = LoginRes.fromJson(JsonDecoder().convert(loginJson));
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return EasyRefresh(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          height: setSuitHeightPx(600),
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              //背景层
              Container(
                color: AppColors.navigatorItemSelectColor,
              ),
              //图片层
              DayPicture(),
              //头像
              res == null ? _getHeadImgUnLogin() : _getHeadImgLogin()
            ],
          ),
        ),
        Style.heightPlaceHolder(10),
        _getMenuItem(Icons.integration_instructions, "我的积分",
            () => RouteManager.startPage(context, MinePoints)),
        _getMenuItem(Icons.share, "我的分享",
            () => RouteManager.startPage(context, MineShare)),
        _getMenuItem(Icons.collections, "我的收藏",
            () => RouteManager.startPage(context, MineStoreUp)),
        _getMenuItem(Icons.bookmark, "我的书签",
            () => RouteManager.startPage(context, MineBookMark)),
        _getMenuItem(Icons.history, "阅读历史",
            () => RouteManager.startPage(context, ReadHistory)),
        _getMenuItem(Icons.category, "开源项目",
            () => RouteManager.startPage(context, OpenSource)),
        _getMenuItem(Icons.info, "关于作者",
            () => RouteManager.startPage(context, AuthorAbout)),
        _getMenuItem(Icons.settings, "系统设置", () => openSetting()),
        Style.heightPlaceHolder(200)
      ],
    ));
  }

  //未登录获取的头像
  Widget _getHeadImgUnLogin() {
    return ElevatedButton(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ClipOval(
            //圆形头像
            child: new Image.network(
              "",
              width: setSuitWidthPx(200),
            ),
          ),
          Style.heightPlaceHolder(20),
          Text("未登录",
              style:
                  TextStyle(fontSize: setSuitTextPx(40), color: Colors.white))
        ],
      ),
      style: Style.transButtonStyle,
      onPressed: () {
        login();
      },
    );
  }

  //登录获取的头像
  Widget _getHeadImgLogin() {
    return ElevatedButton(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ClipOval(
            //圆形头像
            child: Container(
              width: setSuitWidthPx(150),
              color: AppColors.navigatorItemSelectColor,
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(res.username.substring(0, 1),
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: setSuitTextPx(100),
                          color: Colors.white)),
                ),
              ),
            ),
          ),
          Style.heightPlaceHolder(20),
          Text(res.username,
              style:
                  TextStyle(fontSize: setSuitTextPx(40), color: Colors.white))
        ],
      ),
      style: Style.transButtonStyle,
      onPressed: () {
        login();
      },
    );
  }

  Widget _getMenuItem(IconData iconData, String name, click()) {
    return ElevatedButton(
      style: Style.transButtonStyle,
      onPressed: () {
        click();
      },
      child: Padding(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Style.widthPlaceHolder(20),
              Icon(
                iconData,
                color: AppColors.navigatorItemSelectColor,
              ),
              Style.widthPlaceHolder(20),
              Expanded(
                  child: Text(
                name,
                style: TextStyle(
                    color: AppColors.textTitleColor,
                    fontSize: setSuitTextPx(25)),
              )),
              Style.widthPlaceHolder(20),
              Icon(
                Icons.arrow_forward_ios,
                size: setSuitWidthPx(20),
                color: AppColors.textContentDescColor,
              ),
              Style.widthPlaceHolder(20),
            ],
          ),
          padding: EdgeInsets.only(
              top: setSuitHeightPx(20), bottom: setSuitHeightPx(20))),
    );
  }

  void login() async {
    var result = await RouteManager.startPage(context, Login);
    if (result == null) return;
    await AppSpUtils.setValues(AppSpUtils.loginJson, json.encode(result));
    res = result as LoginRes;
    setState(() {});
  }

  void openSetting() async {
    var isLoginOut = await RouteManager.startPage(context, Setting);
    if (isLoginOut == null || !isLoginOut) return;
    res = null;
    setState(() {});
  }

  @override
  bool get wantKeepAlive => true;
}
