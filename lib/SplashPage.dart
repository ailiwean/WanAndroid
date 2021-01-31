import 'package:flutter/material.dart';
import 'package:wan_android/MainPage.dart';
import 'package:wan_android/route/RouteManager.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("dddd"),
      ),
      body: ElevatedButton(
        child: Text("点击跳转"),
        onPressed: () {
          RouteManager.startPage(context, MainPage);
        },
      ),
    );
  }
}
