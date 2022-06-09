import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:organico/base/baseview.dart';
import 'package:organico/core/components/main_button.dart';
import 'package:organico/core/components/sign/back_and_title.dart';
import 'package:organico/core/components/sign/inputfield.dart';
import 'package:organico/core/constant/constant.dart';
import 'package:organico/screens/home/cubit/home_cubit.dart';
import 'package:organico/screens/home/state/home_state.dart';

class ConfirmPhoneProfile extends StatefulWidget {
  const ConfirmPhoneProfile({Key? key}) : super(key: key);

  @override
  State<ConfirmPhoneProfile> createState() => _ConfirmPhoneProfileState();
}

class _ConfirmPhoneProfileState extends State<ConfirmPhoneProfile> {
  @override
  Widget build(BuildContext context) {
    return BaseView(viewModal: ConfirmPhoneProfile, onPageBuildre: (context,widget){
      return BlocBuilder<HomeCubit,HomeState>(builder: (context,state){
        if(state is HomeInitial){
          return Scaffold(
            body: Padding(
              padding:const  EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: ScreenUtil().setHeight(24)),
                  backAndTitleMethod("OTAC Number"),
                  SizedBox(height: ScreenUtil().setHeight(48)),
                  Text("It looks you changed your phone number.  Please enter the OAC number that we have sent to your new number",style: TextStyle(fontSize: FontConst.mediumFont,fontWeight: FontWeight.w400,color: ColorConst.grey),),
                  SizedBox(height: ScreenUtil().setHeight(40)),
                  TextFormField(
                    controller: context.watch<HomeCubit>().codeController,
                    decoration: InputDecoration(
                      hintText:" 6 Digit Code",
                      contentPadding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(16),vertical: ScreenUtil().setHeight(13)),
                      hintStyle: hintStyle(),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(100))),
                  ),
                  SizedBox(height: ScreenUtil().setHeight(24)),
                  Row(
                    children: [
                      const  Expanded(child: SizedBox()),
                      Text("Resend Code",style: TextStyle(fontSize: FontConst.mediumFont,color: ColorConst.green,fontWeight: FontWeight.w700)),
                    ],
                  ),
                  SizedBox(height: ScreenUtil().setHeight(40)),
                  InkWell(child: mainButton("Confirm")),
                ],
              ),
            ),
          );
        }
        else if(state is HomeLoading){
          return const Center(child: CircularProgressIndicator.adaptive(),);
        }else{
          return const  Text("Hato confirm stateda");
        }
      });
    });
  }
}