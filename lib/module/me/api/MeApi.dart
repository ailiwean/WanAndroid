import 'package:wan_android/common/network/BaseApi.dart';

/// @Description: 个人信息有关接口
/// @Author: SWY
/// @Date: 2021/2/10 20:43
login({String userName, String password}) => BaseApi.create(
    server: "/user/login", body: {"username": userName, "password": password});
