import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:organico/core/components/home/list_title.dart';
import 'package:organico/core/constant/constant.dart';

Container coupon() {
  return Container(
    padding: EdgeInsets.symmetric(
        vertical: ScreenUtil().setHeight(23),
        horizontal: ScreenUtil().setWidth(20)),
    margin: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(10)),
    height: ScreenUtil().setHeight(91),
    decoration: BoxDecoration(
        color: ColorConst.purple, borderRadius: BorderRadius.circular(12)),
    child: Row(
      children: [
        Padding(
          padding: EdgeInsets.only(right: ScreenUtil().setWidth(24)),
          child: SvgPicture.asset("assets/icons/cupon.svg"),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            listTitile("15 % Discount all item"),
            listSubtitle("7 days remaining"),
          ],
        )
      ],
    ),
  );
}
