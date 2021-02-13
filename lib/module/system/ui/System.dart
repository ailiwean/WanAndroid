import 'package:flutter/material.dart';
import 'package:wan_android/module/RootPage.dart';

class System extends StatefulWidget with RootPage {
  static String pageName = "体系";

  @override
  _SystemState createState() => _SystemState();

  @override
  String getPageName() {
    return pageName;
  }

  @override
  Icon getPageIcon() {
    return Icon(Icons.sort);
  }
}

class _SystemState extends State<System> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(System.pageName),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
