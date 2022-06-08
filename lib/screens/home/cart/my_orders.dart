import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organico/base/baseview.dart';
import 'package:organico/core/widget/circle_avatar.dart';
import 'package:organico/screens/home/state/home_state.dart';

class MyOrdersPage extends StatefulWidget {
  const MyOrdersPage({Key? key}) : super(key: key);

  @override
  State<MyOrdersPage> createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView(viewModal: MyOrdersPage, onPageBuildre: (context,widget){
      return BlocBuilder(builder: (context,state){
        if(state is HomeInitial){
          return Scaffold(
            body: Column(
              children: [
                
              ],
            ),
          );
        }else if(state is  HomeLoading){
          return circular();
        }else{
          return const  Text("Hato");
        }
      });
    });
  }
}