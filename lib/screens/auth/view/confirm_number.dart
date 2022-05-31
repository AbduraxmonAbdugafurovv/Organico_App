import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:organico/base/baseview.dart';
import 'package:organico/core/components/main_button.dart';
import 'package:organico/core/components/sign/back_and_title.dart';
import 'package:organico/core/components/sign/inputfield.dart';
import 'package:organico/core/constant/constant.dart';
import 'package:organico/core/extension/context_extension.dart';
import 'package:organico/core/init/service/navigation_service.dart';
import 'package:organico/screens/auth/cubit/auth_cubit.dart';
import 'package:organico/screens/auth/state/auth_state.dart';

class ConfirmPage extends StatefulWidget {
  const ConfirmPage({Key? key}) : super(key: key);

  @override
  State<ConfirmPage> createState() => _ConfirmPageState();
}

class _ConfirmPageState extends State<ConfirmPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController smsController =
        context.watch<AuthCubit>().smsController;
    return BaseView(
      viewModal: ConfirmPage,
      onPageBuildre: (context, widget) {
        return BlocBuilder<AuthCubit, AuhtState>(
          builder: (context, state) {
            if (state is AuthInitial) {
              return Scaffold(
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: ScreenUtil().setHeight(24),
                      ),
                      backAndTitleMethod("OTAC Number"),
                      SizedBox(height: ScreenUtil().setHeight(48)),
                      Text("Enter Authorization code",
                          style: TextStyle(
                              fontSize: FontConst.largeFont,
                              fontWeight: FontWeight.w700)),
                      SizedBox(height: ScreenUtil().setHeight(16)),
                      Text("We have sent SMS to: ",
                          style: TextStyle(fontSize: FontConst.mediumFont)),
                      SizedBox(
                        height: ScreenUtil().setHeight(5),
                      ),
                      Text("+998(XX) XXX-XX-XX",
                          style: TextStyle(
                              fontSize: FontConst.mediumFont + 2,
                              fontWeight: FontWeight.w700)),
                      SizedBox(
                        height: ScreenUtil().setHeight(40),
                      ),
                      TextFormField(
                        controller: smsController,
                        decoration: InputDecoration(
                          hintText: "6 Digit Code ",
                          hintStyle: hintStyle(),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100)),
                        ),
                        validator: (v) {},
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(24),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: context.width * 0.55),
                        child: TextButton(
                            onPressed: () {},
                            child: Text("Resend code",
                                style: TextStyle(
                                    fontSize: FontConst.mediumFont,
                                    fontWeight: FontWeight.w700,
                                    color: ColorConst.green))),
                      ),
                      SizedBox(height: ScreenUtil().setHeight(40)),
                      InkWell(
                        child: mainButton("Next"),
                        onTap: () {
                          NavigationService.instance.pushNamed("reset_pass");
                        },
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const Text("Hato cubitda");
            }
          },
        );
      },
    );
  }
}
