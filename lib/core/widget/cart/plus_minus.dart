import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:organico/core/constant/constant.dart';

Container plusButtonMyCart(icon) {
  return Container(
    height: ScreenUtil().setHeight(32),
    width: ScreenUtil().setWidth(32),
    decoration: BoxDecoration(
      color: ColorConst.green,
      borderRadius: BorderRadius.circular(6),
    ),
    child: Padding(
      padding: const EdgeInsets.all(9.0),
      child: SvgPicture.asset(icon),
    ),
  );
}
