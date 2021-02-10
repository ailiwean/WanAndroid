import 'package:wan_android/common/network/BaseApi.dart';

//问答接口
qaList(int page) => BaseApi.create(server: "/wenda/list/$page/json");
