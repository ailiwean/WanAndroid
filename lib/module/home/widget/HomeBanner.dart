import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wan_android/common/network/Network.dart';
import 'package:wan_android/common/utils/ToastUtils.dart';
import 'package:wan_android/module/home/api/HomeApi.dart';
import 'package:wan_android/module/home/bean/res/BannerRes.dart';
import 'package:wan_android/res/Duration.dart';
import 'package:wan_android/res/Style.dart';

class HomeBanner extends StatefulWidget {
  @override
  _HomeBannerState createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  //当前page下标
  var currentIndex = 0;

  int maxPageNum = 100000;

  //page页数据
  List<BannerRes> pageDataList = [];

  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _postBannerData();
    _pageController = _getPageController();
  }

  ///请求banner数据
  void _postBannerData() {
    Network.executeList(banner()).then((value) {
      setState(() {
        pageDataList.clear();
        pageDataList.addAll(value.map((e) => BannerRes.fromJson(e)));
      });
    });
    timingTask();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1 / 0.6,
        child: PageView.builder(
          controller: _pageController,
          onPageChanged: (current) {
            this.currentIndex = current;
          },
          itemCount: maxPageNum,
          itemBuilder: (BuildContext context, int index) {
            if (pageDataList.length == 0)
              return null;
            else
              return ElevatedButton(
                style: Style.transButtonStyle,
                child: Image.network(
                  pageDataList[index % pageDataList.length].imagePath,
                  fit: BoxFit.fitHeight,
                ),
                onPressed: () {
                  setState(() {});
                },
              );
          },
        ));
  }

  timingTask() {
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      _pageController.animateToPage((_pageController.page + 1).toInt(),
          duration: pageSwitchDuration, curve: Curves.ease);
    });
  }

  PageController _getPageController() {
    return PageController(initialPage: maxPageNum ~/ 2);
  }
}
