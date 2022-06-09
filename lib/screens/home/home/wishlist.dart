import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:organico/base/baseview.dart';
import 'package:organico/core/components/sign/back_and_title.dart';
import 'package:organico/core/constant/constant.dart';
import 'package:organico/core/widget/circle_avatar.dart';
import 'package:organico/screens/home/home/info/cubit_info.dart';
import 'package:organico/screens/home/home/info/state_info.dart.dart';

class WishList extends StatefulWidget {
  const WishList({Key? key}) : super(key: key);

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModal: WishList,
        onPageBuildre: (context, page) {
          return BlocBuilder<InfoCubit,InfoState>(builder: (context, state) {
            if (state is InfoInitial) {
              return Scaffold(
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      SizedBox(height: ScreenUtil().setHeight(24)),
                      backAndTitleMethod("My Wishlist"),
                      SizedBox(height: ScreenUtil().setHeight(28)),
                      Expanded(
                        child: GridView.builder(
                          itemCount: context.watch<InfoCubit>().wishlist.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisSpacing: 10,
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 18),
                          itemBuilder: (context, index) {
                            return Container(
                              width: ScreenUtil().setWidth(180),
                              height: ScreenUtil().setHeight(180),
                              decoration: BoxDecoration(
                                  color: ColorConst.purpleAccent,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                            height: ScreenUtil().setHeight(70),
                                            child: SvgPicture.asset(
                                                context.watch<InfoCubit>().wishlist.toList()[index].img.toString())),
                                        const Expanded(child: SizedBox()),
                                        SvgPicture.asset(
                                            "assets/icons/favourite.svg")
                                      ],
                                    ),
                                    const Expanded(flex: 2, child: SizedBox()),
                                    Text(context.watch<InfoCubit>().wishlist.toList()[index].name,
                                        style: TextStyle(
                                            fontSize: FontConst.mediumFont,
                                            fontWeight: FontWeight.w600)),
                                    const Expanded(child: SizedBox()),
                                    Text("1 Kilogram",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: ColorConst.grey))
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
            } else if (state is InfoLoading) {
              return circular();
            } else {
              return const Text("Hato wishlist cubit ");
            }
          });
        });
  }
}
