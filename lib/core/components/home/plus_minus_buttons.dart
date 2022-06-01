import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:organico/core/constant/constant.dart';

Container plusMinus(icon) {
  return Container(
    alignment: Alignment.center,
    height: ScreenUtil().setHeight(40),
    width: ScreenUtil().setHeight(40),
    decoration: BoxDecoration(
        color: ColorConst.green, borderRadius: BorderRadius.circular(10)),
    child: SvgPicture.asset(icon),
  );
}
