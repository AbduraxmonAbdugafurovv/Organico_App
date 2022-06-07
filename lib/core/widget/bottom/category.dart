
  import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:organico/core/constant/constant.dart';

Container categoriy(img, name) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(8)),
      width: ScreenUtil().setWidth(123),
      height: ScreenUtil().setHeight(134),
      decoration: BoxDecoration(
        color: ColorConst.colors[Random().nextInt(ColorConst.colors.length)],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
                height: ScreenUtil().setHeight(59),
                child: SvgPicture.asset(img)),
          ),
          const Expanded(child: SizedBox()),
          Expanded(
            child: Text(name,
                style: TextStyle(
                    fontSize: FontConst.mediumFont,
                    fontWeight: FontWeight.w600)),
          ),
          const Expanded(child: SizedBox())
        ],
      ),
    );
  }
