import 'dart:convert';

OrderData orderDataFromJson(String str) => OrderData.fromJson(json.decode(str));

String orderDataToJson(OrderData data) => json.encode(data.toJson());

class OrderData {
    final bool success;
    final List<OrderModel> data;

    OrderData({
        required this.success,
        required this.data,
    });

    factory OrderData.fromJson(Map<String, dynamic> json) => OrderData(
        success: json["success"],
        data: List<OrderModel>.from(json["data"].map((x) => OrderModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class OrderModel {
    final String id;
    final String userId;
    final int isConfirm;
    final List<ProductElement> products;
    final dynamic voucher;
    final int finalPrice;
    final DateTime createdAt;
    final DateTime updatedAt;
    final int v;

    OrderModel({
        required this.id,
        required this.userId,
        required this.isConfirm,
        required this.products,
        required this.voucher,
        required this.finalPrice,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json["_id"],
        userId: json["user_id"],
        isConfirm: json["isConfirm"],
        products: List<ProductElement>.from(json["products"].map((x) => ProductElement.fromJson(x))),
        voucher: json["voucher"],
        finalPrice: json["finalPrice"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "user_id": userId,
        "isConfirm": isConfirm,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "voucher": voucher,
        "finalPrice": finalPrice,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}

class ProductElement {
    final ProductProduct? product;
    final int quantity;
    final String size;
    final String color;
    final String id;

    ProductElement({
        required this.product,
        required this.quantity,
        required this.size,
        required this.color,
        required this.id,
    });

    factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
        product: json["product"] == null ? null : ProductProduct.fromJson(json["product"]),
        quantity: json["quantity"],
        size: json["size"],
        color: json["color"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "product": product?.toJson(),
        "quantity": quantity,
        "size": size,
        "color": color,
        "_id": id,
    };
}

class ProductProduct {
    final String id;
    final String name;
    final int price;

    ProductProduct({
        required this.id,
        required this.name,
        required this.price,
    });

    factory ProductProduct.fromJson(Map<String, dynamic> json) => ProductProduct(
        id: json["_id"],
        name: json["name"],
        price: json["price"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "price": price,
    };
}