import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wan_android/common/native/Native.dart';
import 'package:wan_android/common/native/NativeChannel.dart';
import 'package:wan_android/common/network/Network.dart';
import 'package:wan_android/common/route/RouteManager.dart';
import 'package:wan_android/common/utils/ToastUtils.dart';
import 'package:wan_android/common/widget/BaseListView.dart';
import 'package:wan_android/common/widget/EasyRefreshWrap.dart';
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

  @override
  void initState() {
    super.initState();
    _adapter = ArticleListAdapter();
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
        body: EasyRefreshWrap(
          baseListView: BaseListView(
            adapter: _adapter,
          ),
          dataControl: DataControl(),
          requestFun: (page, result) {
        //    if (page == 0) _loadArticleTopList();
            _loadArticlePageList(page, result);
          },
        ));
  }

  //请求文章分页数据
  _loadArticlePageList(page, result) {
    //请求page
    Network.execute(arricleList(page)).then((value) {
      result(ArticlePageRes.fromJson(value).data);
    });
  }

  //请求文章置顶数据
  _loadArticleTopList() {
    //请求page
    Network.executeList(articleTop()).then((value) {
      //置顶文章插入到头部
      _adapter.addData(value.map((e) => ArticleRes.fromJson(e)), insert: 0);
    });
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
      ToastUtils.showToast("内容已复制到剪切板");
    }).then((value) {});
  }

  @override
  bool get wantKeepAlive => true;
}
