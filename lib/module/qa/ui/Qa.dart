import 'package:flutter/material.dart';
import 'package:wan_android/common/network/Network.dart';
import 'package:wan_android/common/widget/RefreshListView.dart';
import 'package:wan_android/module/RootPage.dart';
import 'package:wan_android/module/home/bean/res/ArticlePageRes.dart';
import 'package:wan_android/module/home/widget/ArticleListAdapter.dart';
import 'package:wan_android/module/qa/api/QaApi.dart';

class Qa extends StatefulWidget with RootPage {
  static String pageName = "问答";

  @override
  _QaState createState() => _QaState();

  @override
  String getPageName() {
    return pageName;
  }

  @override
  Icon getPageIcon() {
    return Icon(Icons.insights_outlined);
  }
}

class _QaState extends State<Qa> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(Qa.pageName),
      ),
      body: RefreshListView(
        adapter: ArticleListAdapter(),
        requestFun: (int page) async {
          return ArticlePageRes.fromJson(await Network.execute(qaList(page)))
              .data;
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
