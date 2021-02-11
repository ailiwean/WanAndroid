import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

/// @Description: 绘制贝塞尔曲线
/// @Author: SWY
/// @Date: 2021/2/11 18:20
class BesselPainter extends CustomPainter {
  static Paint _paint;
  static Path _path = Path();

  //宽度
  double width = 0;

  //贝塞尔控制点1
  static Point _control1 = Point(0.0, 50.0);

  //贝塞尔控制点2
  static Point _control2 = Point(50.0, 50.0);

  static bool isRight = true;

  BesselPainter({this.width}) {
    if (_paint == null) initPaint();
    update();
  }

  initPaint() {
    _paint = Paint()
      ..color = Color.fromARGB(150, 255, 251, 240)
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round; //折线连接处圆滑处理
  }

  //绘制比例
  update() {
    Point offset;
    if (isRight)
      offset = Point((width - 50.0) / 60.0 / 10.0, 0.0);
    else
      offset = Point(-(width - 50.0) / 60.0 / 10.0, 0.0);
    _control1 += offset;
    _control2 += offset;
    if (_control1.x > width - 50) isRight = false;
    if (_control1.x <= 0) isRight = true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    width = size.width;
    _path.reset();
    _path.moveTo(0, 0);
    _path.cubicTo(
        _control1.x, _control1.y, _control2.x, _control2.y, size.width, 0);
    _path.lineTo(size.width, size.height);
    _path.lineTo(0, size.height);
    _path.close();
    canvas.drawPath(_path, _paint);
    canvas.drawCircle(
        Offset((_control1.x + _control2.x) / 2,
            (_control1.y + _control2.y) / 2 - 25),
        20,
        _paint);
  }

  // 更新贝塞尔控制点
  void refreshControl() {}

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}

class BesselWidget extends StatefulWidget {
  @override
  _BesselWidgetState createState() => _BesselWidgetState();
}

class _BesselWidgetState extends State<BesselWidget> {
  BesselPainter painter;
  Timer timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CustomPaint(
      painter: BesselPainter(width: size.width),
      size: size,
    );
  }

  void startTimer() {
    timer = Timer.periodic(Duration(milliseconds: 1000 ~/ 60), (Timer t) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    if (timer != null) timer.cancel();
  }
}
