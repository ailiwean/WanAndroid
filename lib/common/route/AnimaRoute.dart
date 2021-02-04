import 'package:flutter/material.dart';

class AnimaPageRoute extends PageRouteBuilder {
  final WidgetBuilder builder;

  AnimaPageRoute({this.builder})
      : super(
            transitionDuration: Duration(milliseconds: 500),
            pageBuilder: (
              BuildContext context,
              Animation<double> animation1,
              Animation<double> animation2,
            ) {
              return builder(context);
            },
            transitionsBuilder: (
              BuildContext context,
              Animation<double> animation1,
              Animation<double> animation2,
              Widget child,
            ) {
//      //逐渐消失的动画效果
//      return FadeTransition(
//        opacity: Tween(begin: 0.0,end: 1.0) //设置不透明度
//        .animate(CurvedAnimation(
//            parent: animation1,
//            curve: Curves.fastOutSlowIn)
//        ),
//      child: child,
//      );

//    //缩放的动画效果
//      return ScaleTransition(
//        scale: Tween(begin: 0.0, end: 1.0).animate(
//          CurvedAnimation(
//            parent: animation1,
//            curve: Curves.fastOutSlowIn
//          )
//        ),
//        child: child,
//      );

//    //旋转+缩放动画效果
//      return RotationTransition(
//        turns: Tween(begin: 0.0, end:1.0).animate(
//          CurvedAnimation(
//            parent: animation1,
//            curve: Curves.fastOutSlowIn,
//          )
//        ),
//        child: ScaleTransition(
//          scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
//            parent: animation1,
//            curve: Curves.fastOutSlowIn,
//          )),
//          child: child,
//        ),
//      );

              //左右滑动动画效果
              return SlideTransition(
                position:
                    Tween<Offset>(end: Offset(0, 0.0), begin: Offset(1.0, 0.0))
                        .animate(CurvedAnimation(
                            parent: animation1, curve: Curves.ease)),
                child: child,
              );
            });
}
