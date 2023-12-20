import 'package:flutter/material.dart';
import 'package:litracker_mobile/pages/user/utils/color_choice.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

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
        'https://litracker-a01-tk.pbp.cs.ui.ac.id/review_book/get_snippet_reviews_without_rating');

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
        'https://litracker-a01-tk.pbp.cs.ui.ac.id/review_book/get_snippet_reviews_without_timestamp');

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
              const SizedBox(
                height: 20,
              ),
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
                              child: FutureBuilder<List<BookReviewWithoutRating>>(
                                future: fetchReviewsWithoutRating(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState == ConnectionState.waiting) {
                                    return const CircularProgressIndicator();
                                  } else if (snapshot.hasError) {
                                    return Text('Error: ${snapshot.error}');
                                  } else {
                                    // Access data for each index
                                    return SingleChildScrollView( // Wrap the Column with SingleChildScrollView
                                      child: Column(
                                        children: snapshot.data!
                                            .map((bookReview) {
                                          // Access bookReview.id, bookReview.title, etc.
                                          return Column(
                                            children: [
                                              Container(
                                                child: _buildReviewContent("newest", bookReview),
                                              ),
                                              const SizedBox(
                                                height: 12,
                                              )
                                            ],
                                          );
                                        }).toList(),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                          Material(
                            color: const Color.fromRGBO(246, 247, 249, 1),
                            child: SingleChildScrollView( // Wrap the Column with SingleChildScrollView
                              child: Container(
                                padding: const EdgeInsets.only(top: 24),
                                color: const Color.fromRGBO(246, 247, 249, 1),
                                child: SingleChildScrollView( // Wrap the Column with SingleChildScrollView
                                  child: Column(
                                    children: [
                                      FutureBuilder<List<BookReviewWithoutTimestamp>>(
                                        future: fetchReviewsWithoutTimestamp(),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState == ConnectionState.waiting) {
                                            return const CircularProgressIndicator();
                                          } else if (snapshot.hasError) {
                                            return Text('Error: ${snapshot.error}');
                                          } else {
                                            // Access data for each index
                                            return Column(
                                              children: snapshot.data!
                                                  .map((bookReview) {
                                                // Access bookReview.id, bookReview.title, etc.
                                                return Column(
                                                  children: [
                                                    Container(
                                                      child: _buildReviewContent("mostrated", bookReview),
                                                    ),
                                                    const SizedBox(
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
    String latestUsername = "";
    String latestReview = "";

    if (bookReview is BookReviewWithoutRating) {
      bookid = bookReview.id;
      title = bookReview.title;
      image = bookReview.image;
      author = bookReview.author;
      formattedTimestamp = bookReview.formattedTimestamp;
      reviewsWithoutRating = bookReview.reviews;

      // Check if there are any reviews
      if (reviewsWithoutRating.isNotEmpty) {
        // Get the latest review
        ReviewWithoutRating latestReviewObj = reviewsWithoutRating.last;

        // Extract the username and comment
        latestUsername = latestReviewObj.username;
        latestReview = latestReviewObj.comment;
      }
    } else if (bookReview is BookReviewWithoutTimestamp) {
      title = bookReview.title;
      image = bookReview.image;
      author = bookReview.author;
      averageRating = bookReview.averageRating;
      reviewsWithoutTimestamp = bookReview.reviews;
      
      // Check if there are any reviews
      if (reviewsWithoutTimestamp.isNotEmpty) {
        // Get the latest review
        ReviewWithoutTimestamp latestReviewObj = reviewsWithoutTimestamp.last;

        // Extract the username and comment
        latestUsername = latestReviewObj.username;
        latestReview = latestReviewObj.comment;
      }
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
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "${formattedTimestamp}",
                      style: const TextStyle(
                          fontFamily: 'SF-Pro',
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: kashmirBlue600),
                    )
                  ],
                ),
                const SizedBox(
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
                              style: const TextStyle(
                                  fontFamily: 'SF-Pro',
                                  fontSize: 16,
                                  letterSpacing: -0.7,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(8, 4, 22, 1)),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              "${author}",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: const TextStyle(
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
                        borderRadius: const BorderRadius.only(
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
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${latestUsername}",
                                    style: const TextStyle(
                                        fontFamily: 'SF-Pro',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: -0.3,
                                        color:
                                            Color.fromRGBO(132, 151, 172, 1)),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                   Text(
                                    "${latestReview}",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: const TextStyle(
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
                    Text(
                      "${bookReview.reviews.length} ulasan",
                      style: const TextStyle(
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
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      '${averageRating}/5',
                      style: const TextStyle(
                          fontFamily: 'SF-Pro',
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: kashmirBlue950),
                    )
                  ],
                ),
                const SizedBox(
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
                              style: const TextStyle(
                                  fontFamily: 'SF-Pro',
                                  fontSize: 16,
                                  letterSpacing: -0.7,
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(8, 4, 22, 1)),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              "${author}",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: const TextStyle(
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
                        borderRadius: const BorderRadius.only(
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
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${latestUsername}",
                                    style: const TextStyle(
                                        fontFamily: 'SF-Pro',
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: -0.3,
                                        color:
                                            Color.fromRGBO(132, 151, 172, 1)),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "${latestReview}",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: const TextStyle(
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
                    Text(
                      "${bookReview.reviews.length} ulasan",
                      style: const TextStyle(
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
