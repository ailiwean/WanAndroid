import 'package:flutter/material.dart';
import 'package:wan_android/module/RootPage.dart';

class Qa extends StatefulWidget with RootPage {
  @override
  _QaState createState() => _QaState();

  @override
  String getPageName() {
    return "问答";
  }

  @override
  Icon getPageIcon() {
    return Icon(Icons.insights_outlined);
  }

}

class _QaState extends State<Qa> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("问答"),);
  }
}
