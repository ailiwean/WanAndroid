import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wan_android/common/network/Network.dart';
import 'package:wan_android/common/route/RouteManager.dart';
import 'package:wan_android/common/widget/WebViewWrap.dart';
import 'package:wan_android/module/home/api/HomeApi.dart';
import 'package:wan_android/module/home/bean/res/BannerRes.dart';
import 'package:wan_android/res/Duration.dart';
import 'package:wan_android/res/Style.dart';

class HomeBanner extends StatefulWidget {
  @override
  _HomeBannerState createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner>
    with AutomaticKeepAliveClientMixin {
  //当前page下标
  static var currentIndex = maxPageNum ~/ 2;

  static int maxPageNum = 100000;

  //page页数据
  static List<BannerRes> pageDataList = [];

  PageController _pageController;

  Timer timer;

  @override
  void initState() {
    super.initState();
    if (pageDataList.isEmpty) _postBannerData();
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
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    startTimingTask();
    return AspectRatio(
        aspectRatio: 1 / 0.6,
        child: PageView.builder(
          controller: _pageController,
          onPageChanged: (current) {
            _HomeBannerState.currentIndex = current;
          },
          itemCount: maxPageNum,
          itemBuilder: (BuildContext context, int index) {
            if (pageDataList.length == 0)
              return null;
            else
              return Listener(
                child: ElevatedButton(
                  style: Style.transButtonStyle,
                  child: _getCahceNetImage(index),
                  onPressed: () {
                    setState(() {
                      RouteManager.startPage(context, WebViewWrap, argusments: {
                        "url": pageDataList[index % pageDataList.length].url,
                        "title": pageDataList[index % pageDataList.length].title
                      });
                    });
                  },
                ),
                onPointerDown: (event) {
                  endTimingTask();
                },
                onPointerUp: (event) {
                  startTimingTask();
                },
              );
          },
        ));
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  _getCahceNetImage(int index) {
    return Image(
        image: CachedNetworkImageProvider(
            pageDataList[index % pageDataList.length].imagePath));
  }

  startTimingTask() {
    if (timer != null) return;
    if (pageDataList.isEmpty) return;
    timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      _pageController.animateToPage((_pageController.page + 1).toInt(),
          duration: pageSwitchDuration, curve: Curves.ease);
    });
  }

  endTimingTask() {
    if (timer != null) timer.cancel();
    timer = null;
  }

  PageController _getPageController() {
    return PageController(initialPage: _HomeBannerState.currentIndex);
  }

  @override
  bool get wantKeepAlive => false;
}
