import 'package:wan_android/common/network/BaseApi.dart';

//首页banner接口
banner() => BaseApi.create(server: "/banner/json");

//首页置顶接口
articleTop() => BaseApi.create(server: "/article/top/json");

//首页文章列表
arricleList(int page) => BaseApi.create(server: "/article/list/$page/json");
