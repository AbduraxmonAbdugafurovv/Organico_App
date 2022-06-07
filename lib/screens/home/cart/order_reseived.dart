import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:organico/base/baseview.dart';
import 'package:organico/core/widget/circle_avatar.dart';
import 'package:organico/screens/home/cubit/home_cubit.dart';
import 'package:organico/screens/home/state/hone_state.dart';

class OrderStatusReseivedPage extends StatefulWidget {
  const OrderStatusReseivedPage({Key? key}) : super(key: key);

  @override
  State<OrderStatusReseivedPage> createState() =>
      _OrderStatusReseivedPageState();
}

class _OrderStatusReseivedPageState extends State<OrderStatusReseivedPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModal: OrderStatusReseivedPage,
        onPageBuildre: (context, widget) {
          return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
            if (state is HomeInitial) {
              return Scaffold(
                body: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(20)),
                  child: Column(
                    children: [
                      
                    ],
                  ),
                ),
              );
            } else if (state is HomeLoading) {
              return circular();
            } else {
              return const Text("Hato");
            }
          });
        });
  }
}
