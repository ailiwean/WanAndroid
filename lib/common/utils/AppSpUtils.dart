import 'package:shared_preferences/shared_preferences.dart';

/// @Description: Share-Preferences
/// @Author: SWY
/// @Date: 2021/2/10 23:05
class AppSpUtils {
  static final String _appSymbol = "wanandroid/sp";

  //每日一图
  static final String daypicture = _appSymbol + "daypicture";

  static Future<T> getValues<T>(String key, {dynamic nullValues}) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      dynamic result = sharedPreferences.get(key);
      if (result == null)
        return nullValues;
      else
        return result as T;
    } catch (e) {
      return nullValues;
    }
  }

  static setValues(String key, dynamic values) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (values is bool) sharedPreferences.setBool(key, values);
    if (values is double) sharedPreferences.setDouble(key, values);
    if (values is int) sharedPreferences.setInt(key, values);
    if (values is String) sharedPreferences.setString(key, values);
    if (values is List<String>) sharedPreferences.setStringList(key, values);
  }
}
