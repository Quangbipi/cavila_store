
import 'dart:convert';

List<Voucher> voucherFromJson(String str) => List<Voucher>.from(json.decode(str)['vouchers'].map((x) => Voucher.fromJson(x)));

String voucherToJson(List<Voucher> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Voucher {
    final String id;
    final String name;
    final String code;
    final int discountPrice;
    final DateTime? expiryDate;
    final int quantity;
    final int? priceUsed;
    

    Voucher({
        required this.id,
        required this.name,
        required this.code,
        required this.discountPrice,
        this.expiryDate,
        required this.quantity,
        this.priceUsed,
        
    });

    factory Voucher.fromJson(Map<String, dynamic> json) => Voucher(
        id: json["_id"],
        name: json["name"],
        code: json["code"],
        discountPrice: json["discountPrice"],
        expiryDate: json["expiryDate"] == null ? null : DateTime.parse(json["expiryDate"]),
        quantity: json["quantity"],
        priceUsed: json["priceUsed"],
        
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "code": code,
        "discountPrice": discountPrice,
        "expiryDate": expiryDate?.toIso8601String(),
        "quantity": quantity,
        "priceUsed": priceUsed,
    };
}
