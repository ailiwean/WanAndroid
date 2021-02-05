import 'dart:io';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:wan_android/res/AppColors.dart';
import 'package:wan_android/res/Style.dart';

//通用webview
class WebViewWrap extends StatefulWidget {
  final url;
  final arguments;

  WebViewWrap({this.url, this.arguments});

  @override
  _WebViewWrapState createState() =>
      _WebViewWrapState(url: this.url, title: arguments["title"]);
}

class _WebViewWrapState extends State<WebViewWrap> {
  InAppWebViewController webView;
  ContextMenu contextMenu;
  ColorsAnimation animation;
  String url;
  String title;
  double progress = 0;

  _WebViewWrapState({this.url, this.title});

  @override
  void initState() {
    super.initState();
    contextMenu = ContextMenu(
        menuItems: [
          ContextMenuItem(
              androidId: 1,
              iosId: "1",
              title: "Special",
              action: () async {
                print("Menu item Special clicked!");
              })
        ],
        onCreateContextMenu: (hitTestResult) async {
          print("onCreateContextMenu");
          print(hitTestResult.extra);
          print(await webView?.getSelectedText());
        },
        onHideContextMenu: () {
          print("onHideContextMenu");
        },
        onContextMenuActionItemClicked: (contextMenuItemClicked) {
          var id = (Platform.isAndroid)
              ? contextMenuItemClicked.androidId
              : contextMenuItemClicked.iosId;
          print("onContextMenuActionItemClicked: " +
              id.toString() +
              " " +
              contextMenuItemClicked.title);
        });
    animation = ColorsAnimation(progress: progress);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title,
            overflow: TextOverflow.fade, style: TextStyle(fontSize: 16)),
        actions: [
          Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: ElevatedButton(
                style: Style.transButtonStyle,
                child: Icon(
                  Icons.more_vert,
                  color: AppColors.comIconColor,
                ),
                onPressed: () {},
              )),
        ],
      ),
      body: Stack(
        children: [
          FractionallySizedBox(
            widthFactor: 1,
            heightFactor: 1,
            child: _getWebView(),
          ),
          _getIndicatorBar()
        ],
      ),
    );
  }

  InAppWebView _getWebView() {
    return InAppWebView(
      initialUrl: url,
      // contextMenu: contextMenu,
      initialHeaders: {},
      initialOptions:
          InAppWebViewGroupOptions(crossPlatform: InAppWebViewOptions()),
      onWebViewCreated: (InAppWebViewController controller) {
        webView = controller;
      },
      onTitleChanged: (controller, title) {
        setState(() {
          this.title = title;
        });
      },
      shouldOverrideUrlLoading: (controller, shouldOverrideUrlLoadingRequest) {
        return null;
      },
      onLoadStart: (controller, url) {
        setState(() {
          this.url = url ?? '';
        });
      },
      onLoadStop: (controller, url) async {
        setState(() {
          this.url = url ?? '';
        });
      },
      onProgressChanged: (controller, progress) {
        setState(() {
          this.progress = progress / 100;
          animation.updateValues(this.progress);
        });
      },
    );
  }

  Widget _getIndicatorBar() {
    return progress < 1.0
        ? LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.white70,
            valueColor: animation)
        : Container();
  }

}

class ColorsAnimation extends Animation<Color> {
  double progress;

  ColorsAnimation({this.progress});

  updateValues(double progress) {
    this.progress = progress;
  }

  @override
  void addListener(listener) {}

  @override
  void addStatusListener(listener) {}

  @override
  void removeListener(listener) {}

  @override
  void removeStatusListener(listener) {}

  @override
  AnimationStatus get status {
    return progress == 1 ? AnimationStatus.completed : AnimationStatus.forward;
  }

  @override
  Color get value =>
      Color(((Colors.white24.value - Colors.white60.value) * progress +
              Colors.white60.value)
          .toInt());
}
