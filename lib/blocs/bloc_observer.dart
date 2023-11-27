import 'package:flutter_bloc/flutter_bloc.dart';
import 'fc_bottom_bar/bloc.dart';

class CavilaBlocObserver extends BlocObserver{
  @override
  void onChange(BlocBase bloc, Change change) {
    // TODO: implement onChange
    super.onChange(bloc, change);
    if(bloc is BottomBarBloc){
        print("Change: $change");
    }
    
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
    super.onTransition(bloc, transition);

    if(bloc is BottomBarBloc){
      print("Trans: $transition");
    }
    
  }
}