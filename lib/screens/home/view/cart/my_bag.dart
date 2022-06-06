import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:organico/base/baseview.dart';
import 'package:organico/core/components/sign/back_and_title.dart';
import 'package:organico/core/widget/circle_avatar.dart';
import 'package:organico/core/widget/shop.dart';
import 'package:organico/screens/home/cubit/home_cubit.dart';
import 'package:organico/screens/home/state/hone_state.dart';

class MyBagPage extends StatefulWidget {
  const MyBagPage({Key? key}) : super(key: key);

  @override
  State<MyBagPage> createState() => _MyBagPageState();
}

class _MyBagPageState extends State<MyBagPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView(viewModal: MyBagPage, onPageBuildre: (context,widget){
      return BlocBuilder<HomeCubit,HomeState>(builder: (context,state){
        if(state is HomeInitial){
          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
                child: Column(
                  children: [
                    SizedBox(height: ScreenUtil().setHeight(24)),
                    backAndTitleMethod("My Bag"),
                    SizedBox(height: ScreenUtil().setHeight(28)),
                    shop(),
                    
                  ],
                ),
              ),
            ),
          );
        }else if(state is HomeLoading){
          return circular();
        }else{
          return const Text("JHato");
        }
      });
    });
  }
}