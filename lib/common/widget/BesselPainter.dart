import 'package:flutter/material.dart';

/// @Description: 绘制贝塞尔曲线
/// @Author: SWY
/// @Date: 2021/2/11 18:20
class BesselPainter extends CustomPainter {
  Paint _besselPaint;
  Path _path = Path();
  double _values;

  BesselPainter() {
    initPaint();
  }

  initPaint() {
    this._besselPaint = Paint()
      ..color = Color.fromARGB(150, 255, 251, 240)
      ..isAntiAlias = true
      ..strokeCap = StrokeCap.round; //折线连接处圆滑处理
  }

  //绘制比例
  setValues(double values) {
    this._values = values;
  }

  @override
  void paint(Canvas canvas, Size size) {
    _path.reset();
    // _path.cubicTo(x1, y1, x2, y2, x3, y3);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
