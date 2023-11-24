import 'package:equatable/equatable.dart';

class OrderEvent extends Equatable{
  
  @override
  List<Object?> get props => [];

}

class GetOrderEvent extends OrderEvent{
  final String userId;
  GetOrderEvent(this.userId);
}