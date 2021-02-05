import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

/// 下拉刷新上拉加载内部维护pagesize,pageNumber
/// @Author: SWY
/// @Date: 2021/2/4 18:56
class EasyRefreshWrap extends EasyRefresh {

  final requestData;

  EasyRefreshWrap({Widget child, this.requestData})
      : super(
          child: child,
          onRefresh: () {},
          onLoad: () {

          },
          enableControlFinishLoad: true,
          enableControlFinishRefresh: true,
        ) {}
}

typedef requestData = Function(int page, int pageNum);
