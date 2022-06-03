import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:organico/base/baseview.dart';
import 'package:organico/core/components/sign/back_and_title.dart';
import 'package:organico/core/constant/constant.dart';
import 'package:organico/screens/home/cubit/home_cubit.dart';
import 'package:organico/screens/home/state/hone_state.dart';

class PaymentMethodPage extends StatefulWidget {
  const PaymentMethodPage({Key? key}) : super(key: key);

  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModal: PaymentMethodPage,
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
                      backAndTitleMethod("Payment Method"),
                      SizedBox(height: ScreenUtil().setHeight(28)),
                      paymentMethods("assets/icons/credit_card.svg","Credit Card"),
                      SizedBox(height: ScreenUtil().setHeight(16)),
                      paymentMethods("assets/icons/paypal.svg","Paypal"),
                    ],
                  ),
                ),
              );
            } else if (state is HomeLoading) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else {
              return const Text("Hato");
            }
          });
        });
  }

  InkWell paymentMethods(icon,type) {
    return InkWell(
      child: Container(
        height: ScreenUtil().setHeight(84),
        decoration: BoxDecoration(
            border: Border.all(color: ColorConst.greyAccent),
            borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              SvgPicture.asset(icon),
              SizedBox(width: ScreenUtil().setWidth(20)),
              Text(type,
                  style: TextStyle(
                      fontSize: FontConst.mediumFont,
                      fontWeight: FontWeight.w600)),
              const Expanded(child: SizedBox()),
              SvgPicture.asset("assets/icons/right.svg")
            ],
          ),
        ),
      ),
      onTap: () {},
    );
  }
}
