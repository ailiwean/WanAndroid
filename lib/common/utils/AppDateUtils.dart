/// @Description: 日期工具
/// @Author: SWY
/// @Date: 2021/2/9 1:24
class AppDateUtils {
  /// 获取距离当前日期往前的时间戳
  static int getNowBeforeDurtion(Duration duration) {
    return DateTime.now().millisecondsSinceEpoch - duration.inMilliseconds;
  }
}
