import 'package:equatable/equatable.dart';

class BottomBarState extends Equatable{
  @override
  List<Object?> get props => [];

}

class BottomBarChangeSuccess extends BottomBarState{
  final int selectIndex;
  BottomBarChangeSuccess(this.selectIndex);
  @override
  List<Object?> get props => [selectIndex];
}