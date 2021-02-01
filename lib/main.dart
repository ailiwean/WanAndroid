import 'package:flutter/material.dart';
import 'package:wan_android/SplashPage.dart';
import 'package:wan_android/common/route/RouteManager.dart';
import 'common/network/Network.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    initApp(context);
    return MaterialApp(
      initialRoute: RouteManager.getRouteName(SplashPage),
      onGenerateRoute: RouteManager.generateRoute,
    );
  }

  initApp(BuildContext context) {
    Network.build()
        .setBaseUrl("https://wanandroid.com")
        .setBaseHeaders({}).build();
  }
}
