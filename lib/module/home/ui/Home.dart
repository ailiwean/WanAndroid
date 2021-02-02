import 'package:flutter/material.dart';
import 'package:wan_android/common/native/Native.dart';
import 'package:wan_android/common/native/NativeChannel.dart';
import 'package:wan_android/common/utils/ToastUtils.dart';
import 'package:wan_android/module/RootPage.dart';
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

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
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
            ).notice().then((value) => ToastUtils.showToast(value.toString()));
          },
        ),
      ),
    );
  }
}
