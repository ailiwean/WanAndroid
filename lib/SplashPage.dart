import 'package:flutter/material.dart';
import 'package:wan_android/MainPage.dart';
import 'package:wan_android/common/route/RouteManager.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    _delayStartMainPage(context);
    return Center(
      child: Text("SplashActivity"),
    );
  }

  _delayStartMainPage(BuildContext context) {
    Future.delayed(Duration(milliseconds: 500), () {
      RouteManager.startPageWithFinish(context, MainPage);
    });
  }
}
