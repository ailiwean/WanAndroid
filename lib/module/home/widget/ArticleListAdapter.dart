import 'package:flutter/material.dart';
import 'package:wan_android/common/widget/BaseListView.dart';
import 'package:wan_android/module/home/bean/res/ArticleRes.dart';
import 'package:wan_android/module/home/widget/HomeBanner.dart';

/// @Description: 文章适配器
/// @Author: SWY
/// @Date: 2021/2/6 5:47
class ArticleListAdapter extends BaseListViewAdapter<ArticleRes> {
  ArticleListAdapter() {
    addHeadWidget(HomeBanner());
  }

  @override
  Widget covertWidget(int index, ArticleRes t) {}
}
