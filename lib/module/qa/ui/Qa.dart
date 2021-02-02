import 'package:flutter/material.dart';
import 'package:wan_android/module/RootPage.dart';

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

class _QaState extends State<Qa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(Qa.pageName),
      ),
    );
  }
}
