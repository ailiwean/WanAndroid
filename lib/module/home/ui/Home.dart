import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:wan_android/common/native/Native.dart';
import 'package:wan_android/common/native/NativeChannel.dart';
import 'package:wan_android/common/route/RouteManager.dart';
import 'package:wan_android/common/utils/ToastUtils.dart';
import 'package:wan_android/common/widget/EasyRefreshWrap.dart';
import 'package:wan_android/module/RootPage.dart';
import 'package:wan_android/module/home/ui/HomeSearch.dart';
import 'package:wan_android/module/home/widget/HomeBanner.dart';
import 'package:wan_android/res/AppColors.dart';
import 'package:wan_android/res/Style.dart';

class Home extends StatefulWidget with RootPage {
  static String pageName = "首页";

  @override
  _HomeState createState() => _HomeState();

  @override
  String getPageName() {
    return pageName;
  }

  @override
  Icon getPageIcon() {
    return Icon(Icons.home);
  }
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    print("home页面build");
    super.build(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(Home.pageName),
          leading: ElevatedButton(
            style: Style.transButtonStyle,
            child: Icon(
              Icons.qr_code_scanner,
              color: AppColors.comIconColor,
            ),
            onPressed: () {
              setState(() {});

              Native(
                channel: NativeChannel.scan[0],
                servelName: NativeChannel.scan[1],
              )
                  .notice()
                  .then((value) => ToastUtils.showToast(value.toString()));
            },
          ),
          actions: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: ElevatedButton(
                style: Style.transButtonStyle,
                child: Icon(
                  Icons.search,
                  color: AppColors.comIconColor,
                ),
                onPressed: () {
                  //搜索页
                  RouteManager.startPage(context, HomeSearch);
                },
              ),
            )
          ],
        ),
        body: EasyRefreshWrap(
          child: Align(
            child: HomeBanner(),
            alignment: Alignment.topCenter,
          ),
          onRefresh: () {
            ToastUtils.showToast("刷新");
          },
          onLoad: () {
            ToastUtils.showToast("加载");
          },
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
