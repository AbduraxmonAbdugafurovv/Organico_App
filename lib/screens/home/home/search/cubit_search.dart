import 'package:bloc/bloc.dart';
import 'package:organico/screens/home/home/search/state_search.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit():super(SearchInitial());
  
}