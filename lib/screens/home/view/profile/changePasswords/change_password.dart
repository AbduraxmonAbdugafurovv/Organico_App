import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:organico/base/baseview.dart';
import 'package:organico/core/components/main_button.dart';
import 'package:organico/core/components/sign/back_and_title.dart';
import 'package:organico/core/components/sign/inputfield.dart';
import 'package:organico/core/components/sign/text_before_input.dart';
import 'package:organico/core/constant/constant.dart';
import 'package:organico/screens/home/cubit/home_cubit.dart';
import 'package:organico/screens/home/state/hone_state.dart';
import 'package:organico/screens/home/view/profile/changePasswords/cubit/change_password_cubit.dart';
import 'package:organico/screens/home/view/profile/changePasswords/state.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModal: ChangePassword,
        onPageBuildre: (context, widget) {
          return BlocBuilder<ChangePasswordCubit, ChangePasswordState>(builder: (context, state) {
            if (state is ChangePasswordInitialState) {
              return Scaffold(
                body: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setHeight(20)),
                  child: Column(
                    children: [
                      SizedBox(height: ScreenUtil().setHeight(24)),
                      backAndTitleMethod("Change Password"),
                      SizedBox(height: ScreenUtil().setHeight(48)),
                      Text(
                          "Please fill in the field below to change your current password",
                          style: TextStyle(
                              fontSize: FontConst.mediumFont,
                              fontWeight: FontWeight.w400)),
                      SizedBox(height: ScreenUtil().setHeight(48)),
                      Form(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            textBeforeInput("Current Password"),
                            SizedBox(height: ScreenUtil().setHeight(10)),
                            inputfield(
                                context,
                                context
                                    .watch<ChangePasswordCubit>()
                                    .currentPasswordController,
                                "Current Password",
                                true),
                            SizedBox(height: ScreenUtil().setHeight(16)),
                            textBeforeInput("Current Password"),
                            SizedBox(height: ScreenUtil().setHeight(10)),
                            inputfield(
                                context,
                                context.watch<ChangePasswordCubit>().passwordConroller,
                                "New Password",
                                true),
                            SizedBox(height: ScreenUtil().setHeight(16)),
                            textBeforeInput("Current Password"),
                            SizedBox(height: ScreenUtil().setHeight(10)),
                            inputfield(
                                context,
                                context
                                    .watch<ChangePasswordCubit>()
                                    .confirmpasswordController,
                                "New Password Confirmation",
                                true),
                          ],
                        ),
                      ),
                      SizedBox(height: ScreenUtil().setHeight(48)),
                      InkWell(child: mainButton("Save Password"), onTap: () {}),
                    ],
                  ),
                ),
              );
            } else if (state is ChangePAsswordLoadingState) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else {
              return const Text("Hato");
            }
          });
        });
  }
}
