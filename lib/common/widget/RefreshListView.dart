import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:wan_android/common/widget/EasyRefreshWrap.dart';
import 'package:wan_android/common/widget/ListViewDelegate.dart';

/// @Description: Refresh与ListView的最终封装
/// @Author: SWY
/// @Date: 2021/2/7 17:33
class RefreshListView extends StatefulWidget {
  final RequestFun requestFun;
  final BaseListViewAdapter adapter;

  ///需自定义ListView时传入
  final ListViewDelegate delegate;

  ///需自定义Refresh时传入, 自定义Refresh时传入的[ListViewDelegate]需与上述相同
  final EasyRefreshGen refreshGen;

  RefreshListView({
    Key key,
    @required this.adapter,
    @required this.requestFun,
    this.refreshGen,
    this.delegate,
  }) : super(key: key);

  @override
  _RefreshListViewState createState() => _RefreshListViewState(
      adapter: adapter,
      requestFun: requestFun,
      refreshGen: refreshGen,
      delegate: delegate);
}

class _RefreshListViewState extends State<RefreshListView>
    with WidgetsBindingObserver {
  RequestFun requestFun;
  BaseListViewAdapter adapter;
  ListViewDelegate delegate;
  EasyRefreshGen refreshGen;

  ///内部维护分页信息
  DataControl dataControl = DataControl();

  _RefreshListViewState({
    this.adapter,
    this.requestFun,
    this.refreshGen,
    this.delegate,
  }) {
    if (delegate == null) delegate = ListViewDelegate(adapter: adapter);
  }

  EasyRefreshWrap getEasyRefresh() {
    if (refreshGen != null)
      return refreshGen();
    else
      return EasyRefreshWrap(
        listViewDelegate: delegate,
        dataControl: dataControl,
        requestFun: this.requestFun,
        header: MaterialHeader(
            completeDuration: Duration(milliseconds: 500),
            enableHapticFeedback: true),
        footer: MaterialFooter(),
      );
  }

  @override
  void initState() {
    super.initState();
    delegate.adapter.bindStateWidget(this);
  }

  @override
  Widget build(BuildContext context) {
    return getEasyRefresh();
  }
}

typedef EasyRefreshGen = EasyRefreshWrap Function();
