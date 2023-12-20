// File location: ..lib/pages/user/detailReview.dart
// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:litracker_mobile/book/models/book.dart';
import 'package:litracker_mobile/data/models/user.dart';
import 'package:litracker_mobile/pages/user/utils/color_choice.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:litracker_mobile/pages/user/utils/color_choice.dart';

class DetailReview extends StatefulWidget {
  final int bookID;
  final Book bookReviewed;

  const DetailReview(
      {Key? key, required this.bookID, required this.bookReviewed})
      : super(key: key);

  @override
  _DetailReviewState createState() => _DetailReviewState();
}

class _DetailReviewState extends State<DetailReview> {
  bool isVoted = false;

  int totalUpvotedBookbyUser = 0;

  Future<int> fetchTotalUsersVote() async {
    final requestTotalUsers =
        Provider.of<CookieRequest>(context, listen: false);
    final responseUsersVote = await requestTotalUsers.get(
        'http://localhost:8080/upvote_book/get_upvoting_users/${widget.bookID}');

    return responseUsersVote['total_users_upvote'];
  }

  Future<bool> fetchHasUserUpvoted() async {
    final requestTotalUsers =
        Provider.of<CookieRequest>(context, listen: false);
    final responseUsersVote = await requestTotalUsers.get(
        'http://localhost:8080/upvote_book/get_upvoting_users/${widget.bookID}');

    return responseUsersVote['isUpvote'];
  }

  Future<Map<String, dynamic>> fetchGetBookReviews() async {
    try {
      var url = Uri.parse(
          'http://localhost:8080/review_book/get_book_reviews/${widget.bookID}/');
      var responseDetailReview = await http.get(
        url,
        headers: {"Content-Type": "application/json"},
      );

      if (responseDetailReview.statusCode == 200) {
        var data = jsonDecode(utf8.decode(responseDetailReview.bodyBytes));

        if (data['reviews'].isNotEmpty) {
          List<Map<String, dynamic>> reviewsList = [];
          for (var reviewData in data['reviews']) {
            reviewsList.add({
              'id': reviewData['id'],
              'username': reviewData['username'],
              'comment': reviewData['comment'],
              'timestamp': reviewData['timestamp'],
              'rating': reviewData['rating'],
            });
          }
          return {
            'reviews': reviewsList,
            'reviews_count': data['reviews_count']
          };
        } else {
          return {'reviews': <Map<String, dynamic>>[], 'reviews_count': 0};
        }
      } else {
        throw Exception('Failed to load reviews');
      }
    } catch (e) {
      print(e.toString());
      return {'reviews': [], 'reviews_count': 0};
    }
  }

  Future<void> deleteReview(int reviewId) async {
    final response = await http.delete(
      Uri.parse(
          'http://localhost:8080/review_book/delete_book_reviews/$reviewId/'),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete review');
    }
  }

  Widget buildBody(int amountUlasan) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              decoration: const BoxDecoration(
                color: Color.fromRGBO(81, 33, 255, 1),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      "assets/review/back.png",
                      width: 32,
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(28)),
                            color: Color.fromRGBO(92, 66, 255, 1),
                          ),
                          padding: const EdgeInsets.all(
                              10), // Benerin ini juga buat padding imagenya
                          child: Image.network(
                            widget.bookReviewed.fields.imageUrlL.replaceFirst(
                                "http://images.amazon.com/",
                                "https://m.media-amazon.com/"),
                            height: 60,
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          widget.bookReviewed.fields.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontFamily: 'SF-Pro',
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 20,
                          ),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            color: Color.fromRGBO(80, 166, 255, 1),
                          ),
                          child: Text(
                            "$amountUlasan Ulasan",
                            style: const TextStyle(
                              fontFamily: 'SF-Pro',
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 44,
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: const Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Semua Ulasan",
                    style: TextStyle(
                      fontFamily: 'SF-Pro',
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            FutureBuilder<Map<String, dynamic>>(
              future: fetchGetBookReviews(),
              builder: (BuildContext context,
                  AsyncSnapshot<Map<String, dynamic>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  List<Map<String, dynamic>> reviews =
                      snapshot.data!['reviews'];
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: reviews.length,
                    itemBuilder: (context, index) {
                      var review = reviews[index];
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(32)),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                  "assets/review/profile-reviewing-other.png"),
                              const SizedBox(
                                width: 12,
                              ),
                              Container(
                                width:
                                    MediaQuery.of(context).size.width - 80 - 88,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                  horizontal: 12,
                                ),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: [
                                        Image.asset(
                                          "assets/review/rating.png",
                                          width: 20,
                                          height: 20,
                                        ),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        Container(
                                          child: Text(
                                            review['rating'].toString() +
                                                "/5", // replace "4.5/5" with rating
                                            style: const TextStyle(
                                                fontFamily: 'SF-Pro',
                                                fontWeight: FontWeight.w600,
                                                fontSize: 14,
                                                color: kashmirBlue600),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        review['username'],
                                        style: const TextStyle(
                                          fontFamily: 'SF-Pro',
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: kashmirBlue600,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        review['comment'],
                                        style: const TextStyle(
                                          fontFamily: 'SF-Pro',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          "assets/review/lastupdate.png",
                                          width: 20,
                                          height: 20,
                                        ),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        Container(
                                          child: Text(
                                            review[
                                                'timestamp'], // replace "20 detik yang lalu" with timestamp
                                            style: const TextStyle(
                                                fontFamily: 'SF-Pro',
                                                fontWeight: FontWeight.w300,
                                                fontSize: 12,
                                                color: kashmirBlue600),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
            const SizedBox(
              height: 192,
            )
          ],
        ),
      ),
    );
  }

  late int amountUlasan =
      0; // local variable untuk banyak ulasan yang ada di buku ini
  final String username = loggedInUser!.username;

  @override
  void initState() {
    super.initState();
    fetchGetBookReviews().then((result) {
      setState(() {
        amountUlasan = result['reviews_count'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(246, 247, 249, 1),
      body: SlidingUpPanel(
          minHeight: 164,
          color: const Color.fromRGBO(72, 22, 236, 1),
          maxHeight: MediaQuery.of(context).size.height * 0.93,
          borderRadius:
              const BorderRadius.vertical(top: const Radius.circular(40)),
          body: buildBody(amountUlasan),
          panelBuilder: (controller) {
            return SingleChildScrollView(
              controller: controller,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(top: 20),
                        height: 8,
                        width: 72,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset("assets/review/heart-fill.png"),
                            const SizedBox(),
                            GestureDetector(
                                // Inside the onTap method for upvote
                                // Inside the onTap method for upvote
                                onTap: () async {
                                  final requestToggleUpvote =
                                      Provider.of<CookieRequest>(context,
                                          listen: false);
                                  final response = await requestToggleUpvote.post(
                                      "http://localhost:8080/upvote_book/toggle_upvote_flutter/${widget.bookID}/",
                                      {});

                                  // Check if the book is upvoted or unvoted

                                  String message = response['message'];
                                  // int total_votes =
                                  //     response['total_votes'];
                                  if (message == 'Upvoted' ||
                                      message == 'Unvoted') {
                                    setState(() {
                                      if (message == 'Upvoted') {
                                        // isVoted = true;
                                        // totalUpvotedBookbyUser =
                                        //     total_votes;
                                        fetchTotalUsersVote();
                                      } else {
                                        // isVoted = false;
                                        fetchTotalUsersVote();
                                      }
                                    });
                                  }
                                },
                                child: Container(
                                  child: FutureBuilder<bool>(
                                    future: fetchHasUserUpvoted(),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return CircularProgressIndicator();
                                      } else if (snapshot.hasError) {
                                        return Text('Error: ${snapshot.error}');
                                      } else {
                                        isVoted = snapshot.data!;
                                        return Image.asset(
                                          isVoted
                                              ? "assets/home/upvote_fill.png"
                                              : "assets/home/upvote_blank.png",
                                          width: 36,
                                          height: 36,
                                        );
                                      }
                                    },
                                  ),
                                ))
                          ],
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(92, 66, 255, 1),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 20,
                            ),
                          ),
                          onPressed: () async {
                            TextEditingController reviewController =
                                TextEditingController();
                            String rating = '1';
                            showDialog(
                              context: context,
                              builder: (context) {
                                return StatefulBuilder(
                                  builder: (context, setState) {
                                    return AlertDialog(
                                      title: const Text('Berikan review kamu'),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          TextField(
                                            controller: reviewController,
                                            decoration: const InputDecoration(
                                                hintText:
                                                    "Berikan reviewmu disini"),
                                          ),
                                          Row(
                                            children: <Widget>[
                                              const Text('Rating: '),
                                              DropdownButton<String>(
                                                value: rating,
                                                items: <String>[
                                                  '1',
                                                  '2',
                                                  '3',
                                                  '4',
                                                  '5'
                                                ].map((String value) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: value,
                                                    child: Text(value),
                                                  );
                                                }).toList(),
                                                onChanged: (newValue) {
                                                  setState(() {
                                                    rating = newValue!;
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text('Submit'),
                                          onPressed: () {
                                            Navigator.of(context).pop({
                                              'review': reviewController.text
                                                  .toString(),
                                              'rating': rating
                                            });
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ).then((value) async {
                              if (value != null) {
                                var response = await http.post(
                                  Uri.parse(
                                      'http://localhost:8080/review_book/post_book_reviews/${widget.bookID}/'),
                                  body: {
                                    'username': username,
                                    'comment': value['review'],
                                    'rating': value['rating']
                                  },
                                );

                                if (response.statusCode == 200) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Container(
                                        padding: EdgeInsets.all(4),
                                        child: Row(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(4),
                                              decoration: BoxDecoration(
                                                  color: jaguar400,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              100))),
                                              child: Icon(
                                                Icons.check_circle,
                                                color: Colors
                                                    .white, // Anda dapat menyesuaikan warnanya
                                              ),
                                            ),
                                            SizedBox(
                                                width:
                                                    8.0), // Jarak antara ikon dan teks
                                            Text(
                                              'Ulasan berhasil diposting!',
                                              style: TextStyle(
                                                fontFamily: 'SF-Pro',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      duration: Duration(seconds: 2),
                                      backgroundColor:
                                          jaguar600, // Anda dapat menyesuaikan warnanya
                                      behavior: SnackBarBehavior.floating,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                      margin: EdgeInsets.only(
                                          bottom: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.85,
                                          left: 40,
                                          right: 40),
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Container(
                                        padding: EdgeInsets.all(4),
                                        child: Row(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(4),
                                              decoration: BoxDecoration(
                                                  color: jaguar400,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              100))),
                                              child: Icon(
                                                Icons.error,
                                                color: Colors
                                                    .white, // Anda dapat menyesuaikan warnanya
                                              ),
                                            ),
                                            SizedBox(
                                                width:
                                                    8.0), // Jarak antara ikon dan teks
                                            Text(
                                              'Terdapat kesalahan. Coba lagi!',
                                              style: TextStyle(
                                                fontFamily: 'SF-Pro',
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      duration: Duration(seconds: 2),
                                      backgroundColor:
                                          jaguar600, // Anda dapat menyesuaikan warnanya
                                      behavior: SnackBarBehavior.floating,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                      margin: EdgeInsets.only(
                                          bottom: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.85,
                                          left: 40,
                                          right: 40),
                                    ),
                                  );
                                }
                                fetchGetBookReviews().then((result) {
                                  setState(() {
                                    amountUlasan = result['reviews_count'];
                                  });
                                });
                              }
                            });
                          },
                          child: const Text(
                            "Tambah Ulasan",
                            style: TextStyle(
                              fontFamily: 'SF-Pro',
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "Ulasan Saya",
                            style: TextStyle(
                              fontFamily: 'SF-Pro',
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        FutureBuilder<Map<String, dynamic>>(
                          future: fetchGetBookReviews(),
                          builder: (BuildContext context,
                              AsyncSnapshot<Map<String, dynamic>> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const CircularProgressIndicator();
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else {
                              List<Map<String, dynamic>> reviews =
                                  snapshot.data!['reviews'];
                              // Filter the reviews to only include those posted by the current user
                              reviews = reviews
                                  .where((review) =>
                                      review['username'] == username)
                                  .toList();
                              return ListView.separated(
                                shrinkWrap: true,
                                itemCount: reviews.length,
                                itemBuilder: (context, index) {
                                  var review = reviews[index];
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        "assets/review/profile-reviewing.png",
                                        alignment: Alignment.topLeft,
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      Container(
                                        decoration: const BoxDecoration(
                                          color:
                                              Color.fromRGBO(40, 129, 255, 1),
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(20),
                                            bottomLeft: Radius.circular(20),
                                            bottomRight: Radius.circular(20),
                                          ),
                                        ),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              80 -
                                              60,
                                          padding: const EdgeInsets.only(
                                            top: 12,
                                            bottom: 12,
                                            left: 12,
                                            right: 12,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Flexible(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Image.asset(
                                                          "assets/review/rating.png",
                                                          width: 20,
                                                          height: 20,
                                                        ),
                                                        const SizedBox(
                                                          width: 12,
                                                        ),
                                                        Container(
                                                          child: Text(
                                                            review['rating']
                                                                    .toString() +
                                                                "/5",
                                                            style: const TextStyle(
                                                                fontFamily:
                                                                    'SF-Pro',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 12,
                                                                color: Color
                                                                    .fromARGB(
                                                                        225,
                                                                        255,
                                                                        255,
                                                                        255)),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Container(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 16),
                                                      child: Text(
                                                        review['username'],
                                                        style: const TextStyle(
                                                          fontFamily: 'SF-Pro',
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 14,
                                                          color: Color.fromRGBO(
                                                              255,
                                                              255,
                                                              255,
                                                              0.7),
                                                        ),
                                                      ),
                                                    ),
                                                    Text(
                                                      review['comment'],
                                                      style: const TextStyle(
                                                        fontFamily: 'SF-Pro',
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                    Container(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 16),
                                                      child: Row(
                                                        children: [
                                                          Image.asset(
                                                              "assets/review/lastupdate-indark.png"),
                                                          const SizedBox(
                                                            width: 8,
                                                          ),
                                                          Container(
                                                            child: Text(
                                                              review[
                                                                  'timestamp'],
                                                              style: const TextStyle(
                                                                  fontFamily:
                                                                      'SF-Pro',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                  fontSize: 12,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          172,
                                                                          255,
                                                                          255,
                                                                          255)),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 12,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        title: const Text(
                                                          'Hapus Ulasan',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'SF-Pro',
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            letterSpacing: -1,
                                                            fontSize: 24,
                                                            color:
                                                                Color.fromRGBO(
                                                                    8,
                                                                    4,
                                                                    22,
                                                                    1),
                                                          ),
                                                        ),
                                                        content: const Text(
                                                          'Apa kamu yakin ingin menghapus ulasan ini?',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'SF-Pro',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            fontSize: 14,
                                                            color:
                                                                Color.fromRGBO(
                                                                    88,
                                                                    107,
                                                                    132,
                                                                    1),
                                                          ),
                                                        ),
                                                        actions: [
                                                          TextButton(
                                                            style: TextButton
                                                                .styleFrom(
                                                              foregroundColor:
                                                                  const Color
                                                                      .fromRGBO(
                                                                      8,
                                                                      4,
                                                                      22,
                                                                      1),
                                                              backgroundColor:
                                                                  Colors.white,
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                horizontal: 24,
                                                                vertical: 20,
                                                              ),
                                                            ),
                                                            child: const Text(
                                                              'Batal',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'SF-Pro',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 14,
                                                                color: Color
                                                                    .fromRGBO(
                                                                        8,
                                                                        4,
                                                                        22,
                                                                        1),
                                                              ),
                                                            ),
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                          ),
                                                          TextButton(
                                                            style: TextButton
                                                                .styleFrom(
                                                              backgroundColor:
                                                                  const Color
                                                                      .fromRGBO(
                                                                      72,
                                                                      22,
                                                                      236,
                                                                      1),
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                horizontal: 24,
                                                                vertical: 20,
                                                              ),
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              if (review[
                                                                      'id'] !=
                                                                  null) {
                                                                await deleteReview(
                                                                    review[
                                                                        'id']); // Delete the review
                                                                // Refresh the page
                                                              } else {
                                                                print(
                                                                    'Review ID is null');
                                                              }
                                                              fetchGetBookReviews()
                                                                  .then(
                                                                      (result) {
                                                                setState(() {
                                                                  amountUlasan =
                                                                      result[
                                                                          'reviews_count'];
                                                                });
                                                              });
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .showSnackBar(
                                                                SnackBar(
                                                                  content:
                                                                      Container(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .all(4),
                                                                    child: Row(
                                                                      children: [
                                                                        Container(
                                                                          padding:
                                                                              EdgeInsets.all(4),
                                                                          decoration: BoxDecoration(
                                                                              color: jaguar400,
                                                                              borderRadius: BorderRadius.all(Radius.circular(100))),
                                                                          child:
                                                                              Icon(
                                                                            Icons.check_circle,
                                                                            color:
                                                                                Colors.white, // Anda dapat menyesuaikan warnanya
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                            width:
                                                                                8.0), // Jarak antara ikon dan teks
                                                                        Text(
                                                                          'Ulasan berhasil dihapus!',
                                                                          style:
                                                                              TextStyle(
                                                                            fontFamily:
                                                                                'SF-Pro',
                                                                            fontWeight:
                                                                                FontWeight.w400,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  duration:
                                                                      Duration(
                                                                          seconds:
                                                                              2),
                                                                  backgroundColor:
                                                                      jaguar600, // Anda dapat menyesuaikan warnanya
                                                                  behavior:
                                                                      SnackBarBehavior
                                                                          .floating,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            24.0),
                                                                  ),
                                                                  margin: EdgeInsets.only(
                                                                      bottom: MediaQuery.of(context)
                                                                              .size
                                                                              .height *
                                                                          0.85,
                                                                      left: 40,
                                                                      right:
                                                                          40),
                                                                ),
                                                              );
                                                              Navigator.of(
                                                                      context)
                                                                  .pop(); // Close the dialog
                                                            },
                                                            child: const Text(
                                                              'Ya, hapus',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'SF-Pro',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 14,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                                child: Image.asset(
                                                    "assets/review/trash-blue.png"),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                                separatorBuilder: (context, irndex) {
                                  return const SizedBox(height: 10);
                                },
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
