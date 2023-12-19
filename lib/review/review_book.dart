import 'package:flutter/material.dart';
import 'package:litracker_mobile/pages/user/utils/color_choice.dart';
import 'package:litracker_mobile/review/detailReview.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class BookReviewWithoutRating {
  final int id;
  final String title;
  final String author;
  final String image;
  final List<ReviewWithoutRating> reviews;
  final String formattedTimestamp;

  BookReviewWithoutRating({
    required this.id,
    required this.title,
    required this.reviews,
    required this.author,
    required this.image,
    required this.formattedTimestamp,
  });
}

class ReviewWithoutRating {
  final int id;
  final String username;
  final String comment;
  final String timestamp;

  ReviewWithoutRating({
    required this.id,
    required this.username,
    required this.comment,
    required this.timestamp,
  });
}

class BookReviewWithoutTimestamp {
  final int id;
  final String title;
  final String author;
  final String image;
  final List<ReviewWithoutTimestamp> reviews;
  final int averageRating;

  BookReviewWithoutTimestamp({
    required this.id,
    required this.title,
    required this.author,
    required this.image,
    required this.reviews,
    required this.averageRating,
  });
}

class ReviewWithoutTimestamp {
  final int id;
  final String username;
  final String comment;
  final int rating;

  ReviewWithoutTimestamp({
    required this.id,
    required this.username,
    required this.comment,
    required this.rating,
  });
}

class ReviewContent extends StatefulWidget {
  @override
  _ReviewContentState createState() => _ReviewContentState();
}

class _ReviewContentState extends State<ReviewContent> {
  int _selectedTabIndex = 0;

  Future<List<BookReviewWithoutRating>> fetchReviewsWithoutRating() async {
    final request = Provider.of<CookieRequest>(context, listen: false);
    final response = await request.get(
        'http://localhost:8080/review_book/get_snippet_reviews_without_rating');

    List<BookReviewWithoutRating> reviewsWithoutRating = [];

    for (var bookData in response['reviews']) {
      List<ReviewWithoutRating> reviews = [];
      for (var reviewData in bookData['reviews']) {
        ReviewWithoutRating review = ReviewWithoutRating(
          id: reviewData['id'],
          username: reviewData['username'],
          comment: reviewData['comment'],
          timestamp: reviewData['timestamp'],
        );
        reviews.add(review);
      }

      BookReviewWithoutRating bookReview = BookReviewWithoutRating(
        id: bookData['id'],
        title: bookData['title'],
        author: bookData['author'],
        image: bookData['image'],
        reviews: reviews,
        formattedTimestamp: bookData['formatted_timestamp'],
      );

      reviewsWithoutRating.add(bookReview);
    }

    return reviewsWithoutRating;
  }

  Future<List<BookReviewWithoutTimestamp>>
      fetchReviewsWithoutTimestamp() async {
    final request = Provider.of<CookieRequest>(context, listen: false);
    final response = await request.get(
        'http://localhost:8080/review_book/get_snippet_reviews_without_timestamp');

    List<BookReviewWithoutTimestamp> reviewsWithoutTimestamp = [];

    for (var bookData in response['reviews']) {
      List<ReviewWithoutTimestamp> reviews = [];
      for (var reviewData in bookData['reviews']) {
        ReviewWithoutTimestamp review = ReviewWithoutTimestamp(
          id: reviewData['id'],
          username: reviewData['username'],
          comment: reviewData['comment'],
          rating: reviewData['rating'],
        );
        reviews.add(review);
      }

      BookReviewWithoutTimestamp bookReview = BookReviewWithoutTimestamp(
        id: bookData['id'],
        title: bookData['title'],
        author: bookData['author'],
        image: bookData['image'],
        reviews: reviews,
        averageRating: bookData['average_rating'],
      );

      reviewsWithoutTimestamp.add(bookReview);
    }

    return reviewsWithoutTimestamp;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Container(
          color: const Color.fromRGBO(246, 247, 249, 1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 40.0, right: 40, left: 40),
                child: Text(
                  "Ulasan Buku",
                  style: TextStyle(
                    fontFamily: 'SF-Pro',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -1,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              )
              // Container(
              //   padding:
              //       const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              //   child: Row(
              //     children: [
              //       Expanded(
              //         child: Container(
              //           decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(16),
              //             color: const Color.fromRGBO(236, 239, 242, 1),
              //           ),
              //           child: Padding(
              //             padding: const EdgeInsets.symmetric(horizontal: 20),
              //             child: Row(
              //               children: [
              //                 Image.asset("assets/review/search.png"),
              //                 const SizedBox(
              //                   width: 16,
              //                 ),
              //                 const Expanded(
              //                   child: TextField(
              //                     decoration: InputDecoration(
              //                       hintText: "Cari Buku",
              //                       hintStyle: TextStyle(
              //                         fontFamily: 'SF-Pro',
              //                         fontSize: 16,
              //                         fontWeight: FontWeight.w400,
              //                         letterSpacing: -1,
              //                         color: Color.fromRGBO(101, 122, 146, 1),
              //                       ),
              //                       border: InputBorder.none,
              //                       focusedBorder: UnderlineInputBorder(
              //                         borderSide: BorderSide(
              //                           color: Color.fromRGBO(186, 191, 255, 1),
              //                           width: 2,
              //                         ),
              //                       ),
              //                     ),
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              ,
              Container(
                child: Column(
                  children: [
                    TabBar(
                      isScrollable: true,
                      labelPadding: const EdgeInsets.only(right: 12),
                      tabs: [
                        _buildTab("Terbaru", 0),
                        _buildTab("Rating Tertinggi", 1),
                      ],
                      onTap: (index) {
                        setState(() {
                          _selectedTabIndex = index;
                        });
                      },
                      indicator: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 0.0, color: Colors.transparent)),
                      ),
                      indicatorWeight: 0.0,
                      indicatorColor: Colors.transparent,
                      labelColor: Colors.white,
                      unselectedLabelColor:
                          const Color.fromRGBO(101, 122, 146, 1),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      height: MediaQuery.of(context).size.height + 40,
                      width: MediaQuery.of(context).size.width,
                      child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          Material(
                            color: const Color.fromRGBO(246, 247, 249, 1),
                            child: Container(
                              padding: const EdgeInsets.only(top: 24),
                              color: const Color.fromRGBO(246, 247, 249, 1),
                              child: FutureBuilder<
                                  List<BookReviewWithoutTimestamp>>(
                                future: fetchReviewsWithoutTimestamp(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return CircularProgressIndicator();
                                  } else if (snapshot.hasError) {
                                    return Text('Error: ${snapshot.error}');
                                  } else {
                                    // Access data for each index
                                    return Column(
                                      children:
                                          snapshot.data!.map((bookReview) {
                                        // Access bookReview.id, bookReview.title, etc.
                                        return Column(
                                          children: [
                                            Container(
                                              child: _buildReviewContent(
                                                  "newest", bookReview),
                                            ),
                                            SizedBox(
                                              height: 12,
                                            )
                                          ],
                                        );
                                      }).toList(),
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                          Material(
                            color: const Color.fromRGBO(246, 247, 249, 1),
                            child: SingleChildScrollView(
                              // Wrap with SingleChildScrollView
                              child: Container(
                                padding: const EdgeInsets.only(top: 24),
                                color: const Color.fromRGBO(246, 247, 249, 1),
                                child: Column(
                                  children: [
                                    FutureBuilder<
                                        List<BookReviewWithoutTimestamp>>(
                                      future: fetchReviewsWithoutTimestamp(),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return CircularProgressIndicator();
                                        } else if (snapshot.hasError) {
                                          return Text(
                                              'Error: ${snapshot.error}');
                                        } else {
                                          // Access data for each index
                                          return Column(
                                            children: snapshot.data!
                                                .map((bookReview) {
                                              // Access bookReview.id, bookReview.title, etc.
                                              return Column(
                                                children: [
                                                  Container(
                                                    child: _buildReviewContent(
                                                        "mostrated",
                                                        bookReview),
                                                  ),
                                                  SizedBox(
                                                    height: 12,
                                                  )
                                                ],
                                              );
                                            }).toList(),
                                          );
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
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
    );
  }

  Widget _buildTab(String text, int index) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: _selectedTabIndex == index
                  ? const Color.fromRGBO(81, 23, 255, 1)
                  : Colors.white,
              // border: Border.all(
              //     color: _selectedTabIndex == index
              //         ? Colors.transparent
              //         : const Color.fromRGBO(213, 219, 226, 1),
              //     width: 1),
            ),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: _selectedTabIndex == index
                    ? Colors.white
                    : const Color.fromRGBO(101, 122, 146, 1),
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          )
        ],
      ),
    );
  }

  Widget _buildReviewContent(String content, dynamic bookReview) {
    int bookid = 0;
    String title = "";
    String image = "";
    String author = "";
    int averageRating = 0;
    String formattedTimestamp = "";
    List<ReviewWithoutRating> reviewsWithoutRating = [];
    List<ReviewWithoutTimestamp> reviewsWithoutTimestamp = [];

    if (bookReview is BookReviewWithoutRating) {
      bookid = bookReview.id;
      title = bookReview.title;
      image = bookReview.image;
      author = bookReview.author;
      formattedTimestamp = bookReview.formattedTimestamp;
      reviewsWithoutRating = bookReview.reviews;
    } else if (bookReview is BookReviewWithoutTimestamp) {
      title = bookReview.title;
      image = bookReview.image;
      author = bookReview.author;
      averageRating = bookReview.averageRating;
      reviewsWithoutTimestamp = bookReview.reviews;
    }

    // Replace with your actual reviews property
    return content == "newest" && content != "mostrated"
        ? Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              // border: Border.all(
              //   color: Color.fromRGBO(236, 239, 242, 1),
              // )
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/review/lastupdate.png",
                      width: 20,
                      height: 20,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "${formattedTimestamp}",
                      style: TextStyle(
                          fontFamily: 'SF-Pro',
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: kashmirBlue600),
                    )
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${title}",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                  fontFamily: 'SF-Pro',
                                  fontSize: 16,
                                  letterSpacing: -0.7,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(8, 4, 22, 1)),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "${author}",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                  fontFamily: 'SF-Pro',
                                  fontSize: 14,
                                  letterSpacing: -0.7,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(132, 151, 172, 1)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4),
                            topRight: Radius.circular(6),
                            bottomLeft: Radius.circular(4),
                            bottomRight: Radius.circular(4)),
                        child: Image.network(
                          '${image}'.replaceFirst("http://images.amazon.com/",
                              "https://m.media-amazon.com/"),
                          fit: BoxFit.cover,
                          width: 36,
                          height: 48,
                        )),
                    const SizedBox(
                      height: 48,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color.fromRGBO(246, 247, 249, 1),
                  ),
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/review/profile-picture.png",
                              width: 24,
                              height: 24,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "rozieistripopo",
                                    style: TextStyle(
                                        fontFamily: 'SF-Pro',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: -0.3,
                                        color:
                                            Color.fromRGBO(132, 151, 172, 1)),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "Aku bacanya sampe ngantuk sumpah recommended abis cuyyyyy",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontFamily: 'SF-Pro',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: -0.4,
                                        color: Color.fromRGBO(66, 80, 98, 1)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "67 ulasan",
                      style: TextStyle(
                          fontFamily: 'SF-Pro',
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(132, 151, 172, 1)),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: const Color.fromRGBO(81, 33, 255, 1),
                      ),
                      child: GestureDetector(
                        // onTap: () {
                        //   Navigator.of(context).push(MaterialPageRoute(
                        //       builder: (context) => const DetailReview()));
                        // },
                        child: Image.asset(
                          "assets/review/right-arrow.png",
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        : Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              // border: Border.all(
              //   color: Color.fromRGBO(236, 239, 242, 1),
              // )
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/review/rating.png",
                      width: 20,
                      height: 20,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      '${averageRating}/5',
                      style: TextStyle(
                          fontFamily: 'SF-Pro',
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: kashmirBlue950),
                    )
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${title}",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                  fontFamily: 'SF-Pro',
                                  fontSize: 16,
                                  letterSpacing: -0.7,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(8, 4, 22, 1)),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "${author}",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                  fontFamily: 'SF-Pro',
                                  fontSize: 14,
                                  letterSpacing: -0.7,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(132, 151, 172, 1)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(4),
                            topRight: Radius.circular(6),
                            bottomLeft: Radius.circular(4),
                            bottomRight: Radius.circular(4)),
                        child: Image.network(
                          "${image}".replaceFirst("http://images.amazon.com/",
                              "https://m.media-amazon.com/"),
                          fit: BoxFit.cover,
                          width: 36,
                          height: 48,
                        )),
                    const SizedBox(
                      height: 48,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color.fromRGBO(246, 247, 249, 1),
                  ),
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/review/profile-picture.png",
                              width: 24,
                              height: 24,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "rozieistripopo",
                                    style: TextStyle(
                                        fontFamily: 'SF-Pro',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: -0.3,
                                        color:
                                            Color.fromRGBO(132, 151, 172, 1)),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "Aku bacanya sampe ngantuk sumpah recommended abis cuyyyyy",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontFamily: 'SF-Pro',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: -0.4,
                                        color: Color.fromRGBO(66, 80, 98, 1)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "67 ulasan",
                      style: TextStyle(
                          fontFamily: 'SF-Pro',
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(132, 151, 172, 1)),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: const Color.fromRGBO(81, 33, 255, 1),
                      ),
                      child: GestureDetector(
                        // onTap: () {
                        //   Navigator.of(context).push(MaterialPageRoute(
                        //       builder: (context) => const DetailReview()));
                        // },
                        child: Image.asset(
                          "assets/review/right-arrow.png",
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ));
  }
}
