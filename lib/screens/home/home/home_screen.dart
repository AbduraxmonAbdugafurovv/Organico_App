import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:organico/core/components/home/before_listtile.dart';
import 'package:organico/core/components/home/list_title.dart';
import 'package:organico/core/components/sign/inputfield.dart';
import 'package:organico/core/init/service/navigation_service.dart';
import 'package:organico/core/widget/bottom/best_product.dart';
import 'package:organico/core/widget/bottom/category.dart';
import 'package:organico/data/data.dart';
import 'package:organico/screens/home/state/home_state.dart';

class HomeSreen extends StatefulWidget {
  const HomeSreen({Key? key}) : super(key: key);

  @override
  State<HomeSreen> createState() => _HomeSreenState();
}

class _HomeSreenState extends State<HomeSreen> {
  var vegetable = Data.data[0];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(builder: (context, state) {
      if (state is HomeInitial) {
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
                          child:
                              SvgPicture.asset("assets/icons/search_any.svg"),
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
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            InkWell(
                              child: categoriy(
                                  "assets/images/broccoli.svg", "Vegetables"),
                              onTap: () {
                                NavigationService.instance.pushNamed(
                                    "categories",
                                    argument: Data.data[0]);
                              },
                            ),
                            categoriy("assets/images/banana.svg", "Fruits"),
                            categoriy(
                                "assets/images/broccoli.svg", "Vegetables"),
                          ],
                        ),
                      )),
                  SizedBox(height: ScreenUtil().setHeight(48)),
                  beforeListCategoryHomeScreen("Best Selling", ""),
                  SizedBox(height: ScreenUtil().setHeight(16)),
                  SizedBox(
                    height: ScreenUtil().setHeight(242),
                    child: ListView.builder(
                      itemCount: vegetable.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          child: bestProduct(index),
                          onTap: () {
                            NavigationService.instance.pushNamed("info_page",
                                argument: vegetable[index]);
                          },
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      } else {
        return const Text("Hato state daa");
      }
    });
  }
}
