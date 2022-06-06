import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:organico/core/constant/constant.dart';

Row shop() {
  return Row(
    children: [
      SvgPicture.asset("assets/icons/icon_home.svg"),
      SizedBox(width: ScreenUtil().setWidth(16)),
      Text("Popey Shop - New york ",
          style: TextStyle(
              fontSize: FontConst.mediumFont, fontWeight: FontWeight.w600)),
    ],
  );
}
