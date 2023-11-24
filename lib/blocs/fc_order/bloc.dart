import 'dart:async';

import 'package:cavila_store/blocs/fc_order/repository.dart';
import 'package:cavila_store/blocs/fc_order/state.dart';
import 'package:cavila_store/models/order_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'event.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState>{
  OrderRepository orderRepository;
  OrderBloc(this.orderRepository) : super(OrderState()){
    on<GetOrderEvent>(handleGetOderEvent);
  }


  FutureOr<void> handleGetOderEvent(GetOrderEvent event, Emitter<OrderState> emit) async {
    emit(GetOrderLoading());
    try{
      var res = await orderRepository.getOrder(event.userId);
      if(res.statusCode == 200){
        OrderData orderData = orderDataFromJson(res.body);
        emit(GetOderSuccess(orderData));
      }
    }catch(e){
      emit(GetOrderFail());
    }
  }
}