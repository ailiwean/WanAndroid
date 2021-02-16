import 'package:flutter/material.dart';
import 'package:wan_android/common/helper/NestPageHelperParent.dart';
import 'package:wan_android/module/RootPage.dart';
import 'package:wan_android/module/mine/ui/Mine.dart';
import 'package:wan_android/module/qa/ui/Qa.dart';
import 'package:wan_android/res/AppColors.dart';
import 'package:wan_android/res/Duration.dart';

import 'module/home/ui/Home.dart';
import 'module/system/ui/System.dart';

class MainPage extends StatefulWidget {
  final loginJson;

  MainPage({Key key, this.loginJson});

  @override
  _MainPageState createState() => _MainPageState(loginJson: loginJson);
}

class _MainPageState extends State<MainPage> {
  final loginJson;

  List pageList = <Widget>[];

  //当前选中item
  var curentIndex = 0;

  PageView pageView;

  PageController pageController;

  _MainPageState({this.loginJson}) {
    pageList
      ..add(Home())
      ..add(System())
      ..add(Qa())
      ..add(Mine(
        loginjson: loginJson.toString(),
      ));
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: curentIndex);
    this.pageView = PageView(
        controller: pageController,
        children: pageList,
        onPageChanged: (current) {
          setState(() {
            curentIndex = current;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestPageHelperParent(
            child: pageView, pageController: pageController),
        bottomNavigationBar: _getBottomNavigationBar());
  }

  BottomNavigationBar _getBottomNavigationBar() {
    List<BottomNavigationBarItem> itemList = [];
    pageList.forEach((element) {
      itemList.add(BottomNavigationBarItem(
          icon: (element as RootPage).getPageIcon(),
          label: (element as RootPage).getPageName()));
    });
    return BottomNavigationBar(
      items: itemList,
      unselectedItemColor: AppColors.navigatorItemColor,
      selectedItemColor: AppColors.navigatorItemSelectColor,
      type: BottomNavigationBarType.fixed,
      currentIndex: this.curentIndex,
      onTap: (index) {
        setState(() {
          curentIndex = index;
        });
        pageView.controller.animateToPage(index,
            duration: pageSwitchDuration, curve: Curves.ease);
      },
    );
  }
}
