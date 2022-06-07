import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:organico/base/baseview.dart';
import 'package:organico/core/components/sign/back_and_title.dart';
import 'package:organico/core/constant/constant.dart';
import 'package:organico/core/widget/circle_avatar.dart';
import 'package:organico/screens/home/cubit/home_cubit.dart';
import 'package:organico/screens/home/state/hone_state.dart';

class CancelPage extends StatefulWidget {
  const CancelPage({Key? key}) : super(key: key);

  @override
  State<CancelPage> createState() => _CancelPageState();
}

class _CancelPageState extends State<CancelPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModal: CancelPage,
        onPageBuildre: (context, widget) {
          return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
            if (state is HomeInitial) {
              return Scaffold(
                body: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(20)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: ScreenUtil().setHeight(24)),
                      backAndTitleMethod("Cancelation Reason"),
                      SizedBox(height: ScreenUtil().setHeight(28)),
                      Text("Select  a reason for cancellation",
                          style: TextStyle(
                              fontSize: FontConst.mediumFont + 2,
                              fontWeight: FontWeight.w700)),
                      SizedBox(height: ScreenUtil().setHeight(20)),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
                        alignment: Alignment.centerLeft,
                        height:ScreenUtil().setHeight(62),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            color: ColorConst.greyAccent
                          ),
                            borderRadius: BorderRadius.circular(12)),
                            child: Text("Want to change",style: TextStyle(fontSize: FontConst.mediumFont,fontWeight: FontWeight.w400),),
                      )
                    ],
                  ),
                ),
              );
            } else if (state is HomeLoading) {
              return circular();
            } else {
              return const Text("Hato ");
            }
          });
        });
  }
}
