import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wan_android/common/native/Native.dart';
import 'package:wan_android/common/native/NativeChannel.dart';
import 'package:wan_android/common/network/Network.dart';
import 'package:wan_android/common/route/RouteManager.dart';
import 'package:wan_android/common/utils/AppToastUtils.dart';
import 'package:wan_android/common/widget/RefreshListView.dart';
import 'package:wan_android/common/widget/WebViewWrap.dart';
import 'package:wan_android/module/RootPage.dart';
import 'package:wan_android/module/home/api/HomeApi.dart';
import 'package:wan_android/module/home/bean/res/ArticlePageRes.dart';
import 'package:wan_android/module/home/bean/res/ArticleRes.dart';
import 'package:wan_android/module/home/ui/HomeSearch.dart';
import 'package:wan_android/module/home/widget/ArticleListAdapter.dart';
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
  ArticleListAdapter _adapter;

  //是否加载置顶文章
  bool hasLoadTop = false;

  @override
  void initState() {
    super.initState();
    _adapter = ArticleListAdapter();
    //ToastUtils.showToast("text")
  }

  @override
  Widget build(BuildContext context) {
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
              Native(
                channel: NativeChannel.scan[0],
                servelName: NativeChannel.scan[1],
              ).notice().then((value) => _qrResultAnalysis(context, value));
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
        body: RefreshListView(
          adapter: _adapter,
          requestFun: (page) async {
            //先请求分页数据
            var pageList = await _loadArticlePageList(page);
            //第0页则向分页数据前插入置顶数据
            if (page == 0) pageList.insertAll(0, await _loadArticleTopList());
            return pageList;
          },
        ));
  }

  //请求文章分页数据
  Future<List<ArticleRes>> _loadArticlePageList(page) async {
    //请求page
    ArticlePageRes pageRes =
        ArticlePageRes.fromJson(await Network.execute(arricleList(page)));
    return pageRes.data;
  }

  //请求文章置顶数据
  Future<List<ArticleRes>> _loadArticleTopList() async {
    List<ArticleRes> resultList = [];
    resultList.addAll((await Network.executeList(articleTop()))
        .map((e) => ArticleRes.fromJson(e)));
    return resultList;
  }

  //二维码结果分析跳转
  _qrResultAnalysis(BuildContext context, String text) {
    //跳转普通网页
    if (text.startsWith("https:") || text.startsWith("http:")) {
      RouteManager.startPage(context, WebViewWrap,
          argusments: {"url": text, "title": ""});
      return;
    }
    launch(text).catchError((dynamic) {
      //普通文本复制到剪贴板
      Clipboard.setData(ClipboardData(text: text));
      AppToastUtils.showToast("内容已复制到剪切板");
    }).then((value) {});
  }

  @override
  bool get wantKeepAlive => true;
}
