import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../constans.dart';

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
}
