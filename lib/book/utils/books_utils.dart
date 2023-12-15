import 'dart:convert';

import 'package:litracker_mobile/book/models/book.dart';
import 'package:http/http.dart' as http;

Future<List<Book>> fetchBooks() async {
  var url = Uri.parse('http://localhost:8080/api/book');
  var response = await http.get(
    url,
    headers: {
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<Book> books = [];
  for (var d in data) {
    if (d != null) {
      Book book = Book.fromJson(d);
      books.add(book);
    }
  }
  return books;
}

List<Book> filterBooks(List<Book> books, String query) {
  return books.where((book) {
    final title = book.fields.title.toLowerCase();
    final author = book.fields.author.toLowerCase();
    final searchLower = query.toLowerCase();

    return title.contains(searchLower) || author.contains(searchLower);
  }).toList();
}
