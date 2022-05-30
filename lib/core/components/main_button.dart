import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:organico/core/constant/constant.dart';

Container mainButton(text) {
  return Container(
    alignment: Alignment.center,
    height: ScreenUtil().setHeight(52),
    decoration: BoxDecoration(
      color: ColorConst.kPimaryColor,
      borderRadius: BorderRadius.circular(100),
    ),
    child: Text(
      text,
      style: TextStyle(
          fontSize: FontConst.mediumFont,
          color: ColorConst.white,
          fontWeight: FontWeight.w700),
    ),
  );
}
