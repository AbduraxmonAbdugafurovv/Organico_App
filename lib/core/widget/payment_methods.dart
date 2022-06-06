import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:organico/core/constant/constant.dart';

InkWell paymentMethods(icon, type) {
  return InkWell(
    child: Container(
      height: ScreenUtil().setHeight(84),
      decoration: BoxDecoration(
          border: Border.all(color: ColorConst.greyAccent),
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            SvgPicture.asset(icon),
            SizedBox(width: ScreenUtil().setWidth(20)),
            Text(type,
                style: TextStyle(
                    fontSize: FontConst.mediumFont,
                    fontWeight: FontWeight.w600)),
            const Expanded(child: SizedBox()),
            SvgPicture.asset("assets/icons/right.svg")
          ],
        ),
      ),
    ),
    onTap: () {},
  );
}
