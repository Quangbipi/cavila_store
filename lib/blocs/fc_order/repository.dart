import 'package:cavila_store/constans.dart';
import 'package:http/http.dart' as http;

import '../../secure_storage_service.dart';
class OrderRepository {
  final client = http.Client();
  Future<dynamic> getOrder(String userId)async{
    String token = await SecureStorageService().getToken();
    try{
      var res = await client.get(
        Uri.parse('$baseUrl/v4/product/queue/user/list/$userId'),
        headers: {
            'Authorization': 'Bearer $token'
          }
      );
      return res;
    }catch(e){
      throw Exception(e);
    }
  }
}