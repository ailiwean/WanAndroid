import 'package:flutter/material.dart';
import 'package:wan_android/module/RootPage.dart';

class Me extends StatefulWidget with RootPage {
  @override
  _MeState createState() => _MeState();

  @override
  String getPageName() {
    return "我的";
  }

  @override
  Icon getPageIcon() {
    return Icon(Icons.how_to_reg);
  }
}

class _MeState extends State<Me> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("我的"),
    );
  }
}
