import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:wan_android/common/route/RouteManager.dart';
import 'package:wan_android/common/utils/AppScreen.dart';
import 'package:wan_android/common/widget/BesselWidget.dart';
import 'package:wan_android/generated/assets.dart';
import 'package:wan_android/res/AppColors.dart';
import 'package:wan_android/res/Style.dart';

/// @Description: 登陆页
/// @Author: SWY
/// @Date: 2021/2/11 15:39
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        //背景层
        Container(
          color: AppColors.navigatorItemSelectColor,
        ),
        //内容区域
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              //关闭按钮
              Padding(
                padding: EdgeInsets.only(
                    left: setSuitWidthPx(40), top: setSuitHeightPx(40)),
                child: ElevatedButton(
                  style: Style.transButtonStyle,
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    RouteManager.finish(context);
                  },
                ),
              ),
              Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    Assets.graphicsIcLauncher,
                    width: setSuitWidthPx(200),
                    height: setSuitHeightPx(200),
                    color: Colors.white,
                  )),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "欢迎使用",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: setSuitTextPx(35),
                      fontWeight: FontWeight.w300,
                      decoration: TextDecoration.none),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "本APP由Aiwean独立开发",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: setSuitTextPx(25),
                      fontWeight: FontWeight.w300,
                      decoration: TextDecoration.none),
                ),
              ),
              //动画
              Container(height: 100, child: BesselWidget()),

              Expanded(
                child: Material(
                  color: Color.fromARGB(150, 255, 251, 240),
                  child: PageView(
                    children: [
                      TextField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.face,
                                color: AppColors.navigatorItemSelectColor,
                              ),
                              fillColor: AppColors.navigatorItemSelectColor),
                          keyboardType: TextInputType.text),
                      // TextField()
                    ],
                    controller: PageController(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
