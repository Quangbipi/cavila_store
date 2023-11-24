import 'package:equatable/equatable.dart';

class BottomBarEvent extends Equatable{
  
  @override
  List<Object?> get props => [];

}

class BottomBarChangeEvent extends BottomBarEvent{
  final int selectIndex;
  BottomBarChangeEvent(this.selectIndex);
  @override
  List<Object?> get props => [selectIndex];

}