// To parse this JSON data, do
//
//     final readingHistory = readingHistoryFromJson(jsonString);

import 'dart:convert';

List<ReadingHistory> readingHistoryFromJson(String str) => List<ReadingHistory>.from(json.decode(str).map((x) => ReadingHistory.fromJson(x)));

String readingHistoryToJson(List<ReadingHistory> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReadingHistory {
  int user;
  int book;
  int lastPage;
  DateTime dateOpened;

  ReadingHistory({
    required this.user,
    required this.book,
    required this.lastPage,
    required this.dateOpened,
  });

  factory ReadingHistory.fromJson(Map<String, dynamic> json) => ReadingHistory(
        user: json["user"],
        book: json["book"],
        lastPage: json["last_page"],
        dateOpened: DateTime.parse(json["date_opened"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "book": book,
        "last_page": lastPage,
        "date_opened": dateOpened.toIso8601String(),
      };
}
