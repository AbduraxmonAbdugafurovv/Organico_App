
  import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:organico/core/constant/constant.dart';
import 'package:organico/core/widget/cart/plus_minus.dart';

Container item() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(10)),
      height: ScreenUtil().setHeight(114),
      width: ScreenUtil().setHeight(342),
      decoration: BoxDecoration(
        color: ColorConst.purpleAccent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(20),
            vertical: ScreenUtil().setHeight(13)),
        child: Row(
          children: [
            Expanded(child: Image.asset("assets/images/broccoli.png")),
            SizedBox(width: ScreenUtil().setWidth(20)),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Brocolli",
                      style: TextStyle(
                          fontSize: FontConst.mediumFont,
                          fontWeight: FontWeight.w600)),
                  Text(
                    "1 Kilo",
                    style: TextStyle(
                        fontWeight: FontWeight.w400, color: ColorConst.grey),
                  ),
                  Text("\$4.99 ",
                      style: TextStyle(
                          fontSize: FontConst.mediumFont,
                          fontWeight: FontWeight.w600))
                ],
              ),
            ),
            SizedBox(width: ScreenUtil().setWidth(20)),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  plusButtonMyCart("assets/icons/minus.svg"),
                  SizedBox(width: ScreenUtil().setWidth(15)),
                  Text(
                    "1",
                    style: TextStyle(
                        fontSize: FontConst.mediumFont + 2,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(width: ScreenUtil().setWidth(15)),
                  plusButtonMyCart("assets/icons/plus.svg"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
