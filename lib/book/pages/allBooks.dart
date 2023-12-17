// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:litracker_mobile/book/models/book.dart';
import 'package:litracker_mobile/book/pages/book_details.dart';
import 'package:litracker_mobile/book/utils/books_utils.dart';
import 'package:litracker_mobile/pages/user/utils/color_choice.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class AllBooks extends StatefulWidget {
  const AllBooks({super.key});

  @override
  State<AllBooks> createState() => _AllBooks();
}

class _AllBooks extends State<AllBooks> {
  late Future<List<Book>> futureBooks;
  TextEditingController searchController = TextEditingController();
  bool showAllBooks = false;

  late PageController _controller;
  //int _currentIndex = 0;
  List<Book>? filteredBooks;
  bool isVoted = false;

  Future<int> fetchTotalUsersVote(bookID) async {
    final requestTotalUsers =
        Provider.of<CookieRequest>(context, listen: false);
    final responseUsersVote = await requestTotalUsers
        .get('http://localhost:8080/upvote_book/get_upvoting_users/${bookID}');

    return responseUsersVote['total_users_upvote'];
  }

  Future<bool> fetchHasUserUpvoted(bookID) async {
    final requestTotalUsers =
        Provider.of<CookieRequest>(context, listen: false);
    final responseUsersVote = await requestTotalUsers
        .get('http://localhost:8080/upvote_book/get_upvoting_users/${bookID}');

    return responseUsersVote['isUpvote'];
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kashmirBlue50,
      body: SingleChildScrollView(
        child: Container(
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
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Image.asset(
                              "assets/home/back-to-home.png",
                              width: 44,
                              height: 44,
                              fit: BoxFit.contain,
                            ),
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
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 20),
                            decoration: BoxDecoration(
                                color: jaguar400,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16))),
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
                                          filteredBooks =
                                              filterBooks(books, value);
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
                                searchController
                                    .clear(); // Clear the search text
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
                  ],
                ),
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
                          : filteredBooks.length;

                      return Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 24, horizontal: 40),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Visibility(
                                    child: searchController.text.isEmpty
                                        ? Text("Semua Buku",
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
                                          builder: (context) =>
                                              BookDetailPage(book: book),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(12),
                                      margin: EdgeInsets.only(bottom: 8),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12)),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(4),
                                                  bottomLeft:
                                                      Radius.circular(4),
                                                  topRight: Radius.circular(12),
                                                  bottomRight:
                                                      Radius.circular(12)),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(4),
                                                    bottomLeft:
                                                        Radius.circular(4),
                                                    topRight:
                                                        Radius.circular(6),
                                                    bottomRight:
                                                        Radius.circular(6)),
                                                child: Image.network(
                                                  book.fields.imageUrlL.replaceFirst(
                                                      "http://images.amazon.com/",
                                                      "https://m.media-amazon.com/"),
                                                  width: 50,
                                                  height: 60,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 12,
                                          ),
                                          Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  272,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    book.fields.title,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                        fontFamily: 'SF-Pro',
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: jaguar950),
                                                  ),
                                                  SizedBox(
                                                    height: 4,
                                                  ),
                                                  Text(
                                                    book.fields.author,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                      color: kashmirBlue400,
                                                      fontFamily: 'SF-Pro',
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  )
                                                ],
                                              )),
                                          Row(
                                            children: [
                                              GestureDetector(
                                                  // Inside the onTap method for upvote
                                                  // Inside the onTap method for upvote
                                                  onTap: () async {
                                                    final requestToggleUpvote =
                                                        Provider.of<
                                                                CookieRequest>(
                                                            context,
                                                            listen: false);
                                                    final response =
                                                        await requestToggleUpvote
                                                            .post(
                                                                "http://localhost:8080/upvote_book/toggle_upvote_flutter/${book.pk}/",
                                                                {});

                                                    // Check if the book is upvoted or unvoted

                                                    String message =
                                                        response['message'];
                                                    // int total_votes =
                                                    //     response['total_votes'];
                                                    if (message == 'Upvoted' ||
                                                        message == 'Unvoted') {
                                                      setState(() {
                                                        if (message ==
                                                            'Upvoted') {
                                                          // isVoted = true;
                                                          // totalUpvotedBookbyUser =
                                                          //     total_votes;
                                                          fetchTotalUsersVote(
                                                              book.pk);
                                                        } else {
                                                          // isVoted = false;
                                                          fetchTotalUsersVote(
                                                              book.pk);
                                                        }
                                                      });
                                                    }
                                                  },
                                                  child: Container(
                                                    child: FutureBuilder<bool>(
                                                      future:
                                                          fetchHasUserUpvoted(
                                                              book.pk),
                                                      builder:
                                                          (context, snapshot) {
                                                        if (snapshot
                                                                .connectionState ==
                                                            ConnectionState
                                                                .waiting) {
                                                          return CircularProgressIndicator();
                                                        } else if (snapshot
                                                            .hasError) {
                                                          return Text(
                                                              'Error: ${snapshot.error}');
                                                        } else {
                                                          isVoted =
                                                              snapshot.data!;
                                                          return Image.asset(
                                                            isVoted
                                                                ? "assets/home/upvote_fill.png"
                                                                : "assets/home/upvote_blank.png",
                                                            width: 40,
                                                            height: 40,
                                                          );
                                                        }
                                                      },
                                                    ),
                                                  )),
                                              SizedBox(
                                                width: 4,
                                              ),
                                              Image.asset(
                                                "assets/home/wishlist-blank.png",
                                                width: 40,
                                                height: 40,
                                              ),
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
          ),
        ),
      ),
    );
  }
}
