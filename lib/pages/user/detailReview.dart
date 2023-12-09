// ignore_for_file: unnecessary_const, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class DetailReview extends StatelessWidget {
  const DetailReview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          bottomRight: Radius.circular(40))),
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
                          child: Column(children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(28)),
                                  color: Color.fromRGBO(92, 66, 255, 1)),
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
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 20),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                  color: Color.fromRGBO(80, 166, 255, 1)),
                              child: Text(
                                "60 Ulasan",
                                style: TextStyle(
                                    fontFamily: 'SF-Pro',
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                            )
                          ]),
                        ),
                        SizedBox(
                          height: 44,
                        ),
                      ]),
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
                            fontWeight: FontWeight.w600),
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
                        color: Color.fromRGBO(236, 239, 242, 1),
                        borderRadius: BorderRadius.all(Radius.circular(32))),
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
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "popo",
                                style: TextStyle(
                                    fontFamily: 'SF-Pro',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(132, 151, 172, 1)),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Text(
                                "Bukunya keren",
                                style: TextStyle(
                                    fontFamily: 'SF-Pro',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )),
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
                            Image.asset("assets/review/upvote-blank.png")
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromRGBO(92, 66, 255, 1)),
                          child: const Text(
                            "Tambah Ulasan",
                            style: TextStyle(
                                fontFamily: 'SF-Pro',
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Column(children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: const Text(
                          "Ulasan Kamu",
                          style: TextStyle(
                              fontFamily: 'SF-Pro',
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
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
                                    bottomRight: Radius.circular(20))),
                            child: Container(
                              width:
                                  MediaQuery.of(context).size.width - 80 - 60,
                              padding: const EdgeInsets.only(
                                  top: 4, bottom: 4, left: 20, right: 4),
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
                                                  255, 255, 255, 0.7)),
                                        ),
                                        const Text(
                                          "Bukunya bagus lorem ipsum sir dolot amit",
                                          style: TextStyle(
                                              fontFamily: 'SF-Pro',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Image.asset("assets/review/trash-blue.png")
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ])
                  ],
                ),
              ),
            );
          }),
    );
  }
}
