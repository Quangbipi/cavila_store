import 'package:cavila_store/models/payment_model.dart';
import 'package:equatable/equatable.dart';

class PaymentEvent extends Equatable{
  
  @override
  List<Object?> get props => [];

}
class AccessPaymentEvent extends PaymentEvent{
  final PaymentModel paymentModel;
  AccessPaymentEvent(this.paymentModel);
}
