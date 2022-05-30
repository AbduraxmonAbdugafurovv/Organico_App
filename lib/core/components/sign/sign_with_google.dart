import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:organico/core/constant/constant.dart';

Container signWithGoogle() {
  return Container(
    alignment: Alignment.center,
    height: ScreenUtil().setHeight(52),
    decoration: BoxDecoration(
      border: Border.all(color: ColorConst.grey),
      borderRadius: BorderRadius.circular(100),
    ),
    child: Text(
      "Sign up with Google",
      style: TextStyle(
          fontSize: FontConst.mediumFont, fontWeight: FontWeight.w700),
    ),
  );
}
