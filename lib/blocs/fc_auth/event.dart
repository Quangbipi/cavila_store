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

class ChangePassEvent extends AuthEvent{
  final String oldPass;
  final String newPass;
  ChangePassEvent(this.oldPass, this.newPass);
}

class UpdateProfileEvent extends AuthEvent{
  final String name;
  final String phoneNumber;
  final String email;
  UpdateProfileEvent(this.name, this.phoneNumber, this.email);
}

class UpdateAddressEvent extends AuthEvent{
  final String address;

  UpdateAddressEvent(this.address);
}