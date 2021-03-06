import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:wan_android/common/utils/AppDateUtils.dart';
import 'package:wan_android/common/utils/AppSpUtils.dart';

/// @Description: 每日一图
/// @Author: SWY
/// @Date: 2021/2/10 22:52
class DayPicture extends StatefulWidget {
  @override
  _DayPictureState createState() => _DayPictureState();
}

class _DayPictureState extends State<DayPicture> {
  final url = "https://api.mfstudio.cc/motu";
  bool isLogin = false;

  @override
  Widget build(BuildContext context) {
    isNeedUpdate();
    isUserLogin();
    return Stack(
      children: <Widget>[
        _getCacheNetImage(),
        BackdropFilter(
            filter: ImageFilter.blur(
                sigmaX: isLogin ? 0 : 5.0, sigmaY: isLogin ? 0 : 5.0),
            child: Container(color: Colors.transparent)),
      ],
      fit: StackFit.expand,
    );
  }

  void isUserLogin() {
    AppSpUtils.getValues(AppSpUtils.loginJson, nullValues: "").then((value) {
      isLogin = value.toString().isNotEmpty;
      setState(() {});
    });
  }

  _getCacheNetImage() {
    return Image(
      image: CachedNetworkImageProvider(url),
      fit: BoxFit.cover,
    );
  }

  void isNeedUpdate() async {
    int now = AppDateUtils.getNowBeforeDurtion(Duration(days: 0));
    int moreBefore = AppDateUtils.getNowBeforeDurtion(Duration(days: 1));
    int before =
        await AppSpUtils.getValues<int>(AppSpUtils.daypicture, nullValues: 0);
    if (moreBefore > before) {
      await CachedNetworkImage.evictFromCache(url);
      //存储刷新
      await AppSpUtils.setValues(AppSpUtils.daypicture, now);
      setState(() {});
    }
  }
}
