

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:organico/screens/auth/state/auth_state.dart';

class AuthCubit extends Cubit<AuhtState> {
  AuthCubit() : super(AuthInitial());

  TextEditingController nameConroller = TextEditingController();
  TextEditingController phoneNumberConroller = TextEditingController(text: "+998");
  TextEditingController passwordConroller = TextEditingController();
  TextEditingController smsController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  final key = GlobalKey<FormState>();
  bool obsecureText1 = false;
  bool obsecureText2 = false;
  bool isCheked = false;
  closeEye(bool bool) {
    bool = !bool;
    emit(AuthInitial());
  }
}
