import 'package:flutter_screenutil/flutter_screenutil.dart';

/// @Description:  宽高比例适配
/// @Author: SWY
/// @Date: 2021/2/9 18:27
double setSuitWidthPx(double px) {
  return ScreenUtil().setWidth(px);
}

double setSuitHeightPx(double px) {
  return ScreenUtil().setHeight(px);
}

double setSuitTextPx(double size) {
  return ScreenUtil().setSp(size);
}
