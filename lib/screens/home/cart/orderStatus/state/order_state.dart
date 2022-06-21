abstract class OrderStatusState {
  OrderStatusState();
}

class OrderLoadingState extends  OrderStatusState {
  OrderLoadingState();
}

class OrderInitial extends  OrderStatusState {
  OrderInitial();
}

class OrderError extends  OrderStatusState {
  OrderError();
}