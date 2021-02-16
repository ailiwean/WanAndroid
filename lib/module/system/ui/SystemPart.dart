import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:wan_android/common/network/Network.dart';
import 'package:wan_android/module/system/api/SystemApi.dart';
import 'package:wan_android/module/system/bean/res/system_res.dart';

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
            return Text(values[index].name);
          },
          itemCount: values != null ? values.length : 0,
        );
      }),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
