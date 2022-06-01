import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:organico/core/components/home/list_title.dart';
import 'package:organico/core/components/sign/inputfield.dart';
import 'package:organico/core/constant/constant.dart';
import 'package:organico/core/init/service/navigation_service.dart';

class HomeSreen extends StatefulWidget {
  const HomeSreen({Key? key}) : super(key: key);

  @override
  State<HomeSreen> createState() => _HomeSreenState();
}

class _HomeSreenState extends State<HomeSreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: ScreenUtil().setHeight(94),
              ),
              TextFormField(
                decoration: InputDecoration(
                    filled: true,
                    hintText: "Search anything here",
                    hintStyle: hintStyle(),
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(16),
                          vertical: ScreenUtil().setHeight(13)),
                      child: SvgPicture.asset("assets/icons/search_any.svg"),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(16),
                        vertical: ScreenUtil().setHeight(13)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                    )),
              ),
              SizedBox(height: ScreenUtil().setHeight(45)),
              InkWell(
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    leading: SvgPicture.asset("assets/icons/cupon.svg"),
                    trailing: SvgPicture.asset("assets/icons/right.svg"),
                    title: listTitile("You have 3 coupon"),
                    subtitle: listSubtitle("Let's use this coupon"),
                  ),
                  onTap: () {
                    NavigationService.instance.pushNamed("coupon_page");
                  }),
              SizedBox(
                height: ScreenUtil().setHeight(25),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Choose Category",
                      style: TextStyle(
                          fontSize: FontConst.mediumFont + 2,
                          fontWeight: FontWeight.w700)),
                  InkWell(
                    child: Text(
                      "See all",
                      style: TextStyle(
                          color: ColorConst.darkGrey,
                          fontWeight: FontWeight.w400),
                    ),
                    onTap: () {
                      NavigationService.instance.pushNamed("vegetables");
                    }
                  )
                ],
              ),
              SizedBox(height: ScreenUtil().setHeight(16)),
              SizedBox(
                height: ScreenUtil().setHeight(134),
                child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(8)),
                        width: ScreenUtil().setWidth(123),
                        height: ScreenUtil().setHeight(134),
                        decoration: BoxDecoration(
                            color: ColorConst.green,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(25),
                              child: Image.asset("assets/icons/broccoli.png"),
                            ),
                            Text("Vegetables",
                                style: TextStyle(
                                    fontSize: FontConst.mediumFont,
                                    fontWeight: FontWeight.w600)),
                          ],
                        ),
                      );
                    }),
              ),
              // Text("Best selling ")
            ],
          ),
        ),
      ),
    );
  }
}
