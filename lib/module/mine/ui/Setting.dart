import 'package:flutter/material.dart';
import 'package:wan_android/common/route/RouteManager.dart';
import 'package:wan_android/common/utils/AppSpUtils.dart';

/// @Description: 系统设置
/// @Author: SWY
/// @Date: 2021/2/13 16:12
class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("设置"),
      ),
      body: Column(
        children: <Widget>[
          ElevatedButton(
              onPressed: () {
                AppSpUtils.setValues(AppSpUtils.loginJson, "");
                RouteManager.finish(context, result: true);
              },
              child: Expanded(
                child: Text("退出登录"),
              ))
        ],
      ),
    );
  }
}
