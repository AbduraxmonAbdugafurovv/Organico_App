import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organico/base/baseview.dart';
import 'package:organico/screens/home/state/hone_state.dart';

class MyBag extends StatefulWidget {
  const MyBag({Key? key}) : super(key: key);

  @override
  State<MyBag> createState() => _MyBagState();
}

class _MyBagState extends State<MyBag> {
  @override
  Widget build(BuildContext context) {
    return BaseView(viewModal: MyBag, onPageBuildre: (context,widget){
      return BlocBuilder(builder: (context,state){
        if(state is HomeInitial){
          return Scaffold();
        }else if(state is HomeLoading){
          return 
        }
      });
    });
  }
}