import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:organico/base/baseview.dart';
import 'package:organico/core/components/main_button.dart';
import 'package:organico/core/components/sign/back_and_title.dart';
import 'package:organico/core/components/sign/text_before_input.dart';
import 'package:organico/core/constant/constant.dart';
import 'package:organico/core/init/service/navigation_service.dart';
import 'package:organico/core/widget/cart/item.dart';
import 'package:organico/core/widget/circle_avatar.dart';
import 'package:organico/core/widget/coupon.dart';
import 'package:organico/core/widget/payment_methods.dart';
import 'package:organico/core/widget/shop.dart';
import 'package:organico/screens/home/cubit/home_cubit.dart';
import 'package:organico/screens/home/state/hone_state.dart';

class MyBagPage extends StatefulWidget {
  const MyBagPage({Key? key}) : super(key: key);

  @override
  State<MyBagPage> createState() => _MyBagPageState();
}

class _MyBagPageState extends State<MyBagPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModal: MyBagPage,
        onPageBuildre: (context, widget) {
          return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
            if (state is HomeInitial) {
              return Scaffold(
                body: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: ScreenUtil().setHeight(24)),
                        backAndTitleMethod("My Bag"),
                        SizedBox(height: ScreenUtil().setHeight(28)),
                        shop(),
                        SizedBox(height: ScreenUtil().setHeight(10)),
                        item(),
                        SizedBox(height: ScreenUtil().setHeight(28)),
                        Container(
                          width: double.infinity,
                          height: ScreenUtil().setHeight(52),
                          decoration: BoxDecoration(
                            border: Border.all(color: ColorConst.red),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Add more",
                                  style: TextStyle(
                                      fontSize: FontConst.mediumFont,
                                      color: ColorConst.red,
                                      fontWeight: FontWeight.w700)),
                              SizedBox(
                                width: ScreenUtil().setWidth(10),
                              ),
                              Icon(
                                Icons.add,
                                color: ColorConst.red,
                                size: FontConst.extraLargeFont + 6,
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: ScreenUtil().setHeight(28)),
                        textForReseivedPage("Address"),
                        SizedBox(height: ScreenUtil().setHeight(20)),
                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          )),
                          maxLines: 3,
                        ),
                        SizedBox(height: ScreenUtil().setHeight(20)),
                        textForReseivedPage("Note"),
                        SizedBox(height: ScreenUtil().setHeight(20)),
                        note(""),
                        SizedBox(height: ScreenUtil().setHeight(20)),
                        textForReseivedPage("Coupon"),
                        SizedBox(height: ScreenUtil().setHeight(20)),
                        coupon(),
                        SizedBox(height: ScreenUtil().setHeight(20)),
                        textForReseivedPage("Payment  Method"),
                        SizedBox(height: ScreenUtil().setHeight(20)),
                        paymentMethods(
                            "assets/icons/credit_card.svg", "Credit Card"),
                        SizedBox(height: ScreenUtil().setHeight(20)),
                        totalMethodForREseivedPage("Subtotal", "\$9.98"),
                        SizedBox(height: ScreenUtil().setHeight(20)),
                        totalMethodForREseivedPage("Delivery change", "\$1"),
                        SizedBox(height: ScreenUtil().setHeight(20)),
                        totalMethodForREseivedPage("Coupon", "-\$1"),
                        SizedBox(height: ScreenUtil().setHeight(20)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total",
                                style: TextStyle(
                                    fontSize: FontConst.mediumFont + 2,
                                    fontWeight: FontWeight.w700)),
                            Text(
                              "\$9.98",
                              style: TextStyle(
                                  fontSize: FontConst.mediumFont,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                        InkWell(
                          child: mainButton("Order now"),
                          onTap: () {
                            NavigationService.instance.pushNamed("");
                          },
                        ),
                        SizedBox(height: ScreenUtil().setHeight(45)),
                      ],
                    ),
                  ),
                ),
              );
            } else if (state is HomeLoading) {
              return circular();
            } else {
              return const Text("JHato");
            }
          });
        });
  }

  Row totalMethodForREseivedPage(text1, text2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text1,
            style: TextStyle(
                fontSize: FontConst.mediumFont + 2,
                fontWeight: FontWeight.w700,
                color: ColorConst.grey)),
        Text(text2,
            style: TextStyle(
                fontSize: FontConst.mediumFont,
                fontWeight: FontWeight.w400,
                color: ColorConst.grey)),
      ],
    );
  }

  Text textForReseivedPage(text) => Text(
        text,
        style: TextStyle(
            fontSize: FontConst.mediumFont + 2, fontWeight: FontWeight.w700),
      );

  TextFormField note(controller) {
    return TextFormField(
      // controller: controller,
      decoration: InputDecoration(
        hintStyle: TextStyle(
            fontSize: FontConst.mediumFont - 2, fontWeight: FontWeight.w400),
        hintText: "Please check the product before the packaging.",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
      ),
      maxLines: 4,
    );
  }
}
