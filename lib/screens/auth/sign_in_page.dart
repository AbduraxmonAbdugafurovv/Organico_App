import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:organico/base/baseview.dart';
import 'package:organico/core/components/main_button.dart';
import 'package:organico/core/components/sign/inputfield.dart';
import 'package:organico/core/constant/constant.dart';
import 'package:organico/core/extension/context_extension.dart';
import 'package:organico/core/init/service/navigation_service.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _phoneNumberController = TextEditingController(text: "+998");
  final _passwordController = TextEditingController();
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModal: const SignInPage(),
      onPageBuildre: (context, widget) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: ScreenUtil().setHeight(46),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13),
                    child: SvgPicture.asset("assets/icons/sign_in_icon.svg"),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(65.89),
                  ),
                  Text(
                    "Welcome",
                    style: TextStyle(
                      fontSize: FontConst.largeFont,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(16),
                  ),
                  Text(
                    "Welcome to organico Mobile Apps. Please fill in the field delow to sign in",
                    style: TextStyle(
                        fontSize: FontConst.mediumFont,
                        fontWeight: FontWeight.w400,
                        color: ColorConst.black.withOpacity(0.4)),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(32),
                  ),
                  Form(
                    key: _key,
                    child: Column(
                      children: [
                        phoneInput(_phoneNumberController),
                        SizedBox(
                          height: ScreenUtil().setHeight(20),
                        ),
                        TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 12),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: SvgPicture.asset("assets/icons/lock.svg"),
                            ),
                            suffixIcon: const Icon(
                              Icons.remove_red_eye_outlined,
                              size: 22,
                            ),
                            hintText: "Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(24),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: context.width * 0.55),
                          child: TextButton(
                              onPressed: () {
                                NavigationService.instance
                                    .pushNamed("forgot_password");
                              },
                              child: Text(
                                "Forgot password",
                                style: TextStyle(
                                    fontSize: FontConst.mediumFont,
                                    fontWeight: FontWeight.w700,
                                    color: ColorConst.green),
                              )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(46),
                  ),
                  InkWell(
                    child: mainButton("Sign In"),
                    onTap: () {
                      NavigationService.instance.pushNamed("sign_up");
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
