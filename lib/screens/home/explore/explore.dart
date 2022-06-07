import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:organico/core/components/home/grid_comp.dart';
import 'package:organico/core/constant/constant.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: ScreenUtil().setHeight(24)),
            SizedBox(
              height: ScreenUtil().setHeight(65),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Explore",
                      style: TextStyle(
                          fontSize: FontConst.mediumFont + 2,
                          fontWeight: FontWeight.w700)),
                  SvgPicture.asset("assets/icons/filter.svg"),
                ],
              ),
            ),
            SizedBox(height: ScreenUtil().setHeight(8)),
            Expanded(
              child: GridView.builder(
                itemCount: 3,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: ScreenUtil().setHeight(28),
                  crossAxisSpacing: ScreenUtil().setWidth(22),
                  childAspectRatio:
                      ScreenUtil().setWidth(176) / ScreenUtil().setHeight(234),
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: ColorConst.purpleAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              height: ScreenUtil().setHeight(80),
                              child: Image.asset("assets/images/veget.png")),
                          nameThing("Paprike"),
                              const Expanded( child: SizedBox()),
                          marketName("Vegshop"),
                          const Expanded(flex: 2, child: SizedBox()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              priceThing("\$4.99/Kg"),
                              Container(
                                height: ScreenUtil().setHeight(36),
                                width: ScreenUtil().setWidth(36),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: ColorConst.green),
                                child: Padding(
                                  padding: const EdgeInsets.all(7.0),
                                  child:
                                      SvgPicture.asset("assets/icons/plus.svg"),
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
            ),
          ],
        ),
      ),
    );
  }
}
