import 'package:flutter/material.dart';

class DetailReview extends StatelessWidget {
  const DetailReview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 40),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    child: Image.asset("assets/upvote/left-arrow.png"),
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  "Lihat Semua Ulasan",
                  style: TextStyle(
                    fontFamily: 'SF-Pro',
                    letterSpacing: -0.7,
                    color: Color.fromRGBO(8, 4, 22, 1),
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
            SizedBox(height: 40),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white, // Warna border putih
                  width: 1.5, // Lebar border
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12), // Sudut melengkung di kiri atas
                  topRight:
                      Radius.circular(12), // Sudut melengkung di kanan atas
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset("assets/review/dummy-book.png"),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nature Kingdom",
                        style: TextStyle(
                          fontFamily: 'SF-Pro',
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color.fromRGBO(8, 4, 22, 1),
                          letterSpacing: -1,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Clove Griffith",
                        style: TextStyle(
                          fontFamily: 'SF-Pro',
                          fontSize: 14,
                          letterSpacing: -0.7,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(132, 151, 172, 1),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Semua Ulasan (18)",
                    style: TextStyle(
                      fontFamily: 'SF-Pro',
                      fontSize: 12,
                      letterSpacing: -0.7,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(132, 151, 172, 1),
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      // Tambahkan logika untuk menangani tombol tambah di sini
                    },
                    child: Image.asset(
                      "assets/review/add-icon.png",
                      width: 24,
                      height: 24,
                    ),
                    backgroundColor: Color.fromRGBO(81, 23, 255, 1),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              padding: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Image.asset(
                    "assets/review/profile-picture.png",
                    width: 36,
                    height: 36,
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
                            color: Color.fromRGBO(132, 151, 172, 1),
                          ),
                        ),
                        Text(
                          "Buku keren",
                          style: TextStyle(
                            fontFamily: 'SF-Pro',
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.4,
                            color: Color.fromRGBO(66, 80, 98, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
