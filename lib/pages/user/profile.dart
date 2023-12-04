// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:litracker_mobile/pages/loginPage.dart';

class ProfileContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Transform.scale(
            scale: 1.5,
            child: Image.asset("assets/profile/profile-bg.png"),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      RichText(
                        text: const TextSpan(
                          text: "Profil Saya",
                          style: TextStyle(
                            fontFamily: 'SF-Pro',
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(8, 4, 22, 1),
                            letterSpacing: -0.7,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 76,
                        height: 76,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(246, 247, 249, 1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ClipRRect(
                          child: Image.asset(
                            'assets/profile/profile-picture.png',
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 24,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: const TextSpan(
                              text: "Halo,",
                              style: TextStyle(
                                fontFamily: 'SF-Pro',
                                fontWeight: FontWeight.w300,
                                color: Color.fromRGBO(132, 151, 172, 1),
                                fontSize: 16,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          RichText(
                            text: const TextSpan(
                              text: "Mumu Peri",
                              style: TextStyle(
                                fontFamily: 'SF-Pro',
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(8, 4, 22, 1),
                                fontSize: 20,
                                letterSpacing: -0.7,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 40, horizontal: 24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(246, 247, 249, 1),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                    'assets/profile/profile-upvote.png'),
                                SizedBox(width: 16),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RichText(
                                      text: const TextSpan(
                                        text: "1604",
                                        style: TextStyle(
                                          fontFamily: 'SF-Pro',
                                          fontWeight: FontWeight.w700,
                                          color: Color.fromRGBO(8, 4, 22, 1),
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    RichText(
                                      text: const TextSpan(
                                        text: "Buku Kamu Upvote",
                                        style: TextStyle(
                                          fontFamily: 'SF-Pro',
                                          fontWeight: FontWeight.w400,
                                          color:
                                              Color.fromRGBO(132, 151, 172, 1),
                                          fontSize: 12,
                                          letterSpacing: -0.7,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(width: 16),
                            Image.asset('assets/profile/profile-directto.png'),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(246, 247, 249, 1),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                    'assets/profile/profile-wishlist.png'),
                                SizedBox(width: 16),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RichText(
                                      text: const TextSpan(
                                        text: "1604",
                                        style: TextStyle(
                                          fontFamily: 'SF-Pro',
                                          fontWeight: FontWeight.w700,
                                          color: Color.fromRGBO(8, 4, 22, 1),
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    RichText(
                                      text: const TextSpan(
                                        text: "Buku di Wishlistmu",
                                        style: TextStyle(
                                          fontFamily: 'SF-Pro',
                                          fontWeight: FontWeight.w400,
                                          color:
                                              Color.fromRGBO(132, 151, 172, 1),
                                          fontSize: 12,
                                          letterSpacing: -0.7,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(width: 16),
                            Image.asset('assets/profile/profile-directto.png'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigate to LoginPage here
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 24,
                        ),
                        alignment: Alignment.centerRight,
                        height: 52,
                        width: 140,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                text: "Logout",
                                style: TextStyle(
                                  color: Color.fromRGBO(8, 4, 22, 1),
                                  fontFamily: 'SF-Pro',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Image.asset('assets/profile/profile-logout.png'),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
