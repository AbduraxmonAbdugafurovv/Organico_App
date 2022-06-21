import 'package:bloc/bloc.dart';
import 'package:organico/screens/home/cart/orderStatus/state/order_state.dart';

class OrderCubit  extends Cubit<OrderStatusState>{
  OrderCubit():super(OrderInitial());
  
}