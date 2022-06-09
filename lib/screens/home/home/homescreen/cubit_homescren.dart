import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:organico/model/model.dart';
import 'package:organico/screens/home/home/homescreen/state_homescreen.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomescreenInitial());
  TextEditingController searchController = TextEditingController();

  moveToSearchPage() {
    emit(HomeScreenSearch());
  }

  backToHome() {
    emit(HomescreenInitial());
  }

  Set <Model> searchedItems = {};

  clear() {
    searchedItems.clear();
    emit(HomeScreenSearch());
  }

  addToSearchedItems(Model item) {
    searchedItems.add(item);
    emit(HomeScreenSearch());
    debugPrint(item.name);
  }
}
