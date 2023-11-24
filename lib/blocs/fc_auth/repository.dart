import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../constans.dart';
import '../../secure_storage_service.dart';

class AuthRepository {
  final client = http.Client();

  Future<dynamic> checkLogin(String email, String password) async {
    try {
      var body = jsonEncode({"email": email, "password": password});
      var res = await http.post(
        Uri.parse('$baseUrl/v4/user/login'),
        headers: {'Content-Type': 'application/json'},
        body: body,
      );
      return res;
    } catch (e) {
      print(e.toString());
      throw Exception(e);
    }
  }

  Future<dynamic> checkSignUp(String email, String password, String address,
      String fullName, String phoneNumber) async {
    try {
      var body = jsonEncode({
        "email": email,
        "password": password,
        "address": address,
        "fullName": fullName,
        "phoneNumber": phoneNumber
      });
      var res = await http.post(
        Uri.parse('$baseUrl/v4/user/register'),
        headers: {'Content-Type': 'application/json'},
        body: body,
      );
      return res;
    } catch (e) {
      print(e.toString());
      throw Exception(e);
    }
  }

  Future<dynamic> changePass(String oldPass, String newPass) async {
    String token = await SecureStorageService().getToken();
    try {
      var body = jsonEncode({"oldPassword": oldPass, "newPassword": newPass});
      var res = await http.put(
        Uri.parse('$baseUrl/v4/user/changepassword'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: body,
      );
      return res;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<dynamic> updateProfile(String name, String phoneNumber, String email)async{
    String token = await SecureStorageService().getToken();
    try{
      var body = jsonEncode({
        "fullName" : name,
        "phoneNumber": phoneNumber,
        "email": email
      });
      var res = await client.put(
        Uri.parse('$baseUrl/v4/user/updateProfile'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: body,
      );
      return res;
    }catch(e){
      throw Exception(e);
    }
  }
  Future<dynamic> updateAddress(String address)async{
    String token = await SecureStorageService().getToken();
    try{
      var body = jsonEncode({
        "address" : address,
        
      });
      var res = await client.put(
        Uri.parse('$baseUrl/v4/user/updateProfile'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: body,
      );
      return res;
    }catch(e){
      throw Exception(e);
    }
  }
}
