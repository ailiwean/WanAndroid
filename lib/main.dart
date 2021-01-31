import 'package:flutter/material.dart';
import 'package:wan_android/SplashPage.dart';
import 'package:wan_android/route/RouteManager.dart';

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
  }
}
