import 'package:flutter/material.dart';

Widget totalWishlistStyle(totalWishlistedBookbyUser) {
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
          "assets/home/wishlist.png",
          width: 36,
          height: 36,
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          "$totalWishlistedBookbyUser suka buku ini",
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
