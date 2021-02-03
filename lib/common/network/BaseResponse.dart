/// errorCode : 0
/// errorMsg : ""



class BaseResponse<T> {
  int _errorCode;
  String _errorMsg;
  T _data;

  int get errorCode => _errorCode;

  String get errorMsg => _errorMsg;

  T get data => _data;

  BaseResponse({int errorCode, String errorMsg, T data}) {
    _errorCode = errorCode;
    _errorMsg = errorMsg;
    _data = data;
  }

  BaseResponse.fromJson(dynamic json) {
    _errorCode = json["errorCode"];
    _errorMsg = json["errorMsg"];
  }
}
