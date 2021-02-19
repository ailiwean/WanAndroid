import 'package:flutter/material.dart';
import 'package:wan_android/MainPage.dart';
import 'package:wan_android/common/route/RouteManager.dart';
import 'package:wan_android/common/utils/AppSpUtils.dart';
import 'package:wan_android/module/mine/ui/Mine.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    verifyLogin();
    return Container(color: Colors.white);
  }

  void verifyLogin() {
    AppSpUtils.getValues(AppSpUtils.loginJson).then((value) {
      RouteManager.startPageWithFinish(context, MainPage,
          argusments: {Mine.needLoginKey: value.toString()});
    });
  }
}
