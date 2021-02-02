import 'package:flutter/material.dart';
import 'package:wan_android/common/network/Network.dart';
import 'package:wan_android/module/RootPage.dart';
import 'package:wan_android/module/home/api/Test.dart';

class Home extends StatefulWidget with RootPage {
  @override
  _HomeState createState() => _HomeState();

  @override
  String getPageName() {
    return "首页";
  }

  @override
  Icon getPageIcon() {
    return Icon(Icons.home);
  }
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
      child: Text("首页"),
      onPressed: () {
        Network.execute(test()).then((value) =>
            {print("返回为-------" + value.data.toString() + "---------")});
      },
    ));
  }
}
