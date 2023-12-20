// To parse this JSON data, do
//
//     final reviewWithoutRating = reviewWithoutRatingFromJson(jsonString);

import 'dart:convert';

ReviewWithoutRating reviewWithoutRatingFromJson(String str) =>
    ReviewWithoutRating.fromJson(json.decode(str));

String reviewWithoutRatingToJson(ReviewWithoutRating data) =>
    json.encode(data.toJson());

class ReviewWithoutRating {
  List<ReviewWithoutRatingReview> reviews;

  ReviewWithoutRating({
    required this.reviews,
  });

  factory ReviewWithoutRating.fromJson(Map<String, dynamic> json) =>
      ReviewWithoutRating(
        reviews: List<ReviewWithoutRatingReview>.from(
            json["reviews"].map((x) => ReviewWithoutRatingReview.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
      };
}

class ReviewWithoutRatingReview {
  int id;
  String title;
  String author;
  String image;
  List<ReviewReview> reviews;
  int totalReviews;
  String formattedTimestamp;

  ReviewWithoutRatingReview({
    required this.id,
    required this.title,
    required this.author,
    required this.image,
    required this.reviews,
    required this.totalReviews,
    required this.formattedTimestamp,
  });

  factory ReviewWithoutRatingReview.fromJson(Map<String, dynamic> json) =>
      ReviewWithoutRatingReview(
        id: json["id"],
        title: json["title"],
        author: json["author"],
        image: json["image"],
        reviews: List<ReviewReview>.from(
            json["reviews"].map((x) => ReviewReview.fromJson(x))),
        totalReviews: json["total_reviews"],
        formattedTimestamp: json["formatted_timestamp"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "author": author,
        "image": image,
        "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
        "total_reviews": totalReviews,
        "formatted_timestamp": formattedTimestamp,
      };
}

class ReviewReview {
  int id;
  String username;
  String comment;
  DateTime timestamp;

  ReviewReview({
    required this.id,
    required this.username,
    required this.comment,
    required this.timestamp,
  });

  factory ReviewReview.fromJson(Map<String, dynamic> json) => ReviewReview(
        id: json["id"],
        username: json["username"],
        comment: json["comment"],
        timestamp: DateTime.parse(json["timestamp"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "comment": comment,
        "timestamp": timestamp.toIso8601String(),
      };
}
