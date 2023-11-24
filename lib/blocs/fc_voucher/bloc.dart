import 'dart:async';

import 'package:cavila_store/blocs/fc_voucher/event.dart';
import 'package:cavila_store/blocs/fc_voucher/repository.dart';
import 'package:cavila_store/blocs/fc_voucher/state.dart';
import 'package:cavila_store/models/voucher_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VoucherBloc extends Bloc<VoucherEvent, VoucherState>{
  VoucherRepository voucherRepository;
  VoucherBloc(this.voucherRepository): super(VoucherState()){
    on<GetVoucherEvent>(handleGetVoucherEvent);
  }


  FutureOr<void> handleGetVoucherEvent(GetVoucherEvent event, Emitter emit) async{
    emit(GetVoucherLoading());
    try{
      var res = await voucherRepository.getVoucher();
      if(res.statusCode == 200){
        List<Voucher> vouchers = voucherFromJson(res.body);
        emit(GetVoucherSuccess(vouchers));
      }
    }catch(e){
      print(e.toString());
      emit(GetVoucherFail());
    }
  }
}