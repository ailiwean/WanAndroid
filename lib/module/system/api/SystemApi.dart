import 'package:wan_android/common/network/BaseApi.dart';

/// @Description: 体系接口
/// @Author: SWY
/// @Date: 2021/2/17 0:13

//体系接口
systemList() => BaseApi.create(server: "/tree/json");

//导航接口
navigationList() => BaseApi.create(server: "/navi/json");
