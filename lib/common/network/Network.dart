import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:wan_android/common/network/BaseApi.dart';
import 'package:wan_android/common/network/BaseResponse.dart';
import 'package:wan_android/common/utils/ToastUtils.dart';

/// 网络请求
/// @Author: SWY
/// @Date: 2021/2/3 19:40
class Network {
  final String baseUrl;
  final Map baseHeaders;
  final Dio dio = Dio();
  final List<Interceptor> listInterceptor;

  static Network _network;

  Network._({this.baseUrl, this.baseHeaders, this.listInterceptor}) {
    dio.interceptors.addAll(listInterceptor);
  }

  static Build build() => Build._();

  static Future<dynamic> execute(BaseApi baseApi) {
    if (baseApi.type != null)
      return baseApi.type == Type.GET
          ? _get<dynamic>(baseApi)
          : _post<dynamic>(baseApi);
    return baseApi.body == null
        ? _get<dynamic>(baseApi)
        : _post<dynamic>(baseApi);
  }

  static Future<List<dynamic>> executeList(BaseApi baseApi) {
    if (baseApi.type != null)
      return baseApi.type == Type.GET
          ? _get<List<dynamic>>(baseApi)
          : _post<List<dynamic>>(baseApi);
    return baseApi.body == null
        ? _get<List<dynamic>>(baseApi)
        : _post<List<dynamic>>(baseApi);
  }

  static Future<T> _get<T>(BaseApi baseApi) {
    return _attatchCatchError<T>(Network._network.dio.get(
        _getUrl(baseApi) + _getHttpParams(baseApi),
        options: Options(headers: _getMergeHeaderMap(baseApi))));
  }

  static Future<T> _post<T>(BaseApi baseApi) {
    return _attatchCatchError<T>(Network._network.dio.post(
        _getUrl(baseApi) + _getHttpParams(baseApi),
        data: baseApi.body,
        options: Options(headers: _getMergeHeaderMap(baseApi))));
  }

  static String _getUrl(BaseApi baseApi) {
    return baseApi.url == null
        ? Network._network.baseUrl + baseApi.server.toString()
        : baseApi.url;
  }

  static String _getHttpParams(BaseApi baseApi) {
    if (baseApi.params != null && baseApi.params.isNotEmpty) {
      var concatParams = "?";
      baseApi.params.forEach((key, value) {
        concatParams += "$key=$value&";
      });
      concatParams.substring(0, concatParams.length - 1);
      return concatParams;
    }
    return "";
  }

  static Map _getMergeHeaderMap(BaseApi baseApi) {
    final headerMap = {};
    if (Network._network.baseHeaders != null &&
        Network._network.baseHeaders.isNotEmpty)
      headerMap.addAll(Network._network.baseHeaders);
    if (baseApi.headers != null && baseApi.headers.isNotEmpty)
      headerMap.addAll(baseApi.headers);
  }

  ///统一错误信息打印
  static Future<T> _attatchCatchError<T>(Future<Response> future) {
    return future.catchError((dioError, stackTrace) {
      _errorInfoOutput(dioError);
    }, test: (Object o) {
      return true;
    }).then((value) {
      _succesInfoOutput(value);
      var response = BaseResponse.fromJson(value.data);
      if (response.errorCode == 0) return value.data["data"];
      ToastUtils.showToast(response.errorMsg);
      throw response.errorMsg;
    });
  }

  static String _errorInfoOutput(DioError dioError) {
    print("-----------------接口调用流程出错-----------------");
    print("接口地址：" + dioError.request.baseUrl + dioError.request.path);
    print("出错堆栈：" + dioError.toString());
  }

  static String _succesInfoOutput(Response response) {
    print("-----------------接口调用成功-----------------");
    print("接口地址：" + response.request.baseUrl + response.request.path);
    print("json数据：" + json.encode(response.data));
  }
}

class Build {
  Build._();

  var _baseUrl;
  var _baseHeaders;
  var _listInterceptor = <Interceptor>[];

  Build setBaseUrl(String baseUrl) {
    this._baseUrl = baseUrl;
    return this;
  }

  Build setBaseHeaders(Map baseHeaders) {
    this._baseHeaders = baseHeaders;
    return this;
  }

  Build addInterceptor(Interceptor interceptor) {
    _listInterceptor.add(interceptor);
    return this;
  }

  void build() {
    Network._network = new Network._(
        baseUrl: this._baseUrl,
        baseHeaders: this._baseHeaders,
        listInterceptor: this._listInterceptor);
  }
}
