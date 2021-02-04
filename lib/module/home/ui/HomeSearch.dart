import 'package:flutter/material.dart';

class HomeSearch extends StatefulWidget {
  @override
  _HomeSearchState createState() => _HomeSearchState();
}

class _HomeSearchState extends State<HomeSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("搜索"),
      ),
    );
  }
}
