import 'package:flutter/material.dart';
import 'package:wan_android/common/utils/AppDateUtils.dart';
import 'package:wan_android/common/utils/AppRegUtils.dart';
import 'package:wan_android/common/utils/AppScreen.dart';
import 'package:wan_android/module/home/bean/res/ArticleRes.dart';
import 'package:wan_android/res/AppColors.dart';
import 'package:wan_android/res/Style.dart';

///文章Item
class ArticleItemWidget extends StatelessWidget {
  final ArticleRes articleRes;

  ArticleItemWidget({this.articleRes});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: setSuitWidthPx(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [getTitleWidget(), getContentWidget(), getBottomWidget()],
        ));
  }

  //获取分组
  List<Widget> getTagWidget() {
    List<Widget> widthList = [];
    articleRes.tags.forEach((element) {
      widthList.add(Container(
        padding: EdgeInsets.fromLTRB(setSuitWidthPx(5), setSuitWidthPx(0),
            setSuitWidthPx(5), setSuitWidthPx(2)),
        child: Text(
          element.name,
          style: TextStyle(
              fontSize: setSuitTextPx(20), color: AppColors.signColor),
        ),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.signColor, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(5))),
      ));
      widthList.add(Style.widthPlaceHolder(10));
    });
    return widthList;
  }

  //获取item顶部信息
  Widget getTitleWidget() {
    List<Widget> child = [];
    //发版时间在距当前时间前3天都视为新
    if (articleRes.publishTime >
        AppDateUtils.getNowBeforeDurtion(Duration(days: 3)))
      child.add(Padding(
        padding: EdgeInsets.only(right: setSuitWidthPx(10)),
        child: Text("新",
            style: TextStyle(
                color: AppColors.signColor, fontSize: setSuitTextPx(20))),
      ));

    //作者信息
    child.add(Padding(
      padding: EdgeInsets.only(right: setSuitWidthPx(10)),
      child: Text(articleRes.author + articleRes.shareUser,
          style: TextStyle(
              color: AppColors.textContentColor, fontSize: setSuitTextPx(25))),
    ));

    // 文章所在分组
    child.add(Expanded(
        child: Row(
      children: getTagWidget(),
      crossAxisAlignment: CrossAxisAlignment.center,
    )));

    //文章更新日期
    child.add(Text(articleRes.niceDate,
        style: TextStyle(
            color: AppColors.textContentDescColor,
            fontSize: setSuitTextPx(20))));

    return Padding(
      padding: EdgeInsets.only(
          left: setSuitWidthPx(20),
          top: setSuitWidthPx(5),
          right: setSuitWidthPx(20),
          bottom: setSuitWidthPx(5)),
      child: Row(
        children: child,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
    );
  }

  //获取item内容信息
  Widget getContentWidget() {
    return Padding(
      padding: EdgeInsets.only(
          left: setSuitWidthPx(20),
          top: setSuitWidthPx(10),
          bottom: setSuitHeightPx(0),
          right: setSuitWidthPx(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppRegUtils.deleteJsH5Text(articleRes.title),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            maxLines: articleRes.desc.isEmpty ? 2 : 1,
            style: TextStyle(
                color: AppColors.textTitleColor, fontSize: setSuitTextPx(26)),
          ),
          if (articleRes.desc.isNotEmpty) Style.heightPlaceHolder(10),
          if (articleRes.desc.isNotEmpty)
            Text(
              AppRegUtils.deleteJsH5Text(articleRes.desc),
              maxLines: 3,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: AppColors.textContentColor,
                  fontSize: setSuitTextPx(22)),
            )
        ],
      ),
    );
  }

  //获取Item底部信息
  Widget getBottomWidget() {
    List<Widget> child = [];

    //1 为置顶文章
    if (articleRes.type == 1) {
      child.add(Text(
        "置顶",
        style: TextStyle(
            color: AppColors.navigatorItemSelectColor,
            fontSize: setSuitTextPx(20)),
      ));
      child.add(Style.widthPlaceHolder(10));
    }
    //详细分组
    child.add(Text(
      articleRes.chapterName + " • " + articleRes.superChapterName,
      style: TextStyle(
          color: AppColors.textContentDescColor, fontSize: setSuitTextPx(20)),
    ));

    child.add(Expanded(
      child: Container(),
    ));

    if (articleRes.zan != 0) {
      child.add(Padding(
          padding: EdgeInsets.only(right: setSuitWidthPx(5)),
          child: Icon(
            Icons.thumb_up,
            size: setSuitWidthPx(25),
            color: AppColors.textContentDescColor,
          )));
      child.add(Text(
        articleRes.zan.toString(),
        style: TextStyle(
            color: AppColors.textContentDescColor, fontSize: setSuitTextPx(20)),
      ));
    }
    return Padding(
      padding: EdgeInsets.only(
          left: setSuitWidthPx(20),
          top: setSuitWidthPx(10),
          right: setSuitWidthPx(20),
          bottom: setSuitWidthPx(25)),
      child: Row(
        children: child,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
    );
  }
}
