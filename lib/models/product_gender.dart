import 'dart:convert';

import 'package:cavila_store/models/product.dart';

ProductGender productGenderFromJson(String str) => ProductGender.fromJson(json.decode(str));

String productGenderToJson(ProductGender data) => json.encode(data.toJson());

class ProductGender {
    final bool success;
    final int count;
    final List<Product> products;

    ProductGender({
        required this.success,
        required this.count,
        required this.products,
    });

    factory ProductGender.fromJson(Map<String, dynamic> json) => ProductGender(
        success: json["success"],
        count: json["count"],
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "count": count,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
    };
}