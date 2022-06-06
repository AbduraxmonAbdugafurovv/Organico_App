import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:organico/model/model.dart';

class FontConst {
  static double extraSmallFont = ScreenUtil().setHeight(8.0);
  static double smallFont = ScreenUtil().setHeight(12.0);
  static double mediumFont = ScreenUtil().setHeight(16.0);
  static double largeFont = ScreenUtil().setHeight(20.0);
  static double extraLargeFont = ScreenUtil().setHeight(24.0);
}

class ColorConst {
  static Color yourSelfColor = const Color(0xff4D6FF0);
  static Color mySelfColor = const Color(0xffab0023);
  static Color greyAccent = const Color.fromRGBO(234, 234, 234, 1);
  static Color redAccentColor = const Color(0xffd33865);
  static Color purple = const Color(0xffd33865);

  static Color purpleAccent = const Color.fromRGBO(170, 0, 35, 0.15);
  static Color blueWhite = const Color(0xffE9F0F7);
  static Color darkGrey = const Color(0xff696974);

  static Color kPimaryColor = const Color(0xffAA0023);
  static Color white = Colors.white;
  static Color black = Colors.black;
  static Color blue = Colors.blue;
  static Color yellow = Colors.yellow;
  static Color green = Colors.green;
  static Color grey = Colors.grey;
  static Color red = Colors.red;

  static  List colors = [
    const Color.fromRGBO(234, 129, 47, 0.15),
    const Color.fromRGBO(118, 178, 38, 0.15),
    const Color.fromRGBO(151, 3, 29, 0.15),
    const Color.fromRGBO(233, 176, 79, 0.15),
    const Color.fromRGBO(63, 125, 60, 0.15)
  ];
}
