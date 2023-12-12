// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import '../../book/models/book.dart';

class BookDetailPage extends StatelessWidget {
  final Book book;

  final kashmirBlue50 = Color.fromRGBO(246, 247, 249, 1);
  final kashmirBlue100 = Color.fromRGBO(236, 239, 242, 1);
  final kashmirBlue300 = Color.fromRGBO(176, 187, 201, 1);
  final kashmirBlue500 = Color.fromRGBO(101, 122, 146, 1);
  final kashmirBlue600 = Color.fromRGBO(88, 107, 132, 1);
  final kashmirBlue950 = Color.fromRGBO(34, 39, 47, 1);
  final jaguar100 = Color.fromRGBO(217, 221, 255, 1);
  final jaguar400 = Color.fromRGBO(110, 101, 255, 1);
  final jaguar500 = Color.fromRGBO(92, 66, 255, 1);
  final jaguar600 = Color.fromRGBO(81, 33, 255, 1);
  final jaguar700 = Color.fromRGBO(72, 22, 236, 1);
  final jaguar950 = Color.fromRGBO(8, 4, 22, 1);

  // Paling atas untuk upvote
  Widget totalUpvoteStyle() {
    return Container(
      width: 200,
      alignment: Alignment.center,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(28)),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            "assets/home/upvote.png",
            width: 36,
            height: 36,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            "1604 upvote buku ini",
            style: TextStyle(
                fontFamily: 'SF-Pro',
                letterSpacing: -0.7,
                fontSize: 12,
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }

  // Buku
  Widget imageBookStyle() {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(4),
            bottomLeft: Radius.circular(4),
            topRight: Radius.circular(12),
            bottomRight: Radius.circular(12)),
        child: Image.network(
          book.fields.imageUrlL,
          width: 184,
          height: 232,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // Shadow buku
  // Widget shadowBookEffect() {
  //   return BoxDecoration(
  //     boxShadow: [
  //       BoxShadow(
  //         color: Colors.black.withOpacity(0.5),
  //         spreadRadius: 0,
  //         blurRadius: 10,
  //         offset: Offset(4, 4), // Offset(x, y)
  //       ),
  //     ],
  //   );
  // }

  // Style tahun buku
  Widget year() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: jaguar700,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Text(
        book.fields.publishedYear.toString(),
        textAlign: TextAlign.center,
        style: TextStyle(
            fontFamily: 'SF-Pro',
            fontSize: 12,
            fontWeight: FontWeight.w900,
            color: Colors.white),
      ),
    );
  }

  // Atur add to wishlist
  Widget userAddToWishlist() {
    return Container(
        child: Image.asset(
      "assets/home/wishlist_blank.png",
      width: 36,
      height: 36,
    ));
  }

  // Atur add to wishlist
  Widget userUpvotingBook() {
    return Container(
        child: Image.asset(
      "assets/home/upvote_blank.png",
      width: 36,
      height: 36,
    ));
  }

  // Judul buku
  Widget titleBook() {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        book.fields.title,
        style: TextStyle(
            fontFamily: 'SF-Pro',
            fontWeight: FontWeight.w900,
            fontSize: 32,
            color: jaguar950),
      ),
    );
  }

  // Author
  Widget authorofBook() {
    return Container(
      alignment: Alignment.centerLeft,
      child: Text(
        book.fields.author,
        style: TextStyle(
            fontFamily: 'SF-Pro',
            fontWeight: FontWeight.w700,
            color: kashmirBlue500,
            fontSize: 16),
      ),
    );
  }

  // ISBN
  Widget ISBN_ofBook() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
          color: kashmirBlue50,
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Row(
        children: [
          Container(
            child: Text(
              "ISBN",
              style: TextStyle(
                  fontFamily: 'SF-Pro',
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: kashmirBlue600),
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Container(
            child: Text(
              book.fields.isbn,
              style: TextStyle(
                  fontFamily: 'SF-Pro',
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                  color: kashmirBlue950),
            ),
          ),
        ],
      ),
    );
  }

  // Back to Home
  Widget backtoHome() {
    return Container(
      child: Image.asset(
        "assets/home/back.png",
        width: 48,
        height: 48,
      ),
    );
  }

  // Has read book -> input number of page
  Widget readingHistory(theWidth) {
    return Container(
      width: theWidth,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
          color: jaguar400,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Text(
        "Tandai Sedang Dibaca",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontFamily: 'SF-Pro',
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: Colors.white),
      ),
    );
  }

  BookDetailPage({required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    // BG Grey -> Buku
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        color: kashmirBlue100,
                        padding: EdgeInsets.only(
                          top: 60,
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              totalUpvoteStyle(),
                              SizedBox(
                                height: 24,
                              ),
                              imageBookStyle(),
                              SizedBox(
                                height: 20,
                              )
                            ]),
                      ),
                    ),
                    Container(
                      color: kashmirBlue100,
                      height: 40,
                      child: Container(
                        height: 20,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40))),
                      ),
                    ),
                    // BG White -> Informasi Buku
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                year(),
                                Row(
                                  children: [
                                    userAddToWishlist(),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    userUpvotingBook()
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            child: Column(
                              children: [
                                titleBook(),
                                SizedBox(
                                  height: 8,
                                ),
                                authorofBook(),
                                SizedBox(
                                  height: 24,
                                ),
                                ISBN_ofBook(),
                                SizedBox(
                                  height: 160,
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
            ), // Mulai dari sini
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                padding:
                    EdgeInsets.only(top: 20, bottom: 60, left: 40, right: 40),
                decoration: BoxDecoration(
                    color: jaguar700,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    )),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: backtoHome()),
                    SizedBox(
                      width: 24,
                    ),
                    readingHistory(MediaQuery.of(context).size.width - 152)
                  ],
                ),
              ),
            )
            // Sampai sini
          ],
        ),
      ),
    );
  }
}
