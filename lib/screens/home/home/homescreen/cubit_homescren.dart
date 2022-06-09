import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:organico/screens/home/home/homescreen/state_homescreen.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomescreenInitial());
  TextEditingController searchController = TextEditingController();

  moveToSearchPage() {
    emit(HomescreenSearch());
  }

  backToHome() {
    emit(HomescreenInitial());
  }
}
