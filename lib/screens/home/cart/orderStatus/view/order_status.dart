import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organico/base/baseview.dart';
import 'package:organico/core/widget/circle_avatar.dart';
import 'package:organico/screens/home/cart/orderStatus/cubit/order_cubit.dart';
import 'package:organico/screens/home/cart/orderStatus/state/order_state.dart';

class OrderStatusPage extends StatefulWidget {
  const OrderStatusPage({Key? key}) : super(key: key);

  @override
  State<OrderStatusPage> createState() => _OrderStatusState();
}

class _OrderStatusState extends State<OrderStatusPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView(viewModal: OrderStatusPage, onPageBuildre: (context, page){
      return BlocBuilder<OrderCubit,OrderStatusState>(builder: (context,state){
        if(state is OrderInitial){
          return Scaffold(
            body:Column(
              children: [
                
              ],
            ),
          );
        }else if(state is OrderLoadingState){
          return circular();
        }else {
          return const  Text("Hato order State da");
        }
      });
    });
  }
}