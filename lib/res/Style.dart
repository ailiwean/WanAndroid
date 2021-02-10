import 'package:flutter/material.dart';
import 'package:wan_android/common/utils/AppScreen.dart';

class Style {
  // 用于子控件点击事件，  无背景无边距
  static ButtonStyle transButtonStyle = ButtonStyle(
      overlayColor: MaterialStateProperty.all(Colors.black12),
      backgroundColor: MaterialStateProperty.all(Colors.transparent),
      shadowColor: MaterialStateProperty.all(Colors.transparent),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      minimumSize: MaterialStateProperty.all(Size(0, 0)),
      padding: MaterialStateProperty.all(EdgeInsets.zero));

  static Placeholder heightPlaceHolder(double heightPx) => Placeholder(
        color: Colors.transparent,
        fallbackWidth: 1,
        fallbackHeight: setSuitHeightPx(heightPx),
      );

  static Placeholder widthPlaceHolder(double widthPx) => Placeholder(
        color: Colors.transparent,
        fallbackWidth: setSuitWidthPx(widthPx),
        fallbackHeight: 1,
      );
}
