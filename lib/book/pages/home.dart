// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:litracker_mobile/book/models/book.dart';

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

// Contoh Warna
const Color searchBarColor = Color(0xFFE6EFF2);
const Color textColor = Colors.black;

// CustomSearchBar Widget
class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const CustomSearchBar({
    Key? key,
    required this.controller,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Calculate the size of the screen (or parent widget)
    var screenSize = MediaQuery.of(context).size;

    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        // Custom background shape
        Container(
          height: 140, // Adjust the height to fit your design
          width: screenSize.width,
          decoration: BoxDecoration(
            color: Color.fromRGBO(81, 33, 255, 1), // Use your primary color
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
        ),
        // Positioned TextField
        Positioned(
          top: 60, // Adjust the position to match your design
          child: Container(
            width: screenSize.width * 0.8, // Width is 80% of the screen width
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              style: TextStyle(color: textColor),
              decoration: InputDecoration(
                hintText: "Cari Buku",
                prefixIcon: Icon(Icons.search, color: textColor),
                fillColor: searchBarColor,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}


class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  late Future<List<Book>> futureBooks;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    futureBooks = fetchBooks();
  }

  List<Book> filterBooks(List<Book> books, String query) {
    return books.where((book) {
      final title = book.fields.title.toLowerCase();
      final author = book.fields.author.toLowerCase();
      final searchLower = query.toLowerCase();

      return title.contains(searchLower) || author.contains(searchLower);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1000,
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: CustomSearchBar(
              controller: searchController,
              onChanged: (value) {
                setState(() {
                  futureBooks = fetchBooks();
                });
              },
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Book>>(
              future: futureBooks,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text("No books found"));
                }

                List<Book> filteredBooks = filterBooks(snapshot.data!, searchController.text);

                return ListView.builder(
                  itemCount: filteredBooks.length,
                  itemBuilder: (context, index) {
                    Book book = filteredBooks[index];
                    return Card(
                      margin: EdgeInsets.all(5),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(8),
                        leading: Image.network(
                          book.fields.imageUrlL,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                        title: Text(book.fields.title, style: TextStyle(color: textColor)),
                        subtitle: Text(book.fields.author, style: TextStyle(color: Colors.grey)),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
