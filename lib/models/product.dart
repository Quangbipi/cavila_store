import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));
String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
    final String id;
    final String name;
    final String category;
    final String description;
    final int price;
    final int quantity;
    final List<String> sizes;
    final List<String> colors;
    final int rate;
    final List<String> images;
    final List<dynamic> vouchers;
    final int numberOfReviews;
    final List<Comment> comments;
    final int v;
    final String gender;

    Product({
        required this.id,
        required this.name,
        required this.category,
        required this.description,
        required this.price,
        required this.quantity,
        required this.sizes,
        required this.colors,
        required this.rate,
        required this.images,
        required this.vouchers,
        required this.numberOfReviews,
        required this.comments,
        required this.v,
        required this.gender,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["_id"],
        name: json["name"],
        category: json["category"],
        description: json["description"],
        price: json["price"],
        quantity: json["quantity"],
        sizes: List<String>.from(json["sizes"].map((x) => x)),
        colors: List<String>.from(json["colors"].map((x) => x)),
        rate: json["rate"],
        images: List<String>.from(json["images"].map((x) => x)),
        vouchers: List<dynamic>.from(json["vouchers"].map((x) => x)),
        numberOfReviews: json["numberOfReviews"],
        comments:  List<Comment>.from(json["comments"].map((x) => Comment.fromJson(x))),
        v: json["__v"],
        gender: json["gender"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "category": category,
        "description": description,
        "price": price,
        "quantity": quantity,
        "sizes": List<dynamic>.from(sizes.map((x) => x)),
        "colors": List<dynamic>.from(colors.map((x) => x)),
        "rate": rate,
        "images": List<dynamic>.from(images.map((x) => x)),
        "vouchers": List<dynamic>.from(vouchers.map((x) => x)),
        "numberOfReviews": numberOfReviews,
        "comments": List<dynamic>.from(comments.map((x) => x)),
        "__v": v,
        "gender": gender,
       
    };
}

class Comment {
    final String userName;
    final int rating;
    final String comment;
    final String userId;
    final DateTime commentCreatedAt;
    final String id;
    final DateTime createdAt;
    final DateTime updatedAt;

    Comment({
        required this.userName,
        required this.rating,
        required this.comment,
        required this.userId,
        required this.commentCreatedAt,
        required this.id,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        userName: json["userName"],
        rating: json["rating"],
        comment: json["comment"],
        userId: json["userId"],
        commentCreatedAt: DateTime.parse(json["created_at"]),
        id: json["_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "userName": userName,
        "rating": rating,
        "comment": comment,
        "userId": userId,
        "created_at": commentCreatedAt.toIso8601String(),
        "_id": id,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}