// To parse this JSON data, do
//
//     final readingHstory = readingHstoryFromJson(jsonString);

import 'dart:convert';

ReadingHstory readingHstoryFromJson(String str) =>
    ReadingHstory.fromJson(json.decode(str));

String readingHstoryToJson(ReadingHstory data) => json.encode(data.toJson());

class ReadingHstory {
  List<ReadingHistory> readingHistories;

  ReadingHstory({
    required this.readingHistories,
  });

  factory ReadingHstory.fromJson(Map<String, dynamic> json) => ReadingHstory(
        readingHistories: List<ReadingHistory>.from(
            json["reading_histories"].map((x) => ReadingHistory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "reading_histories":
            List<dynamic>.from(readingHistories.map((x) => x.toJson())),
      };
}

class ReadingHistory {
  int id;
  int bookId;
  String bookTitle;
  String bookAuthor;
  String username;
  int lastPage;
  DateTime dateOpened;

  ReadingHistory({
    required this.id,
    required this.bookId,
    required this.bookTitle,
    required this.bookAuthor,
    required this.username,
    required this.lastPage,
    required this.dateOpened,
  });

  factory ReadingHistory.fromJson(Map<String, dynamic> json) => ReadingHistory(
        id: json["id"],
        bookId: json["book_id"],
        bookTitle: json["book_title"],
        bookAuthor: json["book_author"],
        username: json["username"],
        lastPage: json["last_page"],
        dateOpened: DateTime.parse(json["date_opened"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "book_id": bookId,
        "book_title": bookTitle,
        "book_author": bookAuthor,
        "username": username,
        "last_page": lastPage,
        "date_opened":
            "${dateOpened.year.toString().padLeft(4, '0')}-${dateOpened.month.toString().padLeft(2, '0')}-${dateOpened.day.toString().padLeft(2, '0')}",
      };
}
