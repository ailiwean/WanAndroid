import 'package:flutter/material.dart';

/// @Description: 通用List，需提供一个BaseListViewAdapter
/// @Author: SWY
/// @Date: 2021/2/6 14:21
class BaseListView extends StatefulWidget {
  final BaseListViewAdapter adapter;

  BaseListView({this.adapter});

  @override
  _BaseListViewState createState() {
    var state = _BaseListViewState(baseListViewAdapter: adapter);
    adapter.bindStateWidget(state);
    return state;
  }
}

abstract class BaseListViewAdapter<T> {
  final List<T> dataList = [];
  List<Widget> _headWidgets = [];
  List<Widget> _bottomWidgets = [];
  _BaseListViewState _holder;
  List<Function> _buildBeforeback = [];

  bindStateWidget(_BaseListViewState state) {
    this._holder = state;
  }

  Widget _covert(int index) {
    return covertWidget(index, dataList[index]);
  }

  Widget covertWidget(int index, T t);

  int getItemCount() {
    return dataList.length;
  }

  void addHeadWidget(Widget widget, {needUpdate = true}) {
    _headWidgets.add(widget);
    if (needUpdate) _update();
  }

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

  //注册一个WidgetState build前的回调，该回调表示已经准备完毕可以进行UI操作
  void registerBuildBeforeback(Function function) {
    _buildBeforeback.add(function);
  }

  void _update() {
    if (_holder != null) {
      _holder.update();
    }
  }

  int _realItemCount() {
    return getItemCount() + _getExtraNum();
  }

  bool _hasHead() {
    return _headWidgets.length != 0;
  }

  bool _hasBottom() {
    return _bottomWidgets.length != 0;
  }

  int _getExtraNum() {
    return _headWidgets.length + _bottomWidgets.length;
  }
}

class _BaseListViewState extends State<BaseListView> {
  BaseListViewAdapter baseListViewAdapter;
  ScrollController scrollController;

  _BaseListViewState({this.baseListViewAdapter});

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  void update() {
    if (this.mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    //回调注册的监听
    baseListViewAdapter._buildBeforeback.forEach((element) {
      element();
    });
    return ListView.builder(
      shrinkWrap: true,
      itemCount: baseListViewAdapter._realItemCount(),
      itemBuilder: (context, index) {
        //头部
        if (baseListViewAdapter._hasHead() &&
            index < baseListViewAdapter._headWidgets.length)
          return baseListViewAdapter._headWidgets[index];

        //尾部
        int offset = baseListViewAdapter._realItemCount() -
            baseListViewAdapter._bottomWidgets.length;
        if (baseListViewAdapter._hasBottom() && index >= offset)
          return baseListViewAdapter._bottomWidgets[index - offset];

        //适配器Widget
        int adapterIndex = index - baseListViewAdapter._headWidgets.length;
        return baseListViewAdapter._covert(adapterIndex);
      },
      controller: scrollController,
    );
  }
}
