import 'package:flutter/material.dart';
import 'package:wan_android/common/utils/ToastUtils.dart';
import 'package:wan_android/module/RootPage.dart';

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

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(Home.pageName),
        leading: ElevatedButton(
          style: ButtonStyle(),
          child: Icon(Icons.qr_code_scanner),
          onPressed: () {
            ToastUtils.showToast("扫码");
          },
        ),
      ),
    );
  }
}
