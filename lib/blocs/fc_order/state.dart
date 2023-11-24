import 'package:cavila_store/models/order_data.dart';
import 'package:equatable/equatable.dart';

class OrderState extends Equatable{
  @override
  List<Object?> get props => [];

}

class GetOrderLoading extends OrderState{

}

class GetOderSuccess extends OrderState{
  final OrderData orderData;
  GetOderSuccess(this.orderData);
}

class GetOrderFail extends OrderState{
  
}