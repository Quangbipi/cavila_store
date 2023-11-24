import 'package:cavila_store/constans.dart';
import 'package:http/http.dart' as http;
class VoucherRepository {
  final client = http.Client();
  Future<dynamic> getVoucher()async{
    try{
      var res = await client.get(
        Uri.parse('$baseUrl/v4/voucher/list/all')
      );
      return res;
    }catch(e){
      print(e.toString());
      throw Exception(e);
    }
  }
}