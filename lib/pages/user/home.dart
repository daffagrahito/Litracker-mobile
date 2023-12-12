// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:litracker_mobile/book/pages/book_details.dart';
import 'package:litracker_mobile/pages/user/allBooks.dart';
import 'package:litracker_mobile/pages/user/history.dart';
import 'package:litracker_mobile/pages/user/navigate.dart';
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
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  late Future<List<Book>> futureBooks;
  TextEditingController searchController = TextEditingController();
  bool showAllBooks = false;

  late PageController _controller;
  int _currentIndex = 0;
  List<Book>? filteredBooks;

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      viewportFraction: 0.8,
      initialPage: 0,
    );
    futureBooks = fetchBooks();
  }

  @override
  void dispose() {
    _controller.dispose();
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
    final jaguar400 = Color.fromRGBO(110, 101, 255, 1);
    final jaguar500 = Color.fromRGBO(92, 66, 255, 1);
    final jaguar950 = Color.fromRGBO(8, 4, 22, 1);
    final ribbon400 = Color.fromRGBO(80, 166, 255, 1);
    final kashmirBlue50 = Color.fromRGBO(246, 247, 249, 1);
    final kashmirBlue100 = Color.fromRGBO(236, 239, 242, 1);
    final kashmirBlue300 = Color.fromRGBO(176, 187, 201, 1);
    final kashmirBlue400 = Color.fromRGBO(132, 151, 172, 1);
    final kashmirBlue600 = Color.fromRGBO(88, 107, 132, 1);

    return Container(
        child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
            color: jaguar500,
          ),
          padding: EdgeInsets.all(40),
          child: Column(
            children: [
              Row(
                children: [
                  Visibility(
                    visible: searchController.text.isEmpty,
                    child: Image.asset(
                      "assets/home/profile-picture.png",
                      width: 44,
                      height: 44,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Visibility(
                    visible: searchController.text.isEmpty,
                    child: SizedBox(
                      width: 16,
                    ),
                  ),
                  Container(
                      height: 44,
                      width: MediaQuery.of(context).size.width - 140,
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                      decoration: BoxDecoration(
                          color: jaguar400,
                          borderRadius: BorderRadius.all(Radius.circular(16))),
                      child: Row(
                        children: [
                          Image.asset("assets/home/search-icon.png"),
                          SizedBox(
                            width: 12,
                          ),
                          Flexible(
                            child: TextField(
                              controller: searchController,
                              onChanged: (value) {
                                setState(() {
                                  futureBooks.then((books) {
                                    filteredBooks = filterBooks(books, value);
                                  });
                                });
                              },
                              style: TextStyle(
                                fontFamily: "SF-Pro",
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                              ),
                              decoration: InputDecoration(
                                hintText: "Cari Buku",
                                hintStyle: TextStyle(
                                  fontFamily: "SF-Pro",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          )
                        ],
                      )),
                  Visibility(
                    visible: searchController.text.isNotEmpty,
                    child: SizedBox(
                      width: 16,
                    ),
                  ),
                  Visibility(
                    visible: searchController.text.isNotEmpty,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          searchController.clear(); // Clear the search text
                        });
                      },
                      child: Image.asset(
                        "assets/home/close-search.png",
                        width: 44,
                        height: 44,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: searchController.text.isEmpty,
                child: SizedBox(
                  height: 20,
                ),
              ),
              Visibility(
                visible: searchController.text.isEmpty,
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Progresmu",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'SF-Pro',
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Visibility(
                visible: searchController.text.isEmpty,
                child: SizedBox(
                  height: 20,
                ),
              ),
              Visibility(
                visible: searchController.text.isEmpty,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      color: Colors.white),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: ribbon400,
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                        child: Image.asset("assets/home/book-icon.png"),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 188,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "60",
                              style: TextStyle(
                                  fontFamily: 'SF-Pro',
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: jaguar950),
                            ),
                            Text(
                              "Buku dibaca",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                  fontFamily: 'SF-Pro',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: -0.5,
                                  color: kashmirBlue400),
                            )
                          ],
                        ),
                      ),
                      // GestureDetector(
                      //     onTap: () {
                      //       Navigator.of(context).push(MaterialPageRoute(
                      //           builder: (context) => const ));
                      //       Navigator.of(context).pop();
                      //     },
                      //     child: Image.asset("assets/home/right-arrow.png"))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Column(
          children: [
            Visibility(
              visible: searchController.text.isEmpty,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 24, horizontal: 40),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text("Buku Terpopuler",
                          style: TextStyle(
                              fontFamily: 'SF-Pro',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: kashmirBlue400)),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          color: Colors.white),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 4, horizontal: 12),
                                      decoration: BoxDecoration(
                                          color: jaguar500,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(16))),
                                      child: Row(
                                        children: [
                                          Image.asset("assets/home/king.png"),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Text(
                                            "1",
                                            style: TextStyle(
                                                fontFamily: 'SF-Pro',
                                                fontWeight: FontWeight.w600,
                                                fontSize: 24,
                                                color: Colors.white),
                                          )
                                        ],
                                      )),
                                  SizedBox(
                                    height: 24,
                                  ),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width - 184,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Nama Buku",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontFamily: 'SF-Pro',
                                              fontWeight: FontWeight.w600,
                                              color: jaguar950),
                                        ),
                                        Text(
                                          "Nama penulis",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'SF-Pro',
                                              fontWeight: FontWeight.w400,
                                              color: kashmirBlue400),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                                child: Image.asset(
                                  "assets/home/dummy-book.png",
                                  width: 72,
                                  height: 100,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                color: kashmirBlue50,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(24))),
                            child: Row(
                              children: [
                                Image.asset(
                                  "assets/home/upvote.png",
                                  width: 48,
                                  height: 48,
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width - 200,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "1604",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontFamily: 'SF-Pro',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            letterSpacing: -0.8,
                                            color: jaguar950),
                                      ),
                                      Text(
                                        "Total Upvote",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontFamily: 'SF-Pro',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300,
                                            color: kashmirBlue400),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Container(
          child: FutureBuilder<List<Book>>(
            future: futureBooks,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator(); // Show loading spinner while waiting for data
              } else if (snapshot.hasError) {
                return Text(
                    'Error: ${snapshot.error}'); // Show error message if there is an error
              } else {
                // Determine the number of books to show
                List<Book> filteredBooks =
                    filterBooks(snapshot.data!, searchController.text);

                int numBooksToShow = showAllBooks
                    ? filteredBooks.length
                    : (searchController.text.isEmpty
                        ? min(5, filteredBooks.length)
                        : filteredBooks.length);

                return Container(
                  padding: EdgeInsets.symmetric(vertical: 24, horizontal: 40),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Visibility(
                              child: searchController.text.isEmpty
                                  ? Text("Mungkin Kamu Tertarik",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontFamily: 'SF-Pro',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: kashmirBlue400))
                                  : Text(
                                      "Hasil Pencarian: ${filteredBooks.length} buku",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontFamily: 'SF-Pro',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: kashmirBlue400)),
                            ),
                          ),
                          if (!showAllBooks || snapshot.data!.length > 6)
                            Visibility(
                              visible: searchController.text.isEmpty,
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: TextButton(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const AllBooks()));
                                    },
                                    child: Text(
                                      "Lihat Semua",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontFamily: 'SF-Pro',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: jaguar500,
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      showAllBooks = true;
                                    });
                                  },
                                ),
                              ),
                            ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      ...filteredBooks.getRange(0, numBooksToShow).map(
                            (book) => GestureDetector(
                              onTap: () {
                                // Navigate to the detail page
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BookDetailPage(book: book),
                                  ),
                                );
                              },
                              child: Container(
                              padding: EdgeInsets.all(12),
                              margin: EdgeInsets.only(bottom: 8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          8.0), // Sesuaikan nilai sesuai kebutuhan Anda
                                      child: Image.network(
                                        book.fields.imageUrlL.replaceFirst(
                                            "http://", "https://"),
                                        width: 50,
                                        height: 60,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Container(
                                      width: MediaQuery.of(context).size.width -
                                          272,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            book.fields.title,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontFamily: 'SF-Pro',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: jaguar950),
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Text(
                                            book.fields.author,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: TextStyle(
                                              color: kashmirBlue400,
                                              fontFamily: 'SF-Pro',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )
                                        ],
                                      )),
                                  Row(
                                    children: [
                                      Image.asset(
                                          "assets/home/upvote-blank.png"),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Image.asset(
                                          "assets/home/wishlist-blank.png"),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              }
            },
          ),
        )
      ],
    ));
  }
}
