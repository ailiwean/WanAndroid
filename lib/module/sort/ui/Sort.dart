import 'package:flutter/material.dart';
import 'package:wan_android/module/RootPage.dart';

class Sort extends StatefulWidget with RootPage {
  @override
  _SortState createState() => _SortState();

  @override
  String getPageName() {
    return "分类";
  }

  @override
  Icon getPageIcon() {
    return Icon(Icons.sort);
  }



}

class _SortState extends State<Sort> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("分类"),);
  }
}
