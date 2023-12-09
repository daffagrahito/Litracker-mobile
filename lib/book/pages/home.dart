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

  @override
  void initState() {
    super.initState();
    futureBooks = fetchBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1000,
      color: Colors.blueGrey,
      child: FutureBuilder<List<Book>>(
        future: futureBooks,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: Image.network(
                      snapshot.data![index].fields.imageUrlL,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                    title: Text(snapshot.data![index].fields.title),
                    subtitle: Text(snapshot.data![index].fields.author),
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
    );
  }
}
