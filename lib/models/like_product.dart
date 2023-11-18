class LikedProduct {
    final String? productId;
    final String? size;
    final String? color;

    LikedProduct({
        this.productId,
        this.size,
        this.color,
    });

    factory LikedProduct.fromJson(Map<String, dynamic> json) => LikedProduct(
        productId: json["productId"],
        size: json["size"],
        color: json["color"],
    );

    Map<String, dynamic> toJson() => {
        "productId": productId,
        "size": size,
        "color": color,
    };
}