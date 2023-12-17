
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sliding_up_panel/sliding_up_panel.dart';

class DetailReview extends StatefulWidget {
  final int bookID;

  const DetailReview({Key? key, required this.bookID}) : super(key: key);

  @override
  _DetailReviewState createState() => _DetailReviewState();
}

class _DetailReviewState extends State<DetailReview> {
  Future<List<Map<String, dynamic>>> fetchGetBookReviews() async {
    var url = Uri.parse(
        'http://localhost:8080/review_book/get_book_reviews/${widget.bookID}');
    var responseDetailReview = await http.get(
      url,
      headers: {"Content-Type": "application/json"},
    );
    var data = jsonDecode(utf8.decode(responseDetailReview.bodyBytes));

    if (data['reviews'].isNotEmpty) {
      List<Map<String, dynamic>> reviewsList = [];
      for (var reviewData in data['reviews']) {
        reviewsList.add({
          'username': reviewData['username'],
          'comment': reviewData['comment'],
          'timestamp': reviewData['timestamp'],
          'rating': reviewData['rating'],
        });
      }
      return reviewsList;
    } else {
      return [];
    }
  }

  bool _isDeleting = false;

  // Function to simulate review deletion with delay
  Future<void> _deleteReview(BuildContext context) async {
    // Show loading indicator
    setState(() {
      _isDeleting = true;
    });

    // Simulate a loading delay
    await Future.delayed(Duration(seconds: 2));

    // Hide loading indicator
    setState(() {
      _isDeleting = false;
    });

    // Show success notification
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Review deleted successfully!'),
        duration: Duration(seconds: 2),
      ),
    );
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
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(81, 33, 255, 1),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
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
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(28)),
                                color: Color.fromRGBO(92, 66, 255, 1),
                              ),
                              child: Image.asset(
                                "assets/review/dummy-book.png",
                                height: 60,
                              ),
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            Text(
                              "Nama Buku",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'SF-Pro',
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 20,
                              ),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                                color: Color.fromRGBO(80, 166, 255, 1),
                              ),
                              child: Text(
                                "60 Ulasan",
                                style: TextStyle(
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
                      SizedBox(
                        height: 44,
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: const [
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
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(32)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                            "assets/review/profile-reviewing-other.png"),
                        SizedBox(
                          width: 12,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 80 - 88,
                          padding: EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 12,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "popo",
                                style: TextStyle(
                                  fontFamily: 'SF-Pro',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(132, 151, 172, 1),
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Text(
                                "Bukunya keren",
                                style: TextStyle(
                                  fontFamily: 'SF-Pro',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        panelBuilder: (controller) {
          return SingleChildScrollView(
            controller: controller,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 40),
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
                          Image.asset("assets/review/upvote-blank.png"),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 20,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color.fromRGBO(92, 66, 255, 1),
                        ),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                              color: Color.fromRGBO(40, 129, 255, 1),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                            child: Container(
                              width:
                                  MediaQuery.of(context).size.width - 80 - 60,
                              padding: const EdgeInsets.only(
                                top: 4,
                                bottom: 4,
                                left: 20,
                                right: 4,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "ramzieistripopo",
                                          style: TextStyle(
                                            fontFamily: 'SF-Pro',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            color: Color.fromRGBO(
                                                255, 255, 255, 0.7),
                                          ),
                                        ),
                                        const Text(
                                          "Bukunya bagus lorem ipsum sir dolot amit",
                                          style: TextStyle(
                                            fontFamily: 'SF-Pro',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
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
                                      // Show confirmation dialog
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: const Text(
                                              'Hapus Ulasan',
                                              style: TextStyle(
                                                fontFamily: 'SF-Pro',
                                                fontWeight: FontWeight.w700,
                                                letterSpacing: -1,
                                                fontSize: 24,
                                                color:
                                                    Color.fromRGBO(8, 4, 22, 1),
                                              ),
                                            ),
                                            content: Text(
                                              'Apa kamu yakin ingin menghapus ulasan ini?',
                                              style: TextStyle(
                                                fontFamily: 'SF-Pro',
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                                color: Color.fromRGBO(
                                                    88, 107, 132, 1),
                                              ),
                                            ),
                                            actions: [
                                              TextButton(
                                                style: TextButton.styleFrom(
                                                  foregroundColor:
                                                      Color.fromRGBO(
                                                          8, 4, 22, 1),
                                                  backgroundColor: Colors.white,
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 24,
                                                    vertical: 20,
                                                  ),
                                                ),
                                                child: const Text(
                                                  'Batal',
                                                  style: TextStyle(
                                                    fontFamily: 'SF-Pro',
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14,
                                                    color: Color.fromRGBO(
                                                        8, 4, 22, 1),
                                                  ),
                                                ),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                              TextButton(
                                                style: TextButton.styleFrom(
                                                  backgroundColor:
                                                      Color.fromRGBO(
                                                          72, 22, 236, 1),
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 24,
                                                    vertical: 20,
                                                  ),
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .pop(); // Close the dialog
                                                  _deleteReview(
                                                      context); // Function to handle review deletion
                                                },
                                                child: const Text(
                                                  'Ya, hapus',
                                                  style: TextStyle(
                                                    fontFamily: 'SF-Pro',
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14,
                                                    color: Colors.white,
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
                                  if (_isDeleting)
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                Colors.white),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}