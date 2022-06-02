import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organico/screens/home/state/hone_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  var pageIndex = 0;
  changePage(index) {
    pageIndex = index;
    emit(HomeInitial());
  }

  final nameControlller = TextEditingController(text: "Joe doe");
  final phoneControlller =
      TextEditingController(text: "998994878083");
  final addressControlller =
      TextEditingController(text: "rgjnkfgnmdklfgndklfngldfkngdklfgndlkfgndklfgndklfndklfgndlkfngdlkgnldkfngdlkfgndlkgndlkgndf");
  final codeController = TextEditingController();
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController passwordConroller = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
}
