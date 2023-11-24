import 'dart:convert';

PaymentModel paymentModelFromJson(String str) =>
    PaymentModel.fromJson(json.decode(str));

String paymentModelToJson(PaymentModel data) => json.encode(data.toJson());

class PaymentModel {
  final String idUser;
  final List<ProductSelect> products;
  final String voucherId;
  final int finalPrice;

  PaymentModel({
    required this.idUser,
    required this.products,
    required this.voucherId,
    required this.finalPrice,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) => PaymentModel(
        idUser: json["idUser"],
        products: List<ProductSelect>.from(
            json["products"].map((x) => ProductSelect.fromJson(x))),
        voucherId: json["voucherId"],
        finalPrice: json["finalPrice"],
      );

  Map<String, dynamic> toJson() => {
        "idUser": idUser,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "voucherId": voucherId,
        "finalPrice": finalPrice,
      };
}

class ProductSelect {
  final String idProduct;
  final int quantity;
  final String size;
  final String color;

  ProductSelect({
    required this.idProduct,
    required this.quantity,
    required this.size,
    required this.color,
  });

  factory ProductSelect.fromJson(Map<String, dynamic> json) => ProductSelect(
        idProduct: json["idProduct"],
        quantity: json["quantity"],
        size: json["size"],
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "idProduct": idProduct,
        "quantity": quantity,
        "size": size,
        "color": color,
      };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductSelect &&
          runtimeType == other.runtimeType &&
          idProduct == other.idProduct;

  @override
  int get hashCode => idProduct.hashCode;
}
