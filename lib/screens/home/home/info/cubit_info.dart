import 'package:bloc/bloc.dart';
import 'package:organico/model/model.dart';
import 'package:organico/screens/home/home/info/state_info.dart.dart';

class InfoCubit extends Cubit<InfoState> {
  InfoCubit() : super(InfoInitial());
  Set <Model> wishlist={};
  addToWishlist(Model model) {
    if (model.wishlist == true) {
      wishlist.add(model);
      print("Qo'shildi");
    }
    emit(InfoInitial());
  }
}
