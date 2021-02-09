import 'package:flutter/material.dart';
import 'package:wan_android/common/route/RouteManager.dart';
import 'package:wan_android/common/widget/ListViewDelegate.dart';
import 'package:wan_android/common/widget/WebViewWrap.dart';
import 'package:wan_android/module/home/bean/res/ArticleRes.dart';
import 'package:wan_android/module/home/widget/ArticleImgItemWidget.dart';
import 'package:wan_android/module/home/widget/ArticleItemWidget.dart';
import 'package:wan_android/module/home/widget/HomeBanner.dart';
import 'package:wan_android/res/Style.dart';
import 'package:wan_android/common/utils/AppRegUtils.dart';

/// @Description: 文章适配器
/// @Author: SWY
/// @Date: 2021/2/6 5:47
class ArticleListAdapter extends BaseListViewAdapter<ArticleRes> {
  ArticleListAdapter() {
    addHeadWidget(HomeBanner());
  }

  @override
  Widget covertWidget(int index, ArticleRes t) {
    //带img样式
    Widget widget;
    if (AppRegUtils.isMatchUri(t.envelopePic))
      widget = ArticleImgItemWidget(articleRes: t);
    else
      widget = ArticleItemWidget(articleRes: t);
    return ElevatedButton(
        style: Style.transButtonStyle,
        onPressed: () {
          RouteManager.startPage(context, WebViewWrap,
              argusments: {"url": t.link, "title": t.title});
        },
        onLongPress: () {
          //TODO 分享 收藏
        },
        child: widget);
  }
}
