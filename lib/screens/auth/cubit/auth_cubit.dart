import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:organico/screens/auth/state/auth_state.dart';

class AuthCubit extends Cubit<AuhtState> {
  AuthCubit() : super(AuthInitial());

  TextEditingController nameConroller = TextEditingController();
  TextEditingController phoneNumberConroller = TextEditingController(text: "+998");
  TextEditingController passwordConroller = TextEditingController();
  final key = GlobalKey<FormState>();
}
