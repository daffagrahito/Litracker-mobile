// To parse this JSON data, do
//
//     final review = reviewFromJson(jsonString);

import 'dart:convert';

List<Review> reviewFromJson(String str) => List<Review>.from(json.decode(str).map((x) => Review.fromJson(x)));

String reviewToJson(List<Review> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Review {
  int book;
  int user;
  String text;
  DateTime datePosted;

  Review({
    required this.book,
    required this.user,
    required this.text,
    required this.datePosted,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        book: json["book"],
        user: json["user"],
        text: json["text"],
        datePosted: DateTime.parse(json["date_posted"]),
      );

  Map<String, dynamic> toJson() => {
        "book": book,
        "user": user,
        "text": text,
        "date_posted": datePosted.toIso8601String(),
      };
}
