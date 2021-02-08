import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wan_android/common/utils/AppDateUtils.dart';
import 'package:wan_android/module/home/bean/res/ArticleRes.dart';
import 'package:wan_android/res/AppColors.dart';

///文章带图片item
class ArticleImgItemWidget extends StatelessWidget {
  final ArticleRes articleRes;

  ArticleImgItemWidget({this.articleRes});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        getTitleWidget(),
      ],
    );
  }

  //获取item顶部信息
  Widget getTitleWidget() {
    List<Widget> child = [];
    //发版时间在距当前时间前3天都视为新
    if (articleRes.publishTime >
        AppDateUtils.getNowBeforeDurtion(Duration(days: 7)))
      child.add(Padding(
        padding: EdgeInsets.only(right: ScreenUtil().setWidth(10)),
        child: Text("新",
            style: TextStyle(
                color: AppColors.signColor, fontSize: ScreenUtil().setSp(20))),
      ));

    //作者信息
    child.add(Padding(
      padding: EdgeInsets.only(right: ScreenUtil().setWidth(10)),
      child: Text(articleRes.author,
          style: TextStyle(
              color: AppColors.textContentColor,
              fontSize: ScreenUtil().setSp(25))),
    ));

    //文章所在分组
    //child.add(Ex)

    return Padding(
      padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
      child: Row(
        children: child,
        mainAxisAlignment: MainAxisAlignment.start,
      ),
    );
  }
}
