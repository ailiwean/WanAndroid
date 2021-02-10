import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

statusOverLayerBar() {
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

getAppBarHeight(AppBar appBar) {
  return appBar.preferredSize.height;
}

getStatueBarHeight(BuildContext context) {
  return MediaQuery.of(context).padding.top;
}

Size getScreenSize(BuildContext context) {
  return MediaQuery.of(context).size;
}
