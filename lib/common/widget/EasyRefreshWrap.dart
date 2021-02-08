import 'package:flutter/cupertino.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:wan_android/common/widget/ListViewDelegate.dart';

/// 下拉刷新上拉加载内部维护pagesize
/// @Author: SWY
/// @Date: 2021/2/4 18:56
class EasyRefreshWrap extends EasyRefresh {
  final RequestFun requestFun;
  final DataControl dataControl;

  EasyRefreshWrap({
    @required ListViewDelegate listViewDelegate,
    @required this.requestFun,
    this.dataControl,
    Header header,
    Footer footer,
  }) : super(
            child: listViewDelegate.getListView(),
            onRefresh: dataControl._getOnRefreshback(),
            onLoad: dataControl._getOnLoadback(),
            enableControlFinishLoad: true,
            enableControlFinishRefresh: true,
            controller: dataControl._getController(),
            header: header,
            footer: footer,
            firstRefresh: true) {
    dataControl.bindView(listViewDelegate, requestFun);
  }
}

//内部维护下拉刷新上拉加载
class DataControl {
  //真正的下标从0开始
  int currentPage = -1;
  int pageNum = 20;

  //是否加载完成， 加载完整标志是上次返回数据长度小于pageNum
  bool isloadComplete = false;

  //当前请求是否为下拉刷新，为避免出错导致currentPage数据丢失单独用变量控制
  bool isRefreshState = false;

  ListViewDelegate listViewDelegate;
  dynamic requestFun;
  dynamic resultReceive;

  EasyRefreshController _controller = EasyRefreshController();

  bindView(ListViewDelegate listViewDelegate, dynamic requestFun) {
    this.listViewDelegate = listViewDelegate;
    this.requestFun = requestFun;
    this.resultReceive = (List<dynamic> dataList) {
      if (dataList == null) return;

      if (isRefreshState) {
        // 下拉刷新成功
        currentPage = 0;
        isloadComplete = false;
        listViewDelegate.adapter.setNewData(dataList);
        _controller.finishRefresh(success: true);
        _controller.resetLoadState();
        // _controller.resetRefreshState();
        return;
      }

      currentPage++;
      listViewDelegate.adapter.addData(dataList);

      //上拉加载成功, 且无更多数据
      if (dataList.length == 0) {
        isloadComplete = true;
        _controller.finishLoad(success: true, noMore: true);
      } else {
        _controller.finishLoad(success: true);
      }
    };
  }

  OnRefreshCallback _getOnRefreshback() {
    return () async {
      isRefreshState = true;
      //请求第0页数据
      resultReceive(await requestFun(0));
      return;
    };
  }

  OnLoadCallback _getOnLoadback() {
    return () async {
      isRefreshState = false;
      //已经加载完成直接回调
      if (isloadComplete) {
        _controller.finishLoad(success: true, noMore: true);
        return;
      }
      //请求下页数据
      resultReceive(await requestFun(currentPage + 1));
      return;
    };
  }

  EasyRefreshController _getController() {
    return _controller;
  }
}

//由内部实现，外部获取到数据后调用
typedef ResultReceive = Function(List<dynamic> dataList);

//由外部实现内部调用， 外部根据page获取到对应的数据
typedef RequestFun = Future<List<dynamic>> Function(int page);
