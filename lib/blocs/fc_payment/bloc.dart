import 'dart:async';

import 'package:cavila_store/blocs/fc_payment/event.dart';
import 'package:cavila_store/blocs/fc_payment/repository.dart';
import 'package:cavila_store/blocs/fc_payment/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState>{
PaymentRepository paymentRepository;
  PaymentBloc(this.paymentRepository): super(PaymentState()){
    on<AccessPaymentEvent>(handlePaymentEvent);
  }


  FutureOr<void> handlePaymentEvent(AccessPaymentEvent event, Emitter<PaymentState> emit)async{
    emit(PaymentLoading());
    try{
      var res = await paymentRepository.payment(event.paymentModel);
      if(res.statusCode==201){
        emit(PaymentSuccess());
      }else{
        emit(PaymentFail());
      }
    }catch(e){
      emit(PaymentFail());
    }
  }
}