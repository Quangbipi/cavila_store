import 'dart:convert';

import 'like_product.dart';

AccountInfor accountInforFromJson(String str) => AccountInfor.fromJson(json.decode(str));
AccountInfor accountInforFromJson2(String str) => AccountInfor.fromJson2(json.decode(str));

String accountInforToJson(AccountInfor data) => json.encode(data.toJson());

class AccountInfor {
    final String id;
    final String fullName;
    final String email;
    final String phoneNumber;
    final String address;
    final String role;
    final List<LikedProduct> likedProduct;
    final String token;

    AccountInfor({
        required this.id,
        required this.fullName,
        required this.email,
        required this.phoneNumber,
        required this.address,
        required this.role,
        required this.likedProduct,
        required this.token,
    });

    factory AccountInfor.fromJson(Map<String, dynamic> json) => AccountInfor(
        id: json["_id"],
        fullName: json["fullName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        address: json["address"],
        role: json["role"],
        likedProduct: json["likedProduct"]!= null ? List<LikedProduct>.from(json["likedProduct"].map((x) => LikedProduct.fromJson(x))) : [],
        token: json["token"],
    );

    factory AccountInfor.fromJson2(Map<String, dynamic> json) => AccountInfor(
        id: json["_id"],
        fullName: json["fullName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        address: json["address"],
        role: json["role"],
        likedProduct: [],
        token: json["token"],
    );
    Map<String, dynamic> toJson() => {
        "_id": id,
        "fullName": fullName,
        "email": email,
        "phoneNumber": phoneNumber,
        "address": address,
        "role": role,
        "likedProduct": List<dynamic>.from(likedProduct.map((x) => x.toJson())),
        "token": token,
    };
}