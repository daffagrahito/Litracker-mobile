// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
    List<History> history;

    Product({
        required this.history,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        history: List<History>.from(json["history"].map((x) => History.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "history": List<dynamic>.from(history.map((x) => x.toJson())),
    };
}

class History {
    int userId;
    int bookId;
    int lastPage;
    DateTime dateOpened;

    History({
        required this.userId,
        required this.bookId,
        required this.lastPage,
        required this.dateOpened,
    });

    factory History.fromJson(Map<String, dynamic> json) => History(
        userId: json["user_id"],
        bookId: json["book_id"],
        lastPage: json["last_page"],
        dateOpened: DateTime.parse(json["date_opened"]),
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "book_id": bookId,
        "last_page": lastPage,
        "date_opened": dateOpened.toIso8601String(),
    };
}
