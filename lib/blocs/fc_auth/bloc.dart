import 'dart:async';
import 'dart:convert';

import 'package:cavila_store/blocs/fc_auth/event.dart';
import 'package:cavila_store/blocs/fc_auth/repository.dart';
import 'package:cavila_store/blocs/fc_auth/state.dart';
import 'package:cavila_store/models/account_infor.dart';
import 'package:cavila_store/secure_storage_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepository authRepository;
  final secureStorage = const FlutterSecureStorage();
  AuthBloc(this.authRepository) : super(AuthState()) {
    on<SignInEvent>(handleSignInEvent);
    on<SignOutEvent>(handleSignOutEvent);
    on<SignUpEvent>(handleSignUpEvent);
  }

  FutureOr<void> handleSignInEvent(
      SignInEvent event, Emitter<AuthState> emit) async {
    emit(SignInLoading());
    try {
      var res = await authRepository.checkLogin(event.email, event.password);
      if (res.statusCode == 200) {
        AccountInfor accountInfor = accountInforFromJson(res.body);
        SecureStorageService().wireToken(accountInfor.token);
        String jsonModel = jsonEncode(accountInfor.toJson());
        await secureStorage.write(key: 'account', value: jsonModel);
        emit(SignInSuccess(accountInfor));
      } else {
        emit(SignInFail());
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  FutureOr<void> handleSignOutEvent(
      SignOutEvent event, Emitter<AuthState> emit) async {
    SecureStorageService().deleteInfo();
    emit(AuthState());
  }

  FutureOr<void> handleSignUpEvent(
      SignUpEvent event, Emitter<AuthState> emit) async {
    emit(SignUpLoading());
    try {
      var res = await authRepository.checkSignUp(event.email, event.password,
          event.address, event.fullName, event.phoneNumber);
      if (res.statusCode == 201) {
        AccountInfor accountInfor = accountInforFromJson(res.body);
        String jsonModel = jsonEncode(accountInfor.toJson());
        await secureStorage.write(key: 'account', value: jsonModel);
        emit(SignUpSuccess(accountInfor));
        emit(SignInSuccess(accountInfor));
      } else {
        emit(SignUpFail());
      }
    } catch (e) {
      print(e.toString());
      emit(SignUpFail());
    }
  }
}
