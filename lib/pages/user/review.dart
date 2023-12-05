// ignore_for_file: unnecessary_const, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ReviewContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Ulasan Buku",
              style: TextStyle(
                fontFamily: 'SF-Pro',
                fontSize: 24,
                fontWeight: FontWeight.w700,
                letterSpacing: -1,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color.fromRGBO(236, 239, 242, 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Image.asset("assets/review/search.png"),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Cari Buku",
                              hintStyle: TextStyle(
                                fontFamily: 'SF-Pro',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                letterSpacing: -1,
                                color: Color.fromRGBO(101, 122, 146, 1),
                              ),
                              border: InputBorder.none,
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromRGBO(186, 191, 255, 1),
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Color.fromRGBO(81, 23, 255, 1),
                    ),
                    child: Text(
                      "Semua Ulasan",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'SF-Pro',
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.transparent,
                      border: Border.all(
                          color: Color.fromRGBO(213, 219, 226, 1), width: 1),
                    ),
                    child: Text(
                      "Ulasan Saya",
                      style: TextStyle(
                        color: Color.fromRGBO(101, 122, 146, 1),
                        fontFamily: 'SF-Pro',
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  border: Border.all(
                    color: Color.fromRGBO(236, 239, 242, 1),
                  )),
              child: Column(children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/review/dummy-book.png"),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nature Kingdom",
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
                            "Clove Griffith",
                            style: TextStyle(
                                fontFamily: 'SF-Pro',
                                fontSize: 14,
                                letterSpacing: -0.7,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(132, 151, 172, 1)),
                          ),
                        ]),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color.fromRGBO(246, 247, 249, 1),
                  ),
                  child: Column(
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/review/profile-picture.png",
                              width: 24,
                              height: 24,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Expanded(
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
                                  Text(
                                    "Buku keren",
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
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/review/profile-picture.png",
                              width: 24,
                              height: 24,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Expanded(
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
                                    "Buku keren",
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
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/review/profile-picture.png",
                              width: 24,
                              height: 24,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Expanded(
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
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "67 ulasan",
                      style: TextStyle(
                          fontFamily: 'SF-Pro',
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(132, 151, 172, 1)),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 4, horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Color.fromRGBO(81, 33, 255, 1),
                      ),
                      child: Image.asset(
                        "assets/review/right-arrow.png",
                      ),
                    ),
                  ],
                ),
              ]),
            )
          ],
        ));
  }
}
