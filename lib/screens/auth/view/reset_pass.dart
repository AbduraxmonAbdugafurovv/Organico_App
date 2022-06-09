import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:organico/base/baseview.dart';
import 'package:organico/core/components/main_button.dart';
import 'package:organico/core/components/sign/back_and_title.dart';
import 'package:organico/core/components/sign/inputfield.dart';
import 'package:organico/core/components/sign/text_before_input.dart';
import 'package:organico/core/constant/constant.dart';
import 'package:organico/screens/auth/cubit/auth_cubit.dart';
import 'package:organico/screens/auth/state/auth_state.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController =
        context.watch<AuthCubit>().passwordConroller;
    TextEditingController confirmPasswordController =
        context.watch<AuthCubit>().confirmpasswordController;
    return BaseView(
      viewModal: ResetPasswordPage,
      onPageBuildre: (context, widget) {
        return BlocBuilder<AuthCubit, AuhtState>(
          builder: (context, state) {
            if (state is AuthInitial) {
              return Scaffold(
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: ScreenUtil().setHeight(24),
                        ),
                        backAndTitleMethod("Reset Password"),
                        SizedBox(height: ScreenUtil().setHeight(48)),
                        Text(
                          "Please fill in the field below to set your current password",
                          style: TextStyle(
                            fontSize: FontConst.mediumFont,
                          ),
                        ),
                        SizedBox(height: ScreenUtil().setHeight(48)),
                        Form(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textBeforeInput("New Password"),
                              SizedBox(
                                height: ScreenUtil().setHeight(10),
                              ),
                              inputfield(
                                  context,
                                  passwordController,
                                  "Password",
                                  context.watch<AuthCubit>().obsecureText1),
                              SizedBox(
                                height: ScreenUtil().setHeight(16),
                              ),
                              textBeforeInput("New Password Confirmation"),
                              SizedBox(
                                height: ScreenUtil().setHeight(10),
                              ),
                              inputfield(
                                  context,
                                  confirmPasswordController,
                                  "New password confirmation",
                                  context.watch<AuthCubit>().obsecureText1),
                            ],
                          ),
                        ),
                        SizedBox(height: ScreenUtil().setHeight(48)),
                        InkWell(child: mainButton("Reset password")),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return const Text("Hato reset Cubitda");
            }
          },
        );
      },
    );
  }
}
