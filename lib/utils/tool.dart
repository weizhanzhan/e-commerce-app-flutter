import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class $ {
  $();

  static String getNow({
    DateTime time,
  }) {
    var now = time != null ? time : new DateTime.now();
    var year = now.year.toString();
    var month = now.month.toString();
    var day = now.day.toString().padLeft(2, '0');
    var hour = now.hour.toString().padLeft(2, '0');
    var minute = now.minute.toString().padLeft(2, '0');
    var second = now.second.toString().padLeft(2, '0');
    return "$year-$month-$day $hour:$minute:$second";
  }

  /// ScreenUtil
  static setWidth(double value) {
    return ScreenUtil().setHeight(value);
  }

  static setHeight(double value) {
    return ScreenUtil().setHeight(value);
  }

  static setSp(double value) {
    return ScreenUtil().setHeight(value);
  }

  static screen() {
    return ScreenUtil();
  }
}

class $theme {
  static double f_12 = $.setSp(24);
  static double f_14 = $.setSp(28);
  static double f_16 = $.setSp(32);
  static double f_18 = $.setSp(36);
  static double f_20 = $.setSp(40);

  static Color grey1 = Color.fromRGBO(144, 144, 144, 1); //灰阶1

  static Color black1 = Color.fromRGBO(16, 16, 16, 1); //黑阶1
}
