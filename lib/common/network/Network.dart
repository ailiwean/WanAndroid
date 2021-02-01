import 'package:dio/dio.dart';
import 'package:wan_android/common/network/BaseApi.dart';

class Network {
  final String baseUrl;
  final Map baseHeaders;
  final Dio dio = Dio();

  static Network _network;

  Network._({this.baseUrl, this.baseHeaders});

  static Build build() => Build._();

  static Future<Response<T>> execute<T>(BaseApi baseApi) {
    if (baseApi.type != null)
      return baseApi.type == Type.GET ? _get(baseApi) : _post(baseApi);
    return baseApi.body == null ? _get(baseApi) : _post(baseApi);
  }

  static Future<Response<T>> _get<T>(BaseApi baseApi) {
    return Network._network.dio.get(_getUrl(baseApi) + _getHttpParams(baseApi),
        options: Options(headers: _getMergeHeaderMap(baseApi)));
  }

  static Future<Response<T>> _post<T>(BaseApi baseApi) {
    return Network._network.dio.post(_getUrl(baseApi) + _getHttpParams(baseApi),
        data: baseApi.body,
        options: Options(headers: _getMergeHeaderMap(baseApi)));
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
}

class Build {
  Build._();

  var _baseUrl;
  var _baseHeaders;

  Build setBaseUrl(String baseUrl) {
    this._baseUrl = baseUrl;
    return this;
  }

  Build setBaseHeaders(Map baseHeaders) {
    this._baseHeaders = baseHeaders;
    return this;
  }

  void build() {
    Network._network =
        new Network._(baseUrl: this._baseUrl, baseHeaders: this._baseHeaders);
  }
}
