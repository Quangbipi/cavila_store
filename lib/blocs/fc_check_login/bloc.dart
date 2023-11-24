import 'dart:async';

import 'package:cavila_store/blocs/fc_check_login/event.dart';
import 'package:cavila_store/blocs/fc_check_login/state.dart';
import 'package:cavila_store/models/account_infor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../secure_storage_service.dart';

class CheckBloc extends Bloc<CheckEvent, CheckLoginState> {
  CheckBloc() : super(CheckLoginState()){
    on<CheckEvent>(handleCheckEvent);
  }
  

  FutureOr<void> handleCheckEvent(CheckEvent event, Emitter emit) async {
    AccountInfor? accountInfor;
    accountInfor = await SecureStorageService().getAccount();
    if(accountInfor == null){
      emit(NotLogin());
    }else{
      emit(IsLogin());
    }
  }
}