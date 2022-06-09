import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:organico/core/components/main_button.dart';
import 'package:organico/core/constant/constant.dart';
import 'package:organico/core/init/service/navigation_service.dart';
import 'package:organico/core/widget/cart/item.dart';
import 'package:organico/core/widget/circle_avatar.dart';
import 'package:organico/core/widget/shop.dart';

import 'package:organico/screens/home/cubit/home_cubit.dart';
import 'package:organico/screens/home/state/home_state.dart';

class MyCartPage extends StatefulWidget {
  const MyCartPage({Key? key}) : super(key: key);

  @override
  State<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      if (state is HomeInitial) {
        return Scaffold(
          body: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: ScreenUtil().setHeight(44)),
                Text("My Cart",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: FontConst.mediumFont + 2,
                        fontWeight: FontWeight.w600)),
                SizedBox(height: ScreenUtil().setHeight(48)),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: ColorConst.greyAccent),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(16),
                        vertical: ScreenUtil().setHeight(20)),
                    child: Column(
                      children: [
                        shop(),
                        item(),
                      ],
                    ),
                  ),
                ),
                const Expanded(child: SizedBox()),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Total",
                            style: TextStyle(
                                fontSize: FontConst.mediumFont,
                                color: ColorConst.grey,
                                fontWeight: FontWeight.w700)),
                        Text("\$ 9.98",
                            style: TextStyle(
                                fontSize: FontConst.extraLargeFont,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                    SizedBox(width: ScreenUtil().setWidth(40)),
                    Expanded(
                        child: InkWell(
                            child: mainButton("Add to bag"),
                            onTap: () {
                              NavigationService.instance.pushNamed("my_bag");
                            }))
                  ],
                ),
                SizedBox(height: ScreenUtil().setHeight(39)),
              ],
            ),
          ),
        );
      } else if (state is HomeLoading) {
        return circular();
      } else {
        return const Text("Hato my cart cubit ");
      }
    });
  }

}
