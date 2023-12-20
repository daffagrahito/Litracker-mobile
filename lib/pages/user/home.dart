// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:litracker_mobile/book/pages/allBooks.dart';
import 'dart:math';
import 'package:litracker_mobile/book/models/book.dart';
import 'package:litracker_mobile/book/pages/book_details.dart';
import 'package:litracker_mobile/book/utils/books_utils.dart';
import 'package:litracker_mobile/book/widgets/popularBookCard.dart';
import 'package:litracker_mobile/pages/user/utils/color_choice.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent>
    with TickerProviderStateMixin {
  late Future<List<Book>> futureBooks = fetchBooks();
  TextEditingController searchController = TextEditingController();
  bool showAllBooks = false;

  late PageController _controller;
  //int _currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  List<Book>? filteredBooks;

  int totalOnReading = 0;

  bool isVoted = false;
  int totalUpvotedBookbyUser = 0;
  bool isWishlisted = false;
  int totalWishlistedBookbyUser = 0;

  Future<void> _refreshData() async {
    setState(() {
      futureBooks = fetchBooks(); // Refresh the book list
      _shuffleBooks(); // Shuffle the book list
    });
  }

  void _shuffleBooks() {
    futureBooks = futureBooks.then((books) {
      List<Book> shuffledBooks = List.from(books);
      shuffledBooks.shuffle();
      return shuffledBooks;
    });
  }

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

  Future<int> fetchTotalUsersWishlist(bookID) async {
    final requestTotalUsers =
        Provider.of<CookieRequest>(context, listen: false);
    final responseUsersWishlist = await requestTotalUsers.get(
        'http://localhost:8080/favorite_book/get_wishlisting_users/${bookID}');

    return responseUsersWishlist['total_users_wishlist'];
  }

  Future<bool> fetchHasUserWishlisted(bookID) async {
    final requestTotalUsers =
        Provider.of<CookieRequest>(context, listen: false);
    final responseUsersWishlist = await requestTotalUsers.get(
        'http://localhost:8080/favorite_book/get_wishlisting_users/${bookID}');

    return responseUsersWishlist['isWishlist'];
  }

  Future<int> fetchTotalOnReading() async {
    final requestTotalReading =
        Provider.of<CookieRequest>(context, listen: false);
    final responseTotalReading = await requestTotalReading
        .get('http://localhost:8080/reading_history/get_all_reading_history/');

    return responseTotalReading['total_on_reading'];
  }

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      viewportFraction: 0.8,
      initialPage: 0,
    );
    futureBooks = fetchBooks(); // Initialize futureBooks here
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final jaguar400 = Color.fromRGBO(110, 101, 255, 1);

    return RefreshIndicator(
      onRefresh: _refreshData,
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
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
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 12),
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
                                FutureBuilder<int>(
                                  future: fetchTotalOnReading(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return CircularProgressIndicator();
                                    } else if (snapshot.hasError) {
                                      return Text('Error: ${snapshot.error}');
                                    } else {
                                      totalOnReading = snapshot.data!;
                                      return Text(
                                        totalOnReading.toString(),
                                        style: TextStyle(
                                            fontFamily: 'SF-Pro',
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600,
                                            color: jaguar950),
                                      );
                                    }
                                  },
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
                    height: 340,
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      children: List.generate(
                        10, // or the total number of indices you have
                        (index) => PopularBookCard(index: index),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10), // Spasi antara PageView dan Indicator

                Visibility(
                    visible: searchController.text.isEmpty,
                    child: _buildIndicator()),
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
                    List<Book> filteredBooks =
                        filterBooks(snapshot.data!, searchController.text);

                    int numBooksToShow = showAllBooks
                        ? filteredBooks.length
                        : (searchController.text.isEmpty
                            ? min(5, filteredBooks.length)
                            : filteredBooks.length);

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
                                            color: jaguar400,
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
                          SizedBox(height: 20),
                          Visibility(
                            visible: searchController.text.isEmpty,
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16))),
                              child: Container(
                                width: MediaQuery.of(context).size.width - 76,
                                margin: EdgeInsets.symmetric(horizontal: 12),
                                padding: EdgeInsets.symmetric(vertical: 16),
                                decoration: BoxDecoration(
                                    color: jaguar600,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16))),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _refreshData();
                                    });
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        "assets/home/refresh.png",
                                        width: 24,
                                        height: 24,
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        "Segarkan",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontFamily: 'SF-Pro',
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
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
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(12)),
                                    ),
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topLeft: Radius.circular(4),
                                                    topRight:
                                                        Radius.circular(6),
                                                    bottomLeft:
                                                        Radius.circular(4),
                                                    bottomRight:
                                                        Radius.circular(6)),
                                            child: Image.network(
                                              book.fields.imageUrlL.replaceFirst(
                                                  "http://images.amazon.com/",
                                                  "https://m.media-amazon.com/"),
                                              width: 50,
                                              height: 60,
                                              fit: BoxFit.cover,
                                              errorBuilder:
                                                  (BuildContext context,
                                                      Object exception,
                                                      StackTrace? stackTrace) {
                                                // Handle image loading error
                                                return Text(
                                                    'Could not load image');
                                              },
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
                                                    fontWeight: FontWeight.w400,
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
                                                    future: fetchHasUserUpvoted(
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
                                              width: 8,
                                            ),
                                            GestureDetector(
                                                onTap: () async {
                                                  final requestToggleWishlist =
                                                      Provider.of<
                                                              CookieRequest>(
                                                          context,
                                                          listen: false);
                                                  final response =
                                                      await requestToggleWishlist
                                                          .post(
                                                              "http://localhost:8080/favorite_book/toggle_wishlist_flutter/${book.pk}/",
                                                              {});

                                                  String message =
                                                      response['message'];
                                                  if (message == 'Wishlisted' ||
                                                      message ==
                                                          'Unwishlisted') {
                                                    setState(() {
                                                      if (message ==
                                                          'Wishlisted') {
                                                        fetchTotalUsersWishlist(
                                                            book.pk);
                                                      } else {
                                                        fetchTotalUsersWishlist(
                                                            book.pk);
                                                      }
                                                    });
                                                  }
                                                },
                                                child: Container(
                                                  child: FutureBuilder<bool>(
                                                    future:
                                                        fetchHasUserWishlisted(
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
                                                        isWishlisted =
                                                            snapshot.data!;
                                                        return Image.asset(
                                                          isWishlisted
                                                              ? "assets/home/wishlist_fill.png"
                                                              : "assets/home/wishlist_blank.png",
                                                          width: 40,
                                                          height: 40,
                                                        );
                                                      }
                                                    },
                                                  ),
                                                )),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                          SizedBox(
                            height: 48,
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            )
          ],
        )),
      ),
    );
  }

  Widget _buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(10, (int index) {
        return Column(
          children: [
            Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentPage == index ? jaguar500 : kashmirBlue300,
              ),
            ),
            SizedBox(
              height: 8,
            )
          ],
        );
      }),
    );
  }
}
