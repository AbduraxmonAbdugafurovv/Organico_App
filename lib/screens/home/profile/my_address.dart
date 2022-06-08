import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:organico/base/baseview.dart';
import 'package:organico/core/components/sign/back_and_title.dart';
import 'package:organico/core/constant/constant.dart';
import 'package:organico/screens/home/cubit/home_cubit.dart';
import 'package:organico/screens/home/state/home_state.dart';

class MyAddressPage extends StatefulWidget {
  const MyAddressPage({Key? key}) : super(key: key);

  @override
  State<MyAddressPage> createState() => _MyAddressPageState();
}

class _MyAddressPageState extends State<MyAddressPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModal: MyAddressPage,
        onPageBuildre: (context, widget) {
          return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
            if (state is HomeInitial) {
              return Scaffold(
                body: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(20)),
                  child: Column(
                    children: [
                      SizedBox(height: ScreenUtil().setHeight(24)),
                      backAndTitleMethod("My Address"),
                      SizedBox(height: ScreenUtil().setHeight(28)),
                      addresss(
                          "Home", "375 W gray st utica Pensilvaniya 1234", ""),
                      SizedBox(height: ScreenUtil().setHeight(20)),
                      addresss("Work",
                          "2715Ash Dr San Joes , South Dakota 83495", "")
                    ],
                  ),
                ),
              );
            } else if (state is HomeLoading) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else {
              return const Text(
                "Hato",
              );
            }
          });
        });
  }

  InkWell addresss(text1, text2, routeName) {
    return InkWell(
      child: Container(
        height: ScreenUtil().setHeight(91),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: ColorConst.greyAccent),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(text1,
                    style: TextStyle(
                        fontSize: FontConst.mediumFont,
                        fontWeight: FontWeight.w600)),
                SizedBox(height: ScreenUtil().setHeight(8)),
                Text(
                  text2,
                  style: const TextStyle(fontWeight: FontWeight.w400),
                )
              ],
            ),
            SvgPicture.asset("assets/icons/right.svg")
          ],
        ),
      ),
    );
  }
}
