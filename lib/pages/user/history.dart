// ignore_for_file: unnecessary_const, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class HistoryContent extends StatelessWidget {
  const HistoryContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Riwayat Bacaan",
                  style: TextStyle(
                    fontFamily: 'SF-Pro',
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -1,
                  ),
                ),
                SizedBox(
                  height: 28,
                ),
                Text(
                  "Halaman Tersimpan",
                  style: TextStyle(
                    color: Color.fromRGBO(88, 107, 132, 1),
                    fontFamily: 'SF-Pro',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 12),
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(80, 166, 255, 1),
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                        child: Text(
                          "60",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'SF-Pro',
                              fontSize: 24,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 240,
                        child: Flexible(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Nama Buku",
                              style: TextStyle(
                                  color: Color.fromRGBO(8, 4, 22, 1),
                                  fontFamily: 'SF-Pro',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "Nama Penulis",
                              style: TextStyle(
                                  color: Color.fromRGBO(132, 151, 172, 1),
                                  fontFamily: 'SF-Pro',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              width: 8,
                            )
                          ],
                        )),
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "assets/history/settings.png",
                            width: 32,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Image.asset(
                            "assets/history/delete.png",
                            width: 32,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
