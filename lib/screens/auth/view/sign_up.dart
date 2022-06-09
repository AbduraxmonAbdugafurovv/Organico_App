import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:organico/base/baseview.dart';
import 'package:organico/core/components/main_button.dart';
import 'package:organico/core/components/sign/back_and_title.dart';
import 'package:organico/core/components/sign/inputfield.dart';
import 'package:organico/core/components/sign/sign_with_google.dart';
import 'package:organico/core/components/sign/text_before_input.dart';
import 'package:organico/core/constant/constant.dart';
import 'package:organico/screens/auth/cubit/auth_cubit.dart';
import 'package:organico/screens/auth/state/auth_state.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    bool isCheked = context.watch<AuthCubit>().isCheked;
    TextEditingController passwordController =
        context.watch<AuthCubit>().passwordConroller;
    TextEditingController confirmPasswordController =
        context.watch<AuthCubit>().confirmpasswordController;
    TextEditingController nameController =
        context.watch<AuthCubit>().nameConroller;
    return BaseView(
      viewModal: const SignUpPage(),
      onPageBuildre: (context, widget) {
        return BlocBuilder<AuthCubit, AuhtState>(builder: (contex, state) {
          if (state is AuthInitial) {
            return Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: ScreenUtil().setHeight(40),
                      ),
                      backAndTitleMethod("New Registration"),
                      SizedBox(
                        height: ScreenUtil().setHeight(68),
                      ),
                      Text(
                          "It took like you don't have an account on this number . Please let us know some information for a secure service.",
                          style: TextStyle(
                              fontSize: FontConst.mediumFont,
                              fontWeight: FontWeight.w400,
                              color: ColorConst.grey)),
                      SizedBox(height: ScreenUtil().setHeight(48)),
                      Form(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            textBeforeInput("Full name"),
                            SizedBox(height: ScreenUtil().setHeight(10)),
                            TextFormField(
                                controller: nameController,
                                decoration: InputDecoration(
                                    hintText: "Full name",
                                    hintStyle: hintStyle(),
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: ScreenUtil().setWidth(16),
                                        vertical: ScreenUtil().setHeight(13)),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(100),
                                    ))),
                            SizedBox(height: ScreenUtil().setHeight(16)),
                            textBeforeInput("Password"),
                            SizedBox(height: ScreenUtil().setHeight(10)),
                            inputfield(context, passwordController, "Password",
                                contex.watch<AuthCubit>().obsecureText1),
                            SizedBox(height: ScreenUtil().setHeight(16)),
                            textBeforeInput("Confirm Password"),
                            SizedBox(height: ScreenUtil().setHeight(10)),
                            inputfield(
                                contex,
                                confirmPasswordController,
                                "Confirm Passowrd",
                                contex.watch<AuthCubit>().obsecureText2)
                          ],
                        ),
                      ),
                      SizedBox(height: ScreenUtil().setHeight(24)),
                      Row(
                        children: [
                          Checkbox(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6)),
                              value: isCheked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isCheked = value!;
                                });
                              }),
                          const Text("I accept the"),
                          Text(
                            "Terms of Use",
                            style: TextStyle(color: ColorConst.green),
                          ),
                          const Text(" and "),
                          Text("Privacy policy",
                              style: TextStyle(color: ColorConst.green)),
                        ],
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(45),
                      ),
                      mainButton("Sign Up"),
                      SizedBox(height: ScreenUtil().setHeight(24)),
                      Center(
                        child: Text("or use",
                            style: TextStyle(color: ColorConst.grey)),
                      ),
                      SizedBox(height: ScreenUtil().setHeight(24)),
                      InkWell(
                        child: signWithGoogle(),
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const Text("Hato sign up  cubitda");
          }
        });
      },
    );
  }
}
