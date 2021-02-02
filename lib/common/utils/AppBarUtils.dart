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
