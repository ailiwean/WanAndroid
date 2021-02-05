import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

/// 内部维护pagesize,pageNumber
class EasyRefreshWrap extends EasyRefresh {
  EasyRefreshWrap(
      {Widget child, OnRefreshCallback onRefresh, OnRefreshCallback onLoad})
      : super(
            child: child,
            onRefresh: onRefresh,
            onLoad: onLoad,
            enableControlFinishLoad: true,
            enableControlFinishRefresh: true) {}
}
