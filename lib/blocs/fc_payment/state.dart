import 'package:equatable/equatable.dart';

class PaymentState extends Equatable{
  @override
  List<Object?> get props => [];

}

class PaymentLoading extends PaymentState{

}

class PaymentSuccess extends PaymentState{

}

class PaymentFail extends PaymentState{
  
}