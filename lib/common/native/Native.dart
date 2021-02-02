import 'package:flutter/services.dart';

class Native {
  final String channel;
  final String servelName;
  MethodChannel methodChannel;

  Native({this.channel, this.servelName}) {
    if (channel == null ||
        servelName == null ||
        channel.isEmpty ||
        servelName.isEmpty) throw "native调用前必要参数不能为空";
    this.methodChannel = MethodChannel(channel);
  }

  Future<T> notice<T>() {
    return methodChannel.invokeMethod<T>(servelName).catchError(
        (dynamic, StackTrace) {
      print("native通信出错" + dynamic.toString());
    }, test: (Object o) {
      return true;
    });
  }
}
