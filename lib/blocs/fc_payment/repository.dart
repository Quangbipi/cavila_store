
import 'package:cavila_store/constans.dart';
import 'package:http/http.dart' as http;

import '../../models/payment_model.dart';
import '../../secure_storage_service.dart';

class PaymentRepository {
  final client = http.Client();
  Future<dynamic> payment(PaymentModel paymentModel) async {
    String token = await SecureStorageService().getToken();
    try {
      var body = paymentModelToJson(paymentModel);
      print(body);
      var res = await client.post(Uri.parse('$baseUrl/v4/product/queue/add'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          },
          body: body);
      return res;
    } catch (e) {
      throw Exception(e);
    }
  }
}
