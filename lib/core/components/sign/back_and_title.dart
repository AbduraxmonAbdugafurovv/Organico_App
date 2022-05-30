import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:organico/core/constant/constant.dart';
import 'package:organico/core/init/service/navigation_service.dart';

Row backAndTitleMethod(text) {
  return Row(
    children: [
      InkWell(
        child: SvgPicture.asset("assets/icons/left.svg"),
        onTap: () {
          NavigationService.instance.pop();
        },
      ),
      SizedBox(
        width: ScreenUtil().setWidth(33),
      ),
      Text(
        text,
        style: TextStyle(
            fontSize: FontConst.mediumFont + 2, fontWeight: FontWeight.w700),
      )
    ],
  );
}
