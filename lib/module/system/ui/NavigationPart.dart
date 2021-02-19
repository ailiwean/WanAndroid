import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wan_android/common/network/Network.dart';
import 'package:wan_android/common/route/RouteManager.dart';
import 'package:wan_android/common/utils/AppScreen.dart';
import 'package:wan_android/common/widget/WebViewWrap.dart';
import 'package:wan_android/module/system/api/SystemApi.dart';
import 'package:wan_android/module/system/bean/res/navigation_res.dart';
import 'package:wan_android/res/AppColors.dart';
import 'package:wan_android/res/Style.dart';

/// @Description: 导航
/// @Author: SWY
/// @Date: 2021/2/16 23:26
class NavigationPart extends StatefulWidget {
  @override
  _NavigationPartState createState() => _NavigationPartState();
}

class _NavigationPartState extends State<NavigationPart>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureProvider<List<NavigationRes>>(
      create: (context) async {
        var result = await Network.executeList(navigationList());
        List<NavigationRes> dataList = [];
        dataList.addAll(result.map((e) => NavigationRes.fromJson(e)));
        return dataList;
      },
      child: Consumer<List<NavigationRes>>(builder: (_, values, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return _getItemDetails(values[index]);
          },
          itemCount: values != null ? values.length : 0,
        );
      }),
    );
  }

  Widget _getItemDetails(NavigationRes res) {
    List<Widget> children = [];
    children.addAll(res.articles.map((e) => ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: ElevatedButton(
            style: Style.transButtonStyle,
            child: Container(
              child: Padding(
                padding: EdgeInsets.only(
                    left: setSuitWidthPx(30),
                    top: setSuitHeightPx(10),
                    right: setSuitWidthPx(30),
                    bottom: setSuitHeightPx(10)),
                child: Text(
                  e.title,
                  style: TextStyle(
                      fontSize: setSuitTextPx(25),
                      color: AppColors.textContentColor),
                ),
              ),
              color: AppColors.textContentGrayBg,
            ),
            onPressed: () {
              RouteManager.startPage(context, WebViewWrap,
                  argusments: {"url": e.link, "title": e.title});
            },
          ),
        )));

    return Padding(
      padding: EdgeInsets.only(
          top: setSuitHeightPx(10),
          left: setSuitWidthPx(20),
          right: setSuitWidthPx(20),
          bottom: setSuitHeightPx(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            res.name,
            style: TextStyle(
                color: AppColors.textTitleColor,
                fontWeight: FontWeight.w300,
                fontSize: setSuitTextPx(30)),
          ),
          Style.heightPlaceHolder(10),
          Wrap(
            direction: Axis.horizontal,
            alignment: WrapAlignment.start,
            // 水平排列则是item之间水平间距
            spacing: setSuitWidthPx(20),
            //水平排列则是item之间垂直间距
            runSpacing: setSuitHeightPx(10),
            crossAxisAlignment: WrapCrossAlignment.start,
            children: children,
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
