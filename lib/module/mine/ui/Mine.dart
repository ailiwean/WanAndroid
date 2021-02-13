import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:wan_android/common/route/RouteManager.dart';
import 'package:wan_android/common/utils/AppScreen.dart';
import 'package:wan_android/module/RootPage.dart';
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

class Me extends StatefulWidget with RootPage {
  static String pageName = "我的";

  @override
  _MeState createState() => _MeState();

  @override
  String getPageName() {
    return pageName;
  }

  @override
  Icon getPageIcon() {
    return Icon(Icons.how_to_reg);
  }
}

class _MeState extends State<Me> with AutomaticKeepAliveClientMixin {
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
              _getHeadImg()
            ],
          ),
        ),
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
        _getMenuItem(Icons.settings, "系统设置",
            () => RouteManager.startPage(context, Setting)),
        Style.heightPlaceHolder(200)
      ],
    ));
  }

  Widget _getHeadImg() {
    return ElevatedButton(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ClipOval(
            //圆形头像
            child: new Image.network(
              'https://pic2.zhimg.com/v2-639b49f2f6578eabddc458b84eb3c6a1.jpg',
              width: setSuitWidthPx(200),
            ),
          ),
          Style.heightPlaceHolder(20),
          Text("未登陆",
              style:
                  TextStyle(fontSize: setSuitTextPx(40), color: Colors.white))
        ],
      ),
      style: Style.transButtonStyle,
      onPressed: () {
        RouteManager.startPage(context, Login);
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

  @override
  bool get wantKeepAlive => true;
}
