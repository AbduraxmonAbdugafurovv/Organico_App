import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:organico/core/components/sign/back_and_title.dart';
import 'package:organico/core/components/sign/inputfield.dart';
import 'package:organico/core/constant/constant.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: ScreenUtil().setHeight(64),
            ),
            backAndTitleMethod("Forgot Password"),
            SizedBox(
              height: ScreenUtil().setHeight(28),
            ),
            SizedBox(
              width: ScreenUtil().setWidth(349),
              height: ScreenUtil().setHeight(345),
              child: SvgPicture.asset("assets/icons/forgot.svg"),
            ),
            SizedBox(height: ScreenUtil().setHeight(70)),
            Text(
              "Enter your phone number",
              style: TextStyle(
                  fontSize: FontConst.largeFont, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: ScreenUtil().setHeight(16)),
            Text("We need to verify you. We will send you a one-time authorization code,",style: TextStyle(fontSize: FontConst.mediumFont,color: ColorConst.grey),),
            SizedBox(height: ScreenUtil().setHeight(32)),
            // phoneInput()
          ],
        ),
      ),
    );
  }
}
