// To parse this JSON data, do
//
//     final reviewWithoutTimestamp = reviewWithoutTimestampFromJson(jsonString);

import 'dart:convert';

ReviewWithoutTimestamp reviewWithoutTimestampFromJson(String str) =>
    ReviewWithoutTimestamp.fromJson(json.decode(str));

String reviewWithoutTimestampToJson(ReviewWithoutTimestamp data) =>
    json.encode(data.toJson());

class ReviewWithoutTimestamp {
  List<ReviewWithoutTimestampReview> reviews;

  ReviewWithoutTimestamp({
    required this.reviews,
  });

  factory ReviewWithoutTimestamp.fromJson(Map<String, dynamic> json) =>
      ReviewWithoutTimestamp(
        reviews: List<ReviewWithoutTimestampReview>.from(json["reviews"]
            .map((x) => ReviewWithoutTimestampReview.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
      };
}

class ReviewWithoutTimestampReview {
  int id;
  String title;
  String author;
  String image;
  List<ReviewReview> reviews;
  int totalReviews;
  int averageRating;

  ReviewWithoutTimestampReview({
    required this.id,
    required this.title,
    required this.author,
    required this.image,
    required this.reviews,
    required this.totalReviews,
    required this.averageRating,
  });

  factory ReviewWithoutTimestampReview.fromJson(Map<String, dynamic> json) =>
      ReviewWithoutTimestampReview(
        id: json["id"],
        title: json["title"],
        author: json["author"],
        image: json["image"],
        reviews: List<ReviewReview>.from(
            json["reviews"].map((x) => ReviewReview.fromJson(x))),
        totalReviews: json["total_reviews"],
        averageRating: json["average_rating"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "author": author,
        "image": image,
        "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
        "total_reviews": totalReviews,
        "average_rating": averageRating,
      };
}

class ReviewReview {
  int id;
  String username;
  String comment;
  int rating;

  ReviewReview({
    required this.id,
    required this.username,
    required this.comment,
    required this.rating,
  });

  factory ReviewReview.fromJson(Map<String, dynamic> json) => ReviewReview(
        id: json["id"],
        username: json["username"],
        comment: json["comment"],
        rating: json["rating"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "comment": comment,
        "rating": rating,
      };
}
