import 'package:flutter/material.dart';

class PopularBookCard extends StatelessWidget {
  const PopularBookCard({super.key});

  @override
  Widget build(BuildContext context) {
    final jaguar500 = Color.fromRGBO(92, 66, 255, 1);
    final jaguar950 = Color.fromRGBO(8, 4, 22, 1);
    final kashmirBlue400 = Color.fromRGBO(132, 151, 172, 1);

    return Container(
      width: 200,
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                    decoration: BoxDecoration(
                      color: jaguar500,
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    child: Row(
                      children: [
                        Image.asset("assets/home/king.png"),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "1",
                          style: TextStyle(
                            fontFamily: 'SF-Pro',
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Container(
                    width: 184,
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
                            color: jaguar950,
                          ),
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
                            color: kashmirBlue400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Image.asset(
                "assets/home/dummy-book.png",
                width: 72,
                height: 100,
              )
            ],
          ),
          SizedBox(
            height: 24,
          ),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: kashmirBlue400,
              borderRadius: BorderRadius.all(Radius.circular(24)),
            ),
            child: Row(
              children: [
                Image.asset(
                  "assets/home/upvote.png",
                  width: 48,
                  height: 48,
                ),
                SizedBox(
                  width: 16,
                ),
                Container(
                  width: 120,
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
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Total Upvote",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          fontFamily: 'SF-Pro',
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
