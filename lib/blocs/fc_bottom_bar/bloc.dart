import 'dart:async';

import 'package:cavila_store/blocs/fc_bottom_bar/event.dart';
import 'package:cavila_store/blocs/fc_bottom_bar/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomBarBloc extends Bloc<BottomBarEvent, BottomBarState>{

  BottomBarBloc() : super(BottomBarState()){
    on<BottomBarChangeEvent>(handleBottomBarChange);
  }


  FutureOr<void> handleBottomBarChange(BottomBarChangeEvent event, Emitter<BottomBarState> emit) async {
    emit(BottomBarChangeSuccess(event.selectIndex));
  }
}