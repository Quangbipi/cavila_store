import 'dart:convert';

import 'package:cavila_store/constans.dart';
import 'package:cavila_store/secure_storage_service.dart';
import 'package:http/http.dart' as http;
class CommentRepository {
  final client = http.Client();
  Future<dynamic> commentAndRating(String comment, String start, String productId)async{
    String token = await SecureStorageService().getToken();
    var body = jsonEncode({
      "rating" : start,
      "comment" : comment
    });
    try{
      var res = await client.post(
        Uri.parse('$baseUrl/v4/product/$productId/reviewProduct'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: body,
      );
      return res;
    }catch(e){
      throw e.toString();
    }
  }

}

