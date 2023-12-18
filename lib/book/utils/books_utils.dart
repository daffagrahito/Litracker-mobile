import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:litracker_mobile/book/models/book.dart';
import 'package:http/http.dart' as http;

Future<List<Book>> fetchBooks() async {
  var url = Uri.parse('http://localhost:8080/home/api/book/');
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

Future<Book> fetchBook(int bookId) async {
  var url = Uri.parse('http://localhost:8080/home/api/book/$bookId');
  var response = await http.get(
    url,
    headers: {
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));

  Book book = Book.fromJson(data);
  return book;
}

List<Book> filterBooks(List<Book> books, String query) {
  return books.where((book) {
    final title = book.fields.title.toLowerCase();
    final author = book.fields.author.toLowerCase();
    final searchLower = query.toLowerCase();

    return title.contains(searchLower) || author.contains(searchLower);
  }).toList();
}

void showDialogWithText(BuildContext context, String dialogText) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(
        dialogText,
        style: const TextStyle(
          fontFamily: 'SF-Pro',
          fontWeight: FontWeight.w700,
          letterSpacing: -1,
          fontSize: 16,
          color: Color.fromRGBO(8, 4, 22, 1),
        ),
      ),
      backgroundColor: Colors.white,
      buttonPadding: const EdgeInsets.all(16),
      contentPadding: const EdgeInsets.only(
        bottom: 40,
        left: 24,
        top: 12,
      ),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: const Color.fromRGBO(72, 22, 236, 1),
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 20,
            ),
          ),
          child: const Text(
            'OK',
            style: TextStyle(
              fontFamily: 'SF-Pro',
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    ),
  );
}

Future<void> deleteBook(int pk) async {
  var url = Uri.parse('http://localhost:8080/home/api/book/delete/$pk/');
  var response = await http.delete(url);

  if (response.statusCode != 200) {
    throw Exception('Failed to delete book.');
  }
}

Widget buildTextField(TextEditingController controller, String labelText, {bool isInteger = false}) {
  return Column(
    children: <Widget>[
      const SizedBox(height: 10),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: const Color.fromRGBO(246, 247, 249, 1),
        ),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: const TextStyle(
              fontFamily: 'SF-Pro',
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(132, 151, 172, 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromRGBO(92, 66, 255, 1),
              ),
              borderRadius: BorderRadius.circular(12.0),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Field ini tidak boleh kosong!';
            }
            if (isInteger && int.tryParse(value) == null || int.tryParse(value)! < 0) {
              return 'Field ini harus berupa angka!';
            }
            return null;
          },
        ),
      ),
      const SizedBox(height: 10), // Add gap antar textfields
    ],
  );
}
