import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:organico/screens/home/profile/changePasswords/state/state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitialState());
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController passwordConroller = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
}
