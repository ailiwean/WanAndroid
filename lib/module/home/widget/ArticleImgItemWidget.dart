import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wan_android/common/utils/AppDateUtils.dart';
import 'package:wan_android/common/utils/AppRegUtils.dart';
import 'package:wan_android/common/utils/AppScreen.dart';
import 'package:wan_android/module/home/bean/res/ArticleRes.dart';
import 'package:wan_android/res/AppColors.dart';

///文章带图片item
class ArticleImgItemWidget extends StatelessWidget {
  final ArticleRes articleRes;

  ArticleImgItemWidget({this.articleRes});

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
      widthList.add(Placeholder(
        color: Colors.transparent,
        fallbackWidth: setSuitWidthPx(10),
        fallbackHeight: setSuitWidthPx(10),
      ));
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
    List<Widget> child = [];

    //加载图片资源
    child.add(Expanded(
        flex: 1,
        child: Padding(
          padding: EdgeInsets.only(right: setSuitWidthPx(20)),
          child: Image(
              image: CachedNetworkImageProvider(
                articleRes.envelopePic,
              ),
              fit: BoxFit.cover),
        )));

    //加载内容描述
    child.add(Expanded(
      flex: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            AppRegUtils.deleteJsH5Text(articleRes.title),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            textAlign: TextAlign.left,
            style: TextStyle(
                color: AppColors.textTitleColor, fontSize: setSuitTextPx(26)),
          ),
          Placeholder(
            color: Colors.transparent,
            fallbackHeight: setSuitHeightPx(10),
          ),
          Text(
            AppRegUtils.deleteJsH5Text(articleRes.desc),
            maxLines: 3,
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: AppColors.textContentColor, fontSize: setSuitTextPx(22)),
          )
        ],
      ),
    ));

    return Padding(
        padding: EdgeInsets.only(
            left: setSuitWidthPx(20),
            top: setSuitWidthPx(10),
            right: setSuitWidthPx(20),
            bottom: setSuitWidthPx(5)),
        child: AspectRatio(
          aspectRatio: 16 / 4,
          child: Row(
            children: child,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
        ));
  }

  //获取Item底部信息
  Widget getBottomWidget() {
    List<Widget> child = [];

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
}
