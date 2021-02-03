import 'package:flutter/material.dart';

class Style {
  // 用于子控件点击事件，  无背景无边距
  static ButtonStyle transButtonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.transparent),
      shadowColor: MaterialStateProperty.all(Colors.transparent),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      minimumSize: MaterialStateProperty.all(Size(0, 0)),
      padding: MaterialStateProperty.all(EdgeInsets.zero));
}
