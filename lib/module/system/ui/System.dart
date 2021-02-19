import 'package:flutter/material.dart';
import 'package:wan_android/common/helper/NestPageHelperChild.dart';
import 'package:wan_android/common/utils/AppScreen.dart';
import 'package:wan_android/module/RootPage.dart';
import 'package:wan_android/res/AppColors.dart';

import 'NavigationPart.dart';
import 'SystemPart.dart';

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

class _SystemState extends State<System>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return NestPageHelperChild(
        child: Scaffold(
      appBar: AppBar(
          title: TabBar(
        indicatorColor: Colors.transparent,
        controller: tabController,
        unselectedLabelColor: Colors.black,
        labelColor: AppColors.navigatorItemSelectColor,
        labelStyle: TextStyle(fontSize: setSuitTextPx(35)),
        tabs: <Widget>[
          Tab(text: "                     体系"),
          Tab(text: "导航                    "),
        ],
      )),
      body: TabBarView(
        controller: tabController,
        children: <Widget>[SystemPart(), NavigationPart()],
      ),
    ));
  }

  @override
  bool get wantKeepAlive => true;
}
