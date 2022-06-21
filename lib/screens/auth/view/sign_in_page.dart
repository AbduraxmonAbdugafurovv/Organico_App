import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:organico/base/baseview.dart';
import 'package:organico/cheking_page.dart';
import 'package:organico/core/components/main_button.dart';
import 'package:organico/core/components/sign/inputfield.dart';
import 'package:organico/core/constant/constant.dart';
import 'package:organico/core/extension/context_extension.dart';
import 'package:organico/core/init/service/navigation_service.dart';
import 'package:organico/screens/auth/cubit/auth_cubit.dart';
import 'package:organico/screens/auth/state/auth_state.dart';
import 'package:organico/widgets/snackbar_widget.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController phoneNumberController =
        context.watch<AuthCubit>().phoneNumberController;
    TextEditingController passwordController =
        context.watch<AuthCubit>().passwordController;
    GlobalKey key = context.watch<AuthCubit>().key;
    return BaseView(
      viewModal: const SignInPage(),
      onPageBuildre: (context, widget) {
        return BlocBuilder<AuthCubit, AuhtState>(builder: (context, state) {
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
                      SizedBox(
                        height: ScreenUtil().setHeight(46),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 13),
                        child:
                            SvgPicture.asset("assets/icons/sign_in_icon.svg"),
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
                        key: key,
                        child: Column(
                          children: [
                            phoneInput(phoneNumberController),
                            SizedBox(
                              height: ScreenUtil().setHeight(20),
                            ),
                            TextFormField(
                              controller: passwordController,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 12),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child:
                                      SvgPicture.asset("assets/icons/lock.svg"),
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
                              padding:
                                  EdgeInsets.only(left: context.width * 0.55),
                              child: TextButton(
                                  onPressed: () {
                                    NavigationService.instance
                                        .pushNamed("forgot_password");
                                  },
                                  child: Text("Forgot password",
                                      style: TextStyle(
                                          fontSize: FontConst.mediumFont,
                                          fontWeight: FontWeight.w700,
                                          color: ColorConst.green))),
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
                          readFromdb(phoneNumberController.text, passwordController.text);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return const Text("Hato sign in Cubitda");
          }
        });
      },
    );
  }
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future readFromdb(String phoneNumberController,String passwordController ) async {
    try {
      var data = await firestore.collection("users").get();
      for (var item in data.docs) {
        if(item.id.toString() == phoneNumberController){
          debugPrint(item.id.toString());
          if(item["code"].toString() == passwordController){ 
            debugPrint(item["code"].toString());
            return Navigator.push(context, MaterialPageRoute(builder: (_)=>CheckingPage()));
            
          }else{
           return SnackBarWidget.showSnackBar(context, "Incorrect Password", Colors.red);
          }
        }else{
           return Navigator.pushNamed(context, "sign_up");
        }
      }
    } catch (e) {
      SnackBarWidget.showSnackBar(context, "Error while read: $e", Colors.blue);
    }
  }
}
