import 'package:equatable/equatable.dart';

import '../../models/account_infor.dart';

class AuthState extends Equatable{
  @override
  
  List<Object?> get props => [];
  
}

class SignInLoading extends AuthState{

}

class SignInSuccess extends AuthState {
  final AccountInfor accountInfor;
  SignInSuccess(this.accountInfor);
}

class SignInFail extends AuthState {

}

class SignUpLoading extends AuthState{

}

class SignUpSuccess extends AuthState {
  final AccountInfor accountInfor;
  SignUpSuccess(this.accountInfor);
}

class SignUpFail extends AuthState {

}