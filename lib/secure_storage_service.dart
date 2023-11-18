import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'models/account_infor.dart';

class SecureStorageService {
  final secureStorage = const FlutterSecureStorage();
  void wireToken(String token) async {
    await secureStorage.write(key: 'token', value: token);
    bool isUsernameStored = await secureStorage.containsKey(key: 'token');

    if (isUsernameStored) {
      print('object đã ghi');
    } else {
      // Giá trị chưa được ghi vào lưu trữ
      print('object chưa ghi');
    }
  }

  Future<dynamic> getToken() async {
    String? token;
    token = await secureStorage.read(key: 'token');
    if(token != null){
      return token;
    }else{
      return;
    }
  }

  Future<dynamic> getAccount() async {
    late AccountInfor accountInfor;
    final infor = await secureStorage.read(key: 'account');
    if (infor != null) {
      accountInfor = AccountInfor.fromJson(json.decode(infor));
      print(accountInfor.fullName);
       return accountInfor;
    }else{
      return;
    }
   
  }

  void deleteInfo(){
    secureStorage.delete(key: 'account');
    secureStorage.delete(key: 'token');
  }
}
