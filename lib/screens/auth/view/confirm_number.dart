import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:organico/base/baseview.dart';
import 'package:organico/core/components/sign/back_and_title.dart';
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
    return BaseView(viewModal: ConfirmPage, onPageBuildre: (context,widget){
      return BlocBuilder<AuthCubit,AuhtState>(builder: (context,state){
        if(state is AuthInitial){
          return   Scaffold(
            body:Padding(
              padding: const  EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: ScreenUtil().setHeight(24),),
                  backAndTitleMethod("OTAC Number"),
                ],
              ),
            ),
          );
        }else{
          return const  Text("Hato cubitda");
        }
      });
    });
  }
}