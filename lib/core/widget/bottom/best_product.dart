
  import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:organico/core/components/home/grid_comp.dart';
import 'package:organico/core/constant/constant.dart';
import 'package:organico/data/data.dart';

Container bestProduct(int index) {
  var vegetable = Data.data[0];

    return Container(
      margin: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(6)),
      height: ScreenUtil().setHeight(242),
      width: ScreenUtil().setHeight(196),
      decoration: BoxDecoration(
          color: ColorConst.colors[Random().nextInt(ColorConst.colors.length)],
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: ScreenUtil().setHeight(80),
                child: SvgPicture.asset(vegetable[index].img.toString())),
            SizedBox(height: ScreenUtil().setHeight(20)),
            SizedBox(height: ScreenUtil().setHeight(10)),
            nameThing(vegetable[index].name),
            SizedBox(height: ScreenUtil().setHeight(5)),
            const Expanded(child: SizedBox()),
            marketName(vegetable[index].name.toString()),
            const Expanded(flex: 2, child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                priceThing(vegetable[index].price.toString()),
                Container(
                  height: ScreenUtil().setHeight(36),
                  width: ScreenUtil().setWidth(36),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorConst.green),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SvgPicture.asset("assets/icons/plus.svg"),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
