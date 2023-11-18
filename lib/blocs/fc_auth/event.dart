import 'package:equatable/equatable.dart';

class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;
  SignInEvent(this.email, this.password);
}

class SignUpEvent extends AuthEvent {
  final String email;
  final String password;
  final String address;
  final String fullName;
  final String phoneNumber;

  SignUpEvent(this.email, this.password, this.address, this.fullName, this.phoneNumber);
}

class SignOutEvent extends AuthEvent{
  
}