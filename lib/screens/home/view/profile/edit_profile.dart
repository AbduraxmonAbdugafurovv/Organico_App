import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:organico/base/baseview.dart';
import 'package:organico/core/components/main_button.dart';
import 'package:organico/core/components/sign/back_and_title.dart';
import 'package:organico/core/components/sign/inputfield.dart';
import 'package:organico/core/components/sign/text_before_input.dart';
import 'package:organico/screens/home/cubit/home_cubit.dart';
import 'package:organico/screens/home/state/hone_state.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModal: EditProfile,
        onPageBuildre: (context, widget) {
          return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
            if (state is HomeInitial) {
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
                        backAndTitleMethod("Adit Profile"),
                        SizedBox(height: ScreenUtil().setHeight(32)),
                        Center(
                          child: SizedBox(
                            height: ScreenUtil().setHeight(170),
                            width: ScreenUtil().setWidth(170),
                            child: Stack(
                              children: [
                                Positioned(
                                  child: CircleAvatar(
                                    radius: ScreenUtil().setHeight(85),
                                  ),
                                ),
                                Positioned(
                                    bottom: 2,
                                    right: 0,
                                    child: SvgPicture.asset(
                                        "assets/icons/camera.svg")),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: ScreenUtil().setHeight(32)),
                        Form(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textBeforeInput("Name"),
                              SizedBox(height: ScreenUtil().setHeight(10)),
                              TextFormField(
                                controller:
                                    context.watch<HomeCubit>().nameControlller,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: ScreenUtil().setWidth(16),
                                        vertical: ScreenUtil().setHeight(13)),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          ScreenUtil().setHeight(100)),
                                    )),
                              ),
                              SizedBox(height: ScreenUtil().setHeight(16)),
                              textBeforeInput("Phone"),
                              SizedBox(height: ScreenUtil().setHeight(10)),
                              phoneInput(
                                  context.watch<HomeCubit>().phoneControlller),
                              SizedBox(height: ScreenUtil().setHeight(16)),
                              textBeforeInput("Address"),
                              SizedBox(height: ScreenUtil().setHeight(10)),
                              TextFormField(
                                controller:
                                    context.watch<HomeCubit>().addressControlller,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(16))),
                              ),
                              SizedBox(height:ScreenUtil().setHeight(100) ,),
                              InkWell(
                                child: mainButton("Save"),
                                onTap: () {
                
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
              ;
            } else if (state is HomeError) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else {
              return const Text("Hato stateda");
            }
          });
        });
  }
}
