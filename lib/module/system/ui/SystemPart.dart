import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wan_android/common/network/Network.dart';
import 'package:wan_android/common/utils/AppScreen.dart';
import 'package:wan_android/common/utils/AppToastUtils.dart';
import 'package:wan_android/module/system/api/SystemApi.dart';
import 'package:wan_android/module/system/bean/res/system_res.dart';
import 'package:wan_android/res/AppColors.dart';
import 'package:wan_android/res/Style.dart';

/// @Description:  体系
/// @Author: SWY
/// @Date: 2021/2/16 23:16
class SystemPart extends StatefulWidget {
  @override
  _SystemPartState createState() => _SystemPartState();
}

class _SystemPartState extends State<SystemPart>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureProvider<List<SystemRes>>(
      create: (context) async {
        var result = await Network.executeList(systemList());
        List<SystemRes> dataList = [];
        dataList.addAll(result.map((e) => SystemRes.fromJson(e)));
        return dataList;
      },
      child: Consumer<List<SystemRes>>(builder: (_, values, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return _getItemDetails(values[index]);
          },
          itemCount: values != null ? values.length : 0,
        );
      }),
    );
  }

  Widget _getItemDetails(SystemRes res) {
    List<Widget> children = [];
    children.addAll(res.children.map((e) => ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: ElevatedButton(
            style: Style.transButtonStyle,
            child: Container(
              child: Padding(
                padding: EdgeInsets.only(
                    left: setSuitWidthPx(30),
                    top: setSuitHeightPx(10),
                    right: setSuitWidthPx(30),
                    bottom: setSuitHeightPx(10)),
                child: Text(
                  e.name,
                  style: TextStyle(
                      fontSize: setSuitTextPx(25),
                      color: AppColors.textContentColor),
                ),
              ),
              color: AppColors.textContentGrayBg,
            ),
            onPressed: () {
              AppToastUtils.showToast(e.name);
            },
          ),
        )));

    return Padding(
      padding: EdgeInsets.only(
          top: setSuitHeightPx(10),
          left: setSuitWidthPx(20),
          right: setSuitWidthPx(20),
          bottom: setSuitHeightPx(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            res.name,
            style: TextStyle(
                color: AppColors.textTitleColor,
                fontWeight: FontWeight.w300,
                fontSize: setSuitTextPx(30)),
          ),
          Style.heightPlaceHolder(10),
          Wrap(
            direction: Axis.horizontal,
            alignment: WrapAlignment.start,
            // 水平排列则是item之间水平间距
            spacing: setSuitWidthPx(20),
            //水平排列则是item之间垂直间距
            runSpacing: setSuitHeightPx(10),
            crossAxisAlignment: WrapCrossAlignment.start,
            children: children,
          )
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
