import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:organico/core/components/main_button.dart';
import 'package:organico/core/constant/constant.dart';
import 'package:organico/core/widget/circle_avatar.dart';
import 'package:organico/screens/home/cubit/home_cubit.dart';
import 'package:organico/screens/home/state/hone_state.dart';

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
                        Row(
                          children: [
                            SvgPicture.asset("assets/icons/icon_home.svg"),
                            SizedBox(width: ScreenUtil().setWidth(16)),
                            Text("Popey Shop - New york ",
                                style: TextStyle(
                                    fontSize: FontConst.mediumFont,
                                    fontWeight: FontWeight.w600)),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: ScreenUtil().setHeight(10)),
                          height: ScreenUtil().setHeight(114),
                          width: ScreenUtil().setHeight(342),
                          decoration: BoxDecoration(
                            color: ColorConst.purpleAccent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: ScreenUtil().setWidth(20),
                                vertical: ScreenUtil().setHeight(13)),
                            child: Row(
                              children: [
                                Expanded(
                                    child:
                                        Image.asset("assets/images/veget.png")),
                                SizedBox(width: ScreenUtil().setWidth(20)),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text("Brocolli",
                                          style: TextStyle(
                                              fontSize: FontConst.mediumFont,
                                              fontWeight: FontWeight.w600)),
                                      Text(
                                        "1 Kilo",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: ColorConst.grey),
                                      ),
                                      Text("\$4.99 ",
                                          style: TextStyle(
                                              fontSize: FontConst.mediumFont,
                                              fontWeight: FontWeight.w600))
                                    ],
                                  ),
                                ),
                                SizedBox(width: ScreenUtil().setWidth(20)),
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    children: [
                                      plusButtonMyCart(
                                          "assets/icons/minus.svg"),
                                      SizedBox(
                                          width: ScreenUtil().setWidth(15)),
                                      Text(
                                        "1",
                                        style: TextStyle(
                                            fontSize: FontConst.mediumFont + 2,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                          width: ScreenUtil().setWidth(15)),
                                      plusButtonMyCart("assets/icons/plus.svg"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
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
                    // mainButton("Add to bag")
                  ],
                ),
              ],
            ),
          ),
        );
      } else if (state is HomeLoading) {
        return circleAvatar();
      } else {
        return const Text("Hato");
      }
    });
  }


  Container plusButtonMyCart(icon) {
    return Container(
      height: ScreenUtil().setHeight(32),
      width: ScreenUtil().setWidth(32),
      decoration: BoxDecoration(
        color: ColorConst.green,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: const EdgeInsets.all(9.0),
        child: SvgPicture.asset(icon),
      ),
    );
  }
}
