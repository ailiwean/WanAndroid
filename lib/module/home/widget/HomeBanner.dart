import 'package:flutter/material.dart';
import 'package:wan_android/common/network/Network.dart';
import 'package:wan_android/module/home/api/HomeApi.dart';
import 'package:wan_android/module/home/bean/res/BannerRes.dart';
import 'package:wan_android/res/Style.dart';

class HomeBanner extends StatefulWidget {
  @override
  _HomeBannerState createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  //当前page下标
  var currentIndex = 0;

  //page页数据
  List<BannerRes> pageDataList = [];

  @override
  void initState() {
    super.initState();
    _postBannerData();
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
    return PageView.builder(
      controller: _pageController(),
      onPageChanged: (current) {
        this.currentIndex = current;
      },
      itemCount: this.pageDataList.length,
      itemBuilder: (BuildContext context, int index) {
        return ElevatedButton(
          style: Style.transButtonStyle,
          child: Image.network(pageDataList[index].imagePath),
          onPressed: () {
            setState(() {});
          },
        );
      },
    );
  }

  PageController _pageController() {
    return PageController();
  }
}
