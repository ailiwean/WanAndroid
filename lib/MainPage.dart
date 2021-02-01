import 'package:flutter/material.dart';
import 'package:wan_android/module/RootPage.dart';
import 'file:///C:/Users/Ailiwean/Desktop/project/wan_android/lib/module/home/ui/Home.dart';
import 'file:///C:/Users/Ailiwean/Desktop/project/wan_android/lib/module/me/ui/Me.dart';
import 'file:///C:/Users/Ailiwean/Desktop/project/wan_android/lib/module/qa/ui/Qa.dart';
import 'file:///C:/Users/Ailiwean/Desktop/project/wan_android/lib/module/sort/ui/Sort.dart';
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
