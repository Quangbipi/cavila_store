import 'package:cavila_store/constans.dart';
import 'package:http/http.dart' as http;
class ProductRepository {
  final client = http.Client();

  Future<dynamic> getProduct(){
    try{
      var res = client.get(
        Uri.parse('$baseUrl/v4/product/getAllProducts')
      );
      return res;
    }catch(e){
      throw Exception(e);
    }
  }
}