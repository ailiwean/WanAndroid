import 'package:flutter/material.dart';
import 'package:wan_android/common/network/Network.dart';
import 'package:wan_android/module/RootPage.dart';

class Me extends StatefulWidget with RootPage {
  static String pageName = "我的";

  @override
  _MeState createState() => _MeState();

  @override
  String getPageName() {
    return pageName;
  }

  @override
  Icon getPageIcon() {
    return Icon(Icons.how_to_reg);
  }
}

class _MeState extends State<Me> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(Me.pageName),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
