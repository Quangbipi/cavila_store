import 'dart:convert';

import 'package:cavila_store/constans.dart';
import 'package:cavila_store/secure_storage_service.dart';
import 'package:http/http.dart' as http;
class ProductRepository {
  final client = http.Client();

  Future<dynamic> getProduct() async {
    try{
      var res = await client.get(
        Uri.parse('$baseUrl/v4/product/getAllProducts')
      );
      return res;
    }catch(e){
      throw Exception(e);
    }
  }

  Future<dynamic> getProductGender(String key)async {
    try{
      var res = await client.get(
        Uri.parse('$baseUrl/v4/product/list/$key')
      );
      return res;
    }catch(e){
      print(e.toString());
      throw Exception(e);
    }
  }

  Future<dynamic> getProductGenderM(String key)async {
    try{
      var res = await client.get(
        Uri.parse('$baseUrl/v4/product/list/$key')
      );
      return res;
    }catch(e){
      print(e.toString());
      throw Exception(e);
    }
  }

  Future<dynamic> getProductGenderL(String key)async {
    try{
      var res = await client.get(
        Uri.parse('$baseUrl/v4/product/list/$key')
      );
      return res;
    }catch(e){
      print(e.toString());
      throw Exception(e);
    }
  }
  Future<dynamic> getNewProduct()async {
    try{
      var res = await client.get(
        Uri.parse('$baseUrl/v4/product/new/list')
      );
      return res;
    }catch(e){
      print(e.toString());
      throw Exception(e);
    }
  }

  Future<dynamic> addProductToCart(String productId, String size, String color, String token) async {
    try{
      var body = jsonEncode({
        "productId": productId,
        "size": size,
        "color": color,
      });
      var res = await client.post(
        Uri.parse('$baseUrl/v4/user/addLikedProduct'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
          },
        
        body: body,
      );
      return res;
    }catch(e){
      print(e.toString());
      throw Exception(e);
    }
  }

  Future<dynamic> getCart() async {
    String token = await SecureStorageService().getToken();
    try{
      var res = await client.get(
        Uri.parse('$baseUrl/v4/user/viewAllLikedProduct'),
        headers: {
          'Authorization': 'Bearer $token'
          },
        
      );
      return res;
    }catch(e){
      print(e.toString());
      throw Exception(e);
    }
  }

  Future<dynamic> deleteProductInCart(String productId) async {
    String token = await SecureStorageService().getToken();
    try{
      var body = jsonEncode({
        "productId": productId
      });
      var res = await client.delete(
        Uri.parse('$baseUrl/v4/user/deleteLikedProduct'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
          },
        body: body
      );
      return res;
    }catch(e){
      print(e.toString());
      throw Exception(e);
    }
  }
}