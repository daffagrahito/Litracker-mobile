// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:litracker_mobile/book/models/book.dart';
import 'package:litracker_mobile/book/widgets/popular_book_card.dart';
import 'package:litracker_mobile/book/widgets/search_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';

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

class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  late Future<List<Book>> futureBooks;
  TextEditingController searchController = TextEditingController();
  bool showAllBooks = false;

  late PageController _controller;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      viewportFraction: 0.8, // This controls the size of the pages
      initialPage: 0,
    );
    futureBooks = fetchBooks();
  }

  @override
  void dispose() {
    _controller.dispose(); // Don't forget to dispose of the controller
    super.dispose();
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
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Text('No books found');
                }
                // Make sure we have more than one book to enable scrolling
                if (snapshot.data!.length <= 1) {
                  return Text('Not enough books to scroll');
                }
                return Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 15.0),
                        child: Text(
                          'Buku Terpopuler',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                      ),
                    ),
                    CarouselSlider.builder(
                      itemCount: min(3, snapshot.data!.length),
                      itemBuilder: (context, index, realIdx) {
                        return PopularBookCard(
                          book: snapshot.data![index],
                          rank: index + 1,
                          totalUpvotes: 1604,
                        );
                      },
                      options: CarouselOptions(
                        height: 200,
                        enableInfiniteScroll: false,
                        viewportFraction: 1.0,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                      ),
                    ),
                    DotsIndicator(
                      dotsCount: min(3, snapshot.data!.length),
                      position: _currentIndex.toInt(),
                      decorator: DotsDecorator(
                        activeColor: Colors.black,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    'Daftar Buku',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.grey),
                  ),
                ),
                if (!showAllBooks)
                  TextButton(
                    child: Text('Show More'),
                    onPressed: () {
                      setState(() {
                        showAllBooks = true;
                      });
                    },
                  ),
              ],
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

                int bookCount = showAllBooks ? filteredBooks.length : min(6, filteredBooks.length);

                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: bookCount,
                  itemBuilder: (context, index) {
                    Book book = filteredBooks[index];
                    return Container(
                      width: 200, // Set the width of the card
                      child: Card(
                        margin: EdgeInsets.all(5),
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          alignment: Alignment.topCenter,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                                child: Image.network(
                                  book.fields.imageUrlL,
                                  width: 150,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                insertNewLines(book.fields.title),
                                textAlign: TextAlign.center,
                                style: TextStyle(color: textColor),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                              Text(book.fields.author, style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                        ),
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

String insertNewLines(String text) {
  int insertAfter = 20;
  return text.replaceAllMapped(RegExp('.{1,$insertAfter}'), (match) => '${match.group(0)}');
}