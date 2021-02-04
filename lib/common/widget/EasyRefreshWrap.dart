import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class EasyRefreshWrap extends EasyRefresh {
  EasyRefreshWrap(
      {Widget child, OnRefreshCallback onRefresh, OnRefreshCallback onLoad})
      : super(
            child: child,
            onRefresh: onRefresh,
            onLoad: onLoad,
            enableControlFinishLoad: true,
            enableControlFinishRefresh: true);
}
