import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wan_android/res/AppColors.dart';

class AppToastUtils {
  static init(BuildContext buildContext) {}

  static showToast(String text) {
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.navigatorItemSelectColor,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
