import 'package:flutter/material.dart';

/// @Description: ListView代理，需提供一个BaseListViewAdapter
/// @Author: SWY
/// @Date: 2021/2/6 14:21
class ListViewDelegate {
  BaseListViewAdapter adapter;
  ScrollController scrollController = ScrollController();

  ListViewDelegate({@required this.adapter, this.scrollController});

  ScrollController getScrollController() {
    return scrollController;
  }

  BaseListViewAdapter<T> getAdapter<T>() {
    return this.adapter;
  }

  ListView getListView() {
    return ListView.builder(
      itemCount: adapter.realItemCount(),
      itemBuilder: (context, index) {
        //头部
        if (adapter.hasHead() && index < adapter.headWidgets.length)
          return adapter.headWidgets[index];

        //尾部
        int offset = adapter.realItemCount() - adapter.bottomWidgets.length;
        if (adapter.hasBottom() && index >= offset)
          return adapter.bottomWidgets[index - offset];

        //适配器Widget
        int adapterIndex = index - adapter.headWidgets.length;
        return adapter.covert(adapterIndex);
      },
      controller: scrollController,
    );
  }
}

abstract class BaseListViewAdapter<T> {
  final List<T> dataList = [];
  List<Widget> _headWidgets = [];
  List<Widget> _bottomWidgets = [];
  State _state;

  /// 由[RefreshListView]内 [State]调用，存储一个State用于实时刷新
  bindStateWidget(State state) {
    this._state = state;
  }

  /// ListView内部调用，Adapter将数据转换成Widget
  Widget covert(int index) {
    return covertWidget(index, dataList[index]);
  }

  /// 子类实现Widget生成
  Widget covertWidget(int index, T t);

  /// 获取ListView Item数量不包含头和尾
  int getItemCount() {
    return dataList.length;
  }

  /// 添加一个ListView头Widget
  void addHeadWidget(Widget widget, {needUpdate = true}) {
    _headWidgets.add(widget);
    if (needUpdate) _update();
  }

  ///  添加一个ListView尾Widget
  void addBottomWidget(Widget widget, {needUpdate = true}) {
    _bottomWidgets.add(widget);
    if (needUpdate) _update();
  }

  void removeAllHeadWidget({needUpdate = true}) {
    _headWidgets.clear();
    if (needUpdate) _update();
  }

  void removeHeadWidget(Widget widget, {needUpdate = true}) {
    _headWidgets.remove(widget);
    if (needUpdate) _update();
  }

  void removeAllBottomWidget({needUpdate = true}) {
    _bottomWidgets.clear();
    if (needUpdate) _update();
  }

  void removeBottomWidget(Widget widget, {needUpdate = true}) {
    _bottomWidgets.remove(widget);
    _update();
  }

  List<Widget> get headWidgets => _headWidgets;

  List<Widget> get bottomWidgets => _bottomWidgets;

  /// 添加数据
  void addData(Iterable<T> data, {insert = -1, needUpdate = true}) {
    if (insert != -1)
      dataList.insertAll(insert, data);
    else
      dataList.addAll(data);
    if (needUpdate) _update();
  }

  void removeData(T data, {needUpdate = true}) {
    dataList.remove(data);
    if (needUpdate) _update();
  }

  void removeItem(int index, {needUpdate = true}) {
    dataList.remove(index);
    if (needUpdate) _update();
  }

  void setNewData(Iterable<T> data, {needUpdate = true}) {
    dataList.clear();
    dataList.addAll(data);
    if (needUpdate) _update();
  }

  void _update() {
    if (_state != null && _state.mounted) {
      _state.setState(() {});
    }
  }

  int realItemCount() {
    return getItemCount() + getExtraNum();
  }

  bool hasHead() {
    return _headWidgets.length != 0;
  }

  bool hasBottom() {
    return _bottomWidgets.length != 0;
  }

  int getExtraNum() {
    return _headWidgets.length + _bottomWidgets.length;
  }
}
