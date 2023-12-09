import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:litracker_mobile/book/models/book.dart';

Future<List<Book>> fetchBooks() async {
  var url = Uri.parse('http://localhost:8000/api/book');
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
      color: Colors.blueGrey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                setState(() {
                  // Trigger rebuild when the text in the search bar changes
                  futureBooks = fetchBooks(); // Reset the Future
                });
              },
              decoration: InputDecoration(
                labelText: 'Search Books',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Book>>(
              future: futureBooks,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Book> filteredBooks =
                      filterBooks(snapshot.data!, searchController.text);
                  return ListView.builder(
                    itemCount: filteredBooks.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          leading: Image.network(
                            filteredBooks[index].fields.imageUrlL,
                            width: 50,
                            fit: BoxFit.cover,
                          ),
                          title: Text(filteredBooks[index].fields.title),
                          subtitle: Text(filteredBooks[index].fields.author),
                        ),
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return CircularProgressIndicator();
              },
            ),
          ),
        ],
      ),
    );
  }
}
