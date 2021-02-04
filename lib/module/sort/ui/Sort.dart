import 'package:flutter/material.dart';
import 'package:wan_android/module/RootPage.dart';

class Sort extends StatefulWidget with RootPage {
  static String pageName = "分类";

  @override
  _SortState createState() => _SortState();

  @override
  String getPageName() {
    return pageName;
  }

  @override
  Icon getPageIcon() {
    return Icon(Icons.sort);
  }
}

class _SortState extends State<Sort> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(Sort.pageName),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
