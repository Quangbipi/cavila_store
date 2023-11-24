import 'dart:convert';

import 'package:cavila_store/models/product.dart';



CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
    final List<LikedProductCart> likedProducts;

    CartModel({
        required this.likedProducts,
    });

    factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        likedProducts: List<LikedProductCart>.from(json["likedProducts"].map((x) => LikedProductCart.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "likedProducts": List<dynamic>.from(likedProducts.map((x) => x.toJson())),
    };
}
class LikedProductCart {
    final Product productId;
    final String size;
    final String color;

    LikedProductCart({
        required this.productId,
        required this.size,
        required this.color,
    });

    factory LikedProductCart.fromJson(Map<String, dynamic> json) => LikedProductCart(
        productId: Product.fromJson(json["productId"]),
        size: json["size"],
        color: json["color"],
    );

    Map<String, dynamic> toJson() => {
        "productId": productId.toJson(),
        "size": size,
        "color": color,
    };
}

