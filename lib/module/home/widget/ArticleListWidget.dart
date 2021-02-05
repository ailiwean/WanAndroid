import 'package:flutter/material.dart';
import 'package:wan_android/module/home/bean/res/ArticleRes.dart';

/// @Description: 文章列表
/// @Author: SWY
/// @Date: 2021/2/5 22:51
class ArticleListWidget extends StatefulWidget {
  final UIControl uiControl;
  final Widget head;
  final Widget bottom;

  ArticleListWidget({this.uiControl, this.head, this.bottom});

  @override
  _ArticleListWidgetState createState() {
    _ArticleListWidgetState widget =
        _ArticleListWidgetState(head: this.head, bottom: this.bottom);
    uiControl.bindView(widget);
    return widget;
  }
}

class UIControl {
  List<ArticleRes> articleTopList = [];
  List<ArticleRes> articleGenList = [];

  _ArticleListWidgetState widgetState;

  bindView(_ArticleListWidgetState widgetState) {
    this.widgetState = widgetState;
  }

  setNetData(List<ArticleRes> articleList) {
    List<List<ArticleRes>> article = _toTimeTypeSort(articleList);
    this.articleTopList.clear();
    this.articleTopList.clear();
    this.articleTopList.addAll(article[0]);
    this.articleGenList.addAll(article[1]);
    _refreshView();
  }

  addTopArticle(List<ArticleRes> articleList) {
    this.articleTopList.addAll(articleTopList);
    _refreshView();
  }

  addGenArticle(List<ArticleRes> articleList) {
    this.articleGenList.addAll(articleList);
    _refreshView();
  }

  _refreshView() {
    widgetState.setData(articleTopList, articleGenList);
  }

  List<List<ArticleRes>> _toTimeTypeSort(List<ArticleRes> articleList) {
    //普通文章
    List<ArticleRes> type0 = [];
    //置顶文章
    List<ArticleRes> type1 = [];
    articleList.forEach((element) {
      element.type == 0 ? type0.add(element) : type1.add(element);
    });
    var compare = (ArticleRes a, ArticleRes b) {
      return a.publishTime - b.publishTime;
    };
    type0.sort(compare);
    type1.sort(compare);
    List<List<ArticleRes>> article = [];
    article.add(type1);
    article.add(type0);
    return article;
  }
}

class _ArticleListWidgetState extends State<ArticleListWidget> {
  List<ArticleRes> articleTopList = [];
  List<ArticleRes> articleGenList = [];
  ScrollController scrollController;

  final Widget head;
  final Widget bottom;

  _ArticleListWidgetState({this.head, this.bottom});

  setData(List<ArticleRes> articleTopList, List<ArticleRes> articleGenList) {
    if (articleTopList != null) this.articleTopList = articleTopList;
    if (articleGenList != null) this.articleGenList = articleGenList;
    setState(() {});
  }

  @override
  void initState() {
    scrollController = ScrollController();
  }

  int _getExtraNum() {
    return (_hasHead() ? 1 : 0) + (_hasBottom() ? 1 : 0);
  }

  int _getItemSize() {
    return articleTopList.length + articleGenList.length + _getExtraNum();
  }

  bool _hasHead() {
    return head != null;
  }

  bool _hasBottom() {
    return bottom != null;
  }

  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _getItemSize(),
      itemBuilder: (context, index) {
        //头部
        if (_hasHead() && index == 0) return head;
        //尾部
        if (_hasBottom() && index == (_getItemSize() - 1)) return bottom;
        int realIndex = index - (_hasHead() ? 1 : 0);
        return Text(realIndex.toString());
      },
      controller: scrollController,
    );
  }
}
