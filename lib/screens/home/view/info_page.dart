import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:organico/core/constant/constant.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: ScreenUtil().setHeight(24)),
            SizedBox(
                height: ScreenUtil().setHeight(64),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset("assets/icons/left.svg"),
                    SvgPicture.asset("assets/icons/favourite_icon.svg"),
                  ],
                )),
            SizedBox(height: ScreenUtil().setHeight(7)),
            Center(
              child: SizedBox(
                  height: ScreenUtil().setHeight(194),
                  width: ScreenUtil().setWidth(238),
                  child: Image.asset("assets/images/veget.png")),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(16),
            ),
            Text("Paprika",
                style: TextStyle(
                    fontSize: FontConst.extraLargeFont,
                    fontWeight: FontWeight.w600)),
            SizedBox(height: ScreenUtil().setHeight(8)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Vegshop",
                    style: TextStyle(
                        fontSize: FontConst.mediumFont + 2,
                        fontWeight: FontWeight.w400,
                        color: ColorConst.grey)),
                SizedBox(
                  child: Row(
                    children: [
                      plusMinus("assets/icons/min.svg"),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Text("1",
                            style: TextStyle(
                                fontSize: FontConst.extraLargeFont,
                                fontWeight: FontWeight.w600)),
                      ),
                      plusMinus("assets/icons/plus.svg"),
                    ],
                  ),
                )
              ],
            ),
            Text("\$4.99/Kg",style: TextStyle(fontSize: FontConst.extraLargeFont,fontWeight: FontWeight.w600,),)
          ],
        ),
      ),
    );
  }

  Container plusMinus(icon) {
    return Container(
      alignment: Alignment.center,
      height: ScreenUtil().setHeight(40),
      width: ScreenUtil().setHeight(40),
      decoration: BoxDecoration(
          color: ColorConst.green, borderRadius: BorderRadius.circular(10)),
      child: SvgPicture.asset(icon),
    );
  }
}
