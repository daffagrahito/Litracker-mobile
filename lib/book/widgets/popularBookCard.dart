import 'package:flutter/material.dart';
import 'package:litracker_mobile/pages/user/utils/color_choice.dart';

class PopularBookCard extends StatelessWidget {
  const PopularBookCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 40),
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
          const SizedBox(
            height: 12,
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
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
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 12),
                            decoration: BoxDecoration(
                                color: jaguar500,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(16))),
                            child: Row(
                              children: [
                                Image.asset("assets/home/king.png"),
                                const SizedBox(
                                  width: 8,
                                ),
                                const Text(
                                  "1",
                                  style: TextStyle(
                                      fontFamily: 'SF-Pro',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 24,
                                      color: Colors.white),
                                )
                              ],
                            )),
                        const SizedBox(
                          height: 24,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width - 184,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
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
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      child: Image.asset(
                        "assets/home/dummy-book.png",
                        width: 72,
                        height: 100,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: kashmirBlue50,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(24))),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/home/upvote.png",
                        width: 48,
                        height: 48,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
    );
  }
}
