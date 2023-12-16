// To parse this JSON data, do
//
//     final topBook = topBookFromJson(jsonString);

import 'dart:convert';

TopBook topBookFromJson(String str) => TopBook.fromJson(json.decode(str));

String topBookToJson(TopBook data) => json.encode(data.toJson());

class TopBook {
  List<TopBookElement> topBooks;

  TopBook({
    required this.topBooks,
  });

  factory TopBook.fromJson(Map<String, dynamic> json) => TopBook(
        topBooks: List<TopBookElement>.from(
            json["top_books"].map((x) => TopBookElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "top_books": List<dynamic>.from(topBooks.map((x) => x.toJson())),
      };
}

class TopBookElement {
  int bookId;
  String title;
  String author;
  int totalUpvotes;
  String latestUpvoteTime;

  TopBookElement({
    required this.bookId,
    required this.title,
    required this.author,
    required this.totalUpvotes,
    required this.latestUpvoteTime,
  });

  factory TopBookElement.fromJson(Map<String, dynamic> json) => TopBookElement(
        bookId: json["book_id"],
        title: json["title"],
        author: json["author"],
        totalUpvotes: json["total_upvotes"],
        latestUpvoteTime: json["latest_upvote_time"],
      );

  Map<String, dynamic> toJson() => {
        "book_id": bookId,
        "title": title,
        "author": author,
        "total_upvotes": totalUpvotes,
        "latest_upvote_time": latestUpvoteTime,
      };
}
