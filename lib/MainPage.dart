import 'package:flutter/material.dart';
import 'package:wan_android/module/RootPage.dart';
import 'package:wan_android/module/home/Home.dart';
import 'package:wan_android/module/me/Me.dart';
import 'package:wan_android/module/qa/Qa.dart';
import 'package:wan_android/module/sort/Sort.dart';
import 'package:wan_android/res/AppColors.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final pageList = <RootPage>[Home(), Sort(), Qa(), Me()];

  //当前选中item
  var curentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("appbar"),
          backgroundColor: Colors.black26,
        ),
        body: pageList[curentIndex] as Widget,
        bottomNavigationBar: _getBottomNavigationBar());
  }

  BottomNavigationBar _getBottomNavigationBar() {
    List<BottomNavigationBarItem> itemList = [];
    pageList.forEach((element) {
      itemList.add(BottomNavigationBarItem(
          icon: element.getPageIcon(), label: element.getPageName()));
    });
    return BottomNavigationBar(
      items: itemList,
      backgroundColor: AppColors.navigatorBg,
      unselectedItemColor: AppColors.navigatorItemColor,
      selectedItemColor: AppColors.navigatorItemSelectColor,
      type: BottomNavigationBarType.fixed,
      currentIndex: this.curentIndex,
      onTap: (index) {
        setState(() {
          curentIndex = index;
        });
      },
    );
  }
}
