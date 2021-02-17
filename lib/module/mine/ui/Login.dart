import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wan_android/common/network/Network.dart';
import 'package:wan_android/common/route/RouteManager.dart';
import 'package:wan_android/common/utils/AppScreen.dart';
import 'package:wan_android/common/utils/AppToastUtils.dart';
import 'package:wan_android/common/widget/BesselWidget.dart';
import 'package:wan_android/generated/assets.dart';
import 'package:wan_android/module/mine/api/MineApi.dart';
import 'package:wan_android/module/mine/bean/login_res.dart';
import 'package:wan_android/res/AppColors.dart';
import 'package:wan_android/res/Duration.dart';
import 'package:wan_android/res/Style.dart';

/// @Description: 登陆页
/// @Author: SWY
/// @Date: 2021/2/11 15:39
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with WidgetsBindingObserver {
  PageController pageController;

  var userName = TextEditingController();

  //登录
  var logPassword = TextEditingController();

  //注册
  var regEmail = TextEditingController();
  var regPassword = TextEditingController();
  var regPasswrod2 = TextEditingController();

  var focusList = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (MediaQuery.of(context).viewInsets.bottom == 0) {
        //关闭键盘
      } else {
        //显示键盘
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.navigatorItemSelectColor,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: ListView(
          controller: PageController(),
          children: <Widget>[
            //关闭按钮
            Container(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(
                    left: setSuitWidthPx(40), top: setSuitHeightPx(60)),
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
                "本APP由aiWean独立开发",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: setSuitTextPx(25),
                    fontWeight: FontWeight.w300,
                    decoration: TextDecoration.none),
              ),
            ),
            Container(height: setSuitHeightPx(100), child: BesselWidget()),
            Container(
              height: setSuitHeightPx(1000),
              child: Material(
                color: Color.fromARGB(150, 255, 251, 240),
                child: PageView(
                  children: [getSignInWidgets(), getSignUpWidgets()],
                  controller: pageController,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  //登录
  Widget getSignInWidgets() {
    return Column(
      children: <Widget>[
        Style.heightPlaceHolder(50),
        ElevatedButton(
          style: Style.transButtonStyle,
          child: Text(
            "去注册 >",
            style: TextStyle(color: AppColors.navigatorItemSelectColor),
          ),
          onPressed: () {
            pageController.animateToPage(1,
                duration: pageSwitchDuration, curve: Curves.ease);
          },
        ),

        Style.heightPlaceHolder(50),
        //账号名
        Container(
          width: setSuitWidthPx(500),
          child: TextField(
            focusNode: focusList[0],
            textInputAction: TextInputAction.next,
            onSubmitted: (t) {
              FocusScope.of(context).requestFocus(focusList[1]);
            },
            keyboardType: TextInputType.name,
            controller: userName,
            decoration: InputDecoration(
                icon: Icon(
                  Icons.supervised_user_circle,
                  color: AppColors.navigatorItemSelectColor,
                ),
                labelText: "请输入用户名",
                labelStyle: TextStyle(
                    color: AppColors.navigatorItemSelectColor,
                    fontWeight: FontWeight.w300),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.clear,
                  ),
                  onPressed: () {
                    userName.clear();
                  },
                )),
            maxLines: 1,
            cursorColor: AppColors.navigatorItemSelectColor,
          ),
        ),
        //密码
        Container(
          width: setSuitWidthPx(500),
          child: TextField(
            focusNode: focusList[1],
            textInputAction: TextInputAction.go,
            onSubmitted: (t) {
              clickLogin();
            },
            obscureText: true,
            controller: logPassword,
            decoration: InputDecoration(
                icon: Icon(
                  Icons.vpn_key,
                  color: AppColors.navigatorItemSelectColor,
                ),
                labelText: "请输入密码",
                labelStyle: TextStyle(
                    color: AppColors.navigatorItemSelectColor,
                    fontWeight: FontWeight.w300),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.clear,
                  ),
                  onPressed: () {
                    logPassword.clear();
                  },
                )),
            maxLines: 1,
            cursorColor: AppColors.navigatorItemSelectColor,
          ),
        ),
        Style.heightPlaceHolder(50),
        Padding(
          padding: EdgeInsets.only(
              left: setSuitWidthPx(50), right: setSuitWidthPx(50)),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(99)),
            child: Container(
              color: AppColors.navigatorItemSelectColor,
              width: double.infinity,
              alignment: Alignment.center,
              child: ElevatedButton(
                style: Style.transButtonStyle,
                onPressed: () {
                  clickLogin();
                },
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(
                      top: setSuitHeightPx(20), bottom: setSuitHeightPx(20)),
                  child: Text(
                    "登录",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  //注册
  Widget getSignUpWidgets() {
    return Column(
      children: <Widget>[
        Style.heightPlaceHolder(50),
        //去登录
        ElevatedButton(
          style: Style.transButtonStyle,
          onPressed: () {
            pageController.animateToPage(0,
                duration: pageSwitchDuration, curve: Curves.ease);
          },
          child: Text(
            "< 去登录",
            style: TextStyle(color: AppColors.navigatorItemSelectColor),
          ),
        ),
        Style.heightPlaceHolder(50),
        //账号名
        Container(
          width: setSuitWidthPx(500),
          child: TextField(
            focusNode: focusList[2],
            textInputAction: TextInputAction.next,
            onSubmitted: (t) {
              FocusScope.of(context).requestFocus(focusList[3]);
            },
            keyboardType: TextInputType.name,
            controller: userName,
            decoration: InputDecoration(
                icon: Icon(
                  Icons.supervised_user_circle,
                  color: AppColors.navigatorItemSelectColor,
                ),
                labelText: "请输入用户名",
                labelStyle: TextStyle(
                    color: AppColors.navigatorItemSelectColor,
                    fontWeight: FontWeight.w300),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.clear,
                  ),
                  onPressed: () {
                    userName.clear();
                  },
                )),
            maxLines: 1,
            cursorColor: AppColors.navigatorItemSelectColor,
          ),
        ),
        // 邮箱
        Container(
          width: setSuitWidthPx(500),
          child: TextField(
            focusNode: focusList[3],
            textInputAction: TextInputAction.next,
            onSubmitted: (t) {
              FocusScope.of(context).requestFocus(focusList[4]);
            },
            keyboardType: TextInputType.emailAddress,
            controller: regEmail,
            decoration: InputDecoration(
                icon: Icon(
                  Icons.email,
                  color: AppColors.navigatorItemSelectColor,
                ),
                labelText: "请输入邮箱",
                labelStyle: TextStyle(
                    color: AppColors.navigatorItemSelectColor,
                    fontWeight: FontWeight.w300),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.clear,
                  ),
                  onPressed: () {
                    regEmail.clear();
                  },
                )),
            maxLines: 1,
            cursorColor: AppColors.navigatorItemSelectColor,
          ),
        ),
        //密码
        Container(
          width: setSuitWidthPx(500),
          child: TextField(
            focusNode: focusList[4],
            textInputAction: TextInputAction.next,
            onSubmitted: (t) {
              FocusScope.of(context).requestFocus(focusList[5]);
            },
            obscureText: true,
            controller: regPassword,
            decoration: InputDecoration(
                icon: Icon(
                  Icons.vpn_key,
                  color: AppColors.navigatorItemSelectColor,
                ),
                labelText: "请输入密码",
                labelStyle: TextStyle(
                    color: AppColors.navigatorItemSelectColor,
                    fontWeight: FontWeight.w300),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.clear,
                  ),
                  onPressed: () {
                    regPassword.clear();
                  },
                )),
            maxLines: 1,
            cursorColor: AppColors.navigatorItemSelectColor,
          ),
        ),
        //确认密码
        Container(
          width: setSuitWidthPx(500),
          child: TextField(
            focusNode: focusList[5],
            textInputAction: TextInputAction.next,
            onSubmitted: (t) {
              clickSignUp();
            },
            obscureText: true,
            controller: regPasswrod2,
            decoration: InputDecoration(
                icon: Icon(
                  Icons.vpn_key,
                  color: AppColors.navigatorItemSelectColor,
                ),
                labelText: "请确认密码",
                labelStyle: TextStyle(
                    color: AppColors.navigatorItemSelectColor,
                    fontWeight: FontWeight.w300),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.clear,
                  ),
                  onPressed: () {
                    regPasswrod2.clear();
                  },
                )),
            maxLines: 1,
            cursorColor: AppColors.navigatorItemSelectColor,
          ),
        ),

        Style.heightPlaceHolder(50),

        Padding(
          padding: EdgeInsets.only(
              left: setSuitWidthPx(50), right: setSuitWidthPx(50)),
          child: ClipRRect(
            child: Container(
              color: AppColors.navigatorItemSelectColor,
              width: double.infinity,
              alignment: Alignment.center,
              child: ElevatedButton(
                style: Style.transButtonStyle,
                onPressed: () {
                  clickSignUp();
                },
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(
                      top: setSuitHeightPx(20), bottom: setSuitHeightPx(20)),
                  child: Text(
                    "注册",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            borderRadius: BorderRadius.all(Radius.circular(99)),
          ),
        ),
      ],
    );
  }

  //点击登陆
  void clickLogin() {
    if (userName.text.isEmpty) {
      AppToastUtils.showToast("用户名不能为空！");
      return;
    }
    if (logPassword.text.isEmpty) {
      AppToastUtils.showToast("密码不能为空！");
      return;
    }
    Network.execute(login(userName: userName.text, password: logPassword.text))
        .then((value) {
      RouteManager.finish(context, result: LoginRes.fromJson(value));
    });
  }

  //点击注册
  void clickSignUp() {
    if (userName.text.isEmpty) {
      AppToastUtils.showToast("用户名不能为空！");
      return;
    }
    if (regEmail.text.isEmpty) {
      AppToastUtils.showToast("邮箱不能为空！");
      return;
    }
    if (regPassword.text.isEmpty) {
      AppToastUtils.showToast("密码不能为空！");
      return;
    }

    if (regPassword.text != regPasswrod2.text) {
      AppToastUtils.showToast("两次输入不一致！");
      return;
    }

    Network.execute(signUp(userName: userName.text, password: regPassword.text))
        .then((value) {
      //注册成功重用密码登陆
      logPassword.text = regPassword.text;
      clickLogin();
    });
  }
}
