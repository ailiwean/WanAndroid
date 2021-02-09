/// @Description: 字符串正则处理
/// @Author: SWY
/// @Date: 2021/2/9 22:49
class AppRegUtils {
  static RegExp urlRegExp = RegExp(
      "^(https?|ftp|file)://[-a-zA-Z0-9+&@#/%?=~_|!:,.;]*[-a-zA-Z0-9+&@#/%=~_|]");

  static RegExp scriptRegExp = RegExp("<script[^>]*?>[\\s\\S]*?<\\/script>");

  static RegExp styleRegExp = RegExp("<style[^>]*?>[\\s\\S]*?<\\/style>");

  static RegExp htmlRegExp = RegExp("<[^>]+>");

  static RegExp clearCharsetRegExp = RegExp("&[\\w]*;");

  // 匹配字符串是否为uri
  static bool isMatchUri(String ori) {
    return urlRegExp.hasMatch(ori);
  }

  //删除字符串中标签信息
  static String deleteJsH5Text(String ori) {
    return ori
        .replaceAll(scriptRegExp, "")
        .replaceAll(styleRegExp, "")
        .replaceAll(htmlRegExp, "")
        .replaceAll("&lt;", "<")
        .replaceAll("&gt;", ">")
        .replaceAll("&amp;", "&")
        .replaceAll("&mdash;", "—")
        .replaceAll("&quot;", "\"")
        .replaceAll("&apos;", "'")
        .replaceAll("&copy;", "©")
        .replaceAll("&reg;", "®")
        .replaceAll("&copy;", "©")
        .replaceAll("&trade;", "™")
        .replaceAll("&times;", "×")
        .replaceAll("&divide;", "÷")
        .replaceAll("&middot;", ".")
        .replaceAll("\n", "")
        .replaceAll(clearCharsetRegExp, "");
  }
}
