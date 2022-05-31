import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:organico/screens/home/state/hone_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  var pageIndex = 0;
  changePage(index) {
    pageIndex = index;
    emit(HomeInitial());
  }
}
