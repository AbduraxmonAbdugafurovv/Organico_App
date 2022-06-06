import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:organico/core/components/home/before_listtile.dart';
import 'package:organico/core/components/home/grid_comp.dart';
import 'package:organico/core/components/home/list_title.dart';
import 'package:organico/core/components/sign/inputfield.dart';
import 'package:organico/core/constant/constant.dart';
import 'package:organico/core/init/service/navigation_service.dart';
import 'package:organico/data/data.dart';

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
              SizedBox(height: ScreenUtil().setHeight(35)),
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
              SizedBox(height: ScreenUtil().setHeight(25)),
              beforeListCategoryHomeScreen("Choose Category", "vegetables"),
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
                              padding: const EdgeInsets.all(10),
                              child: SizedBox(
                                  height: ScreenUtil().setHeight(59),
                                  child: Image.asset(
                                      "assets/images/broccoli.png")),
                            ),
                            const Expanded(child: SizedBox()),
                            Expanded(
                              child: Text("Vegetables",
                                  style: TextStyle(
                                      fontSize: FontConst.mediumFont,
                                      fontWeight: FontWeight.w600)),
                            ),
                            const Expanded(child: SizedBox())
                          ],
                        ),
                      );
                    }),
              ),
              SizedBox(height: ScreenUtil().setHeight(48)),
              beforeListCategoryHomeScreen("Best Selling", ""),
              SizedBox(height: ScreenUtil().setHeight(16)),
              SizedBox(
                height: ScreenUtil().setHeight(242),
                child: ListView.builder(
                  itemCount: Data.data.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    var data = Data.data;
                    return Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(6)),
                      height: ScreenUtil().setHeight(242),
                      width: ScreenUtil().setHeight(196),
                      decoration: BoxDecoration(
                          color: ColorConst.purpleAccent,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: ScreenUtil().setHeight(80),
                                child: Image.asset(data[index].img!)),
                            SizedBox(height: ScreenUtil().setHeight(20)),
                            SizedBox(height: ScreenUtil().setHeight(10)),
                            nameThing(data[index].name),
                            SizedBox(height: ScreenUtil().setHeight(5)),
                            const Expanded(child: SizedBox()),
                            marketName(data[index].shop),
                            const Expanded(flex: 2, child: SizedBox()),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                priceThing(data[index].price),
                                Container(
                                  height: ScreenUtil().setHeight(36),
                                  width: ScreenUtil().setWidth(36),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: ColorConst.green),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: SvgPicture.asset(
                                        "assets/icons/plus.svg"),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


}
