import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:organico/core/components/home/list_title.dart';
import 'package:organico/core/components/sign/back_and_title.dart';
import 'package:organico/core/constant/constant.dart';

class CouponPage extends StatefulWidget {
  const CouponPage({Key? key}) : super(key: key);

  @override
  State<CouponPage> createState() => _CouponPageState();
}

class _CouponPageState extends State<CouponPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: ScreenUtil().setHeight(24),
            ),
            backAndTitleMethod("Your Coupon"),
            SizedBox(height: ScreenUtil().setHeight(10)),
            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                          vertical: ScreenUtil().setHeight(23),
                          horizontal: ScreenUtil().setWidth(20)),
                      margin: EdgeInsets.symmetric(
                          vertical: ScreenUtil().setHeight(10)),
                      height: ScreenUtil().setHeight(91),
                      decoration: BoxDecoration(
                          color: ColorConst.purple,
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                right: ScreenUtil().setWidth(24)),
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
                  }),
            )
          ],
        ),
      ),
    );
  }
}
