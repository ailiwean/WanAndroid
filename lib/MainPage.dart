import 'package:flutter/material.dart';
import 'package:wan_android/module/RootPage.dart';
import 'package:wan_android/module/me/ui/Me.dart';
import 'package:wan_android/module/qa/ui/Qa.dart';
import 'package:wan_android/res/AppColors.dart';
import 'package:wan_android/res/Duration.dart';

import 'module/home/ui/Home.dart';
import 'module/sort/ui/Sort.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final pageList = <Widget>[Home(), Sort(), Qa(), Me()];

  //当前选中item
  var curentIndex = 0;

  PageView pageView;

  _MainPageState() {
    this.pageView = PageView(
      controller: PageController(initialPage: curentIndex),
      children: pageList,
      onPageChanged: (current) {
        setState(() {
          curentIndex = current;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pageView, bottomNavigationBar: _getBottomNavigationBar());
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
